function [HERFD,E,fig] = onepotRIXS_iz(file,n,central_pix,varargin)
% refactored to call patched onepot_iz()

I0_corr = true;


skip=0;
for i = 1:numel(varargin)
    if skip>0
        skip = skip -1;
        continue
    end
    
    switch lower(varargin{i})
        case 'i0'
            I0_corr  = varargin{i+1};
            if ischar(I0_corr)
                I0_corr = eval(I0_corr);
            end
            skip=1;
    end
end


if nargin<2
    n=3;   % RIXS_h=findobj(fig,'type','surface');

end

if nargin>=3
    if ischar(central_pix)
        
        central_pix=eval(central_pix);
    end
end


if ischar(n)
    n=str2double(n);
end


if nargin==0
    fig= gcf;    
    RIXS_h=findobj(fig,'type','surface');
    file = get(get(get(RIXS_h,'parent'),'title'),'string');
else
    fig = findobj('type','figure','name',[file '_scan']);
end

if isempty(fig)
    if iscellstr(file)
        fig_file=[];
    else
        fig_file=dir( [file '_scan.fig']);
    end
    
    if isempty(fig_file)
        onepot_iz(file ,'saveTo','./','readData',1,'scanParam','mono');
        fig = findobj('type','figure','name',[file '_scan']);
    else
        fig = openfig(fig_file.name);%str2num
    end
    set(fig,'name',[file '_scan'])

    %fig=fig(1);
    RIXS_h=findobj(fig,'type','surface');
end

% Jeff Babicz: try to fix the issue with RIXS_h
% OK figured out all of the code below is necessary for making the HERFD XAS spectrum.
% However, when you first run the analysis several variables do not get assigned properly,
% resulting in errors. When you run the analysis a second time, providing the pixel center and
% width parameters it runs without any errors. A possible solution could be to add a switch to 
% control whether or not the code below is ran.
if I0_corr   
    RIXS_h_not_corrected = RIXS_h(1);
    RIXS_h = RIXS_h(end);
else
    RIXS_h_not_corrected = RIXS_h(end);
    RIXS_h = RIXS_h(1);
end

XAS_h = findobj(fig,'type','line','displayname','TFY');
XAS_h = XAS_h(end);
XAS_ax = get(XAS_h(end),'parent');
E=get(RIXS_h,'xdata');


disp(E);

if isequal(E,(1:numel(E)))
    [~,E_] = unix(['ls ' file '*sif | grep -Eo [0-9]{4}\.[0-9]{2}']);
    E_=str2num(E_);
    if numel(E) == numel(E_)
        E=E_;
        set(RIXS_h,'xdata',E)
        set(RIXS_h_not_corrected,'xdata',E)
        set(XAS_h,'xdata',E)
        
        set(get(RIXS_h,'parent'),'xlim',[min(E),max(E)])
        xlabel(get(RIXS_h,'parent'),'mono')
        
        set(get(RIXS_h_not_corrected,'parent'),'xlim',[min(E),max(E)])
        xlabel(get(RIXS_h_not_corrected,'parent'),'mono')
        
        set(get(XAS_h,'parent'),'xlim',[min(E),max(E)])
        xlabel(get(XAS_h,'parent'),'mono')

    end
end

y=get(RIXS_h,'ydata');
RIXS=get(RIXS_h,'cdata');


if nargin<3
    
    figure(fig)
    h=msgbox('Click twice on the RIXS map to indicate the HERFD region.');
    uiwait(h)
    
    c = ginput(2);
    
    c(:,2) = round(c(:,2));
    min_pix = min(c(:,2));
    max_pix = max(c(:,2));
    x_range   = E>min(c(:,1));
elseif numel(central_pix)==2
    min_pix = central_pix(1);
    max_pix = central_pix(2);
    x_range = numel(E)+[-10:0];
else
    min_pix = central_pix-round(n/2);
    max_pix = central_pix+round(n/2);
    x_range = numel(E)+[-10:0];
end

if nargin<3
    spec=sum(RIXS(min_pix:max_pix ,x_range),2);
    [max_spec ,max_idx] = max(spec);
    start = find(  spec(1:max_idx) < max_spec/10 ,1,'last');
    if isempty(start); start=1; end
    stop = find(  spec(max_idx:end) < max_spec/10 ,1,'first') +max_idx;
    if isempty(stop); stop=numel(spec) ; end
    
    %f = fit([start:stop]', spec(start:stop),'gauss1');
    f = fit([1:size(spec)]',spec,'gauss1');
    %f = voigtfit([1:size(spec)]',spec,[(min_pix+max_pix)/2.,3,3],[min_pix, max_pix],0);
    central_pix = round(f.b1)+min_pix-1;
    fprintf('min_pix-1: %d\n',min_pix-1);
    fprintf('central_pix afte fitting: %d \n', central_pix);
    fig_fit=figure()
    plot([start:stop]',spec(start:stop))
    hold on;
    plot(f)
end

figure(fig)

display(central_pix);
range_pix = [0:n-1] - floor(n/2);
display(range_pix);

HERFD = sum(RIXS( central_pix +range_pix,:),1 );

hold(XAS_ax,'on')
plot(XAS_ax,E,HERFD,'r','displayname','HERFD','tag',file)

h=flipud(findobj(XAS_ax,'type', 'line'));
for i=1:numel(h); X = get(h(i),'XData');Y = get(h(i),'YData');  factor(i) =trapz(X(x_range),Y(x_range)); set(h(i),'YData',Y/factor(i));end

if numel(h)>=2
    c=distinguishable_colors(numel(h));
    for i=2:numel(h);
        set(h(i),'displayname',['HERFD' num2str(i-1)],'color',c(i,:));
    end
    
    
    legend(XAS_ax,get(h,'displayname'))

end


if nargout ==0
   
   fileSave=strcat('extract_',file);
   fileSave=strcat(fileSave,'.txt');
   fid=fopen(fileSave,'wt');
   fprintf(fid,'\nE\tHERFD\tTFY\n');
   fprintf(fid,'%f\t%f\t%f\n',[ E(:),  HERFD(:) ,sum(RIXS,1)' ]');
   fclose(fid);
   
   HERFD = [ file,sprintf('\nE\tHERFD\tTFY\n') , sprintf('%f\t%f\t%f\n',[ E(:),  HERFD(:) ,sum(RIXS,1)' ]') ];
      
end
