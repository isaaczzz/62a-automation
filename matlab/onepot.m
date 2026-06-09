%ONEPOT     All in one SIF file analysis
%
%   Syntax:
%     [corr_signal,nobcg_signal,raw_signal,bcg] = ONEPOT(file_name)
%     [corr_signal,nobcg_signal,raw_signal,bcg] = ONEPOT(file_name,'parameter name','value',...)
%   !!! dimosthenis 04/2019---> the output is [A,B,C] =
%   ONEPOT(file_name,'parameter name','value',...) 
%    where B and C are structures with sub-arrays

%
%   Synopsis:
%     ONEPOT analyzes SIF files matching the string file_name and draw
%     maximum of 4 analysis plots. The final result is a pure X-ray signal
%     corrected for banana shape.
%
%     All the input and output arguments in ONEPOT are optional. If no
%     file_name is given 'data.sif' file is analyzed.
%
%   Input:
%     file_name    - string holding the .sif file path (wildcards can be
%                    used).
%     'parameter name' - name of an additional parameter.
%
%   Output:
%     corr_signal  - final signal (2048x2048 array) corrected for bacground
%                    and banana shape
%     nobcg_signal - raw signal corrected for bacground counts
%     raw_signal   - raw signal
%     bcg          - bacground frame
%
%   Parameters:
%     Treshold     - two element array containing values of X-ray photon
%                    minimal and maximal intensity in ADU. In no value is
%                    given the Treshold is set to [100 1200]. If single
%                    value is given the maximal intenisty is inf.
%     fileNumbers  - indexing parameter used to narrow the file range.
%     scanNumbers  - indexing parameter used to narrow the scans range.
%     drawingMode  - integer specifing the number of analysis plots:
%                    0 - no plots
%                    1 - draw corrected image
%                    2 - draw corrected image and its sum spectrum
%                    3 or 4 - draw corrected image, its sum spectrum,
%                    counts histograms, and counts per frame.
%     scan         - if given spectra for each measuremets are plotted in
%                    (no value)
%
%   See also sifFiles

% Tsu-Chien Weng, November 2015
% Stanislaw Nowak, February 2016

function varargout=onepot(files,varargin)%fileNbrs,drawing_mode,t)
if nargin<1, files='data.sif'; end



Treshold = [];
fileNbrs = 0;
drawing_mode = 5;
scanNbrs = 0;
t = [];
scan = false;
scanParam = '';
skip=0;
save_data = false;
read_data = false;
label_X = 'Pixel Column';
bcg=[];
evolution = false;
bcgAdjust = true;
extract_ascii_flag = false;
file_postfix = ''

for i = 1:numel(varargin)
    if skip>0
        skip = skip -1;
        continue
    end
    
    if isnumeric(varargin{i})
        Treshold = varargin{i};
        continue
    end
    
    switch lower(varargin{i})
        case 't'
            t  = varargin{i+1};
            if ischar(t)
                t = eval(t);
            end
            skip=1;
        case {'treshold' 'threshold'}
            Treshold = varargin{i+1};
            if ischar(Treshold)
                Treshold = eval(Treshold);
            end
            skip=1;
        case lower('fileNumbers')
            fileNbrs = varargin{i+1};
            if ischar(fileNbrs)
                fileNbrs = eval(fileNbrs);
            end
            skip = 1;
        case lower( 'scanNumbers')
            scanNbrs = varargin{i+1};
            if ischar(scanNbrs)
                scanNbrs = eval(scanNbrs);
            end
            skip = 1;
        case lower({'drawingMode' 'draw' 'drawMode'})
            drawing_mode = varargin{i+1};
            if ischar(drawing_mode)
                drawing_mode = eval(drawing_mode);
            end
            skip = 1;
        case lower('scan')
            scan = true;
        case lower({'scanParameter','scanParam'})
            scan = true;
            scanParam =  varargin{i+1};
            skip = 1;
        case lower({'E' 'energy'})
            X = varargin{i+1};
            label_X = 'Energy';
            skip = 1;
        case lower({'extract' 'ectractAscii'})
            extract_ascii_flag = varargin{i+1};
            skip = 1;
        case lower({'saveTo' 'saveFolder'})
            save_path = varargin{i+1};
            save_data = any(save_path);
            skip = 1;
        case lower({'saveAs' 'postfix'})
            file_postfix = varargin{i+1};
            skip = 1;
        case lower({'.mat','check_mat','readData'})
            read_data = varargin{i+1};
            if ischar(read_data)
                read_data = eval(read_data);
            end
            skip = 1;
        case lower({'bcg' , 'background'})
            bcg = varargin{i+1};
            if isscalar(bcg) && (bcg == '0' || bcg == 0)
                bcg = '0';
            elseif ischar(bcg)
                sifInfo = sifread(bcg);
                allFrame = zeros(sifInfo.Width,sifInfo.Height);
                for frame=1:sifInfo.NumFrames
                    oneFrame = sifread(bcg,frame);
                    allFrame = allFrame + oneFrame.imageData;
                end
                bcg = allFrame / sifInfo.NumFrames;
                bcg_counts = 0;
            end
            skip = 1;
        case lower({'evolution' 'evol'})
            evolution=true;
        case lower({'noevolution' 'noevol'})
            evolution=false;
        case lower('bcgAdjust')
            bcgAdjust = varargin{i+1};
            if ischar(bcgAdjust)
                bcgAdjust = eval(bcgAdjust);
            end
            skip = 1;
        case lower({'median'})
            evolution=true;
        otherwise
            fprintf('Wrong option: '), disp(varargin{i})
    end
end

%Treshold = sort(Treshold);

if isempty(Treshold)
    Treshold = [60 100 170 2000];% [80 105 120 10000];%[100 150 200 2500 ];
elseif numel(Treshold)==1
    Treshold(2) = Treshold;
    Treshold(4) = 2^16;
    Treshold(1) = Treshold(2)*.8;
    Treshold(3) = Treshold(2)*1.1;
elseif numel(Treshold)==2
    Treshold(2,4) = Treshold;
    Treshold(1) = Treshold(2)*.8;
    Treshold(3) = Treshold(2)*1.1;
elseif numel(Treshold)==3
    Treshold(4) = Treshold(3); 
    Treshold(3) = Treshold(2)*1.1;
end

if iscell(files)
    file_name=files{1};
else
    file_name=files;
end

if read_data && exist( [ strrep(file_name,'*','') file_postfix '.mat' ] , 'file')
    a  = whos('-file',[ strrep(file_name,'*','') file_postfix '.mat' ]);
    if all(ismember(...
            { 'corr_signal','signal_bkgFree','bcg_counts','raw','total_counts','total_counts2','t','Treshold','bcg','his','bcg_free','bcg_adj','fileNbrs','frameIndex' ,'scanNbrs'}...
            ,{a.name}...
            ))
        S = load([ strrep(file_name,'*','') file_postfix '.mat' ],'Treshold','fileNbrs','scanNbrs','total_counts2');
        if isequal(S.Treshold,Treshold) && isequal(S.fileNbrs,fileNbrs) && isequal(S.scanNbrs,scanNbrs) && isstruct(S.total_counts2)
            scan_data = [];
            load([ strrep(file_name,'*','') file_postfix '.mat' ])
            if scan && isempty(scan_data)
                read_data = false;
            end
        else
            read_data = false;
        end
    else
        read_data = false;
    end
else
    read_data = false;
end


flist = sifFindFiles(files,fileNbrs);


if ~read_data
    info = sifread(flist{1});
    measue_time = info.exposureTime.* info.NumFrames;
    
    if isscalar(bcg) && bcg == '0'
        sifInfo = sifread(file_name);
        bcg = zeros(sifInfo.Width,sifInfo.Height);
    end
    if isempty(bcg)
        try
            [bcg,zpFWHM,~,N,total_counts,bcg_counts,~,~,hist,specs] = sifBatchBackground(flist,scanNbrs,[]);
            if scanNbrs ==0
                frameIndex = true(size(total_counts));
            else
                frameIndex = false(size(total_counts));
                frameIndex(scanNbrs) = true;
            end
            % [~,frameIndex] = sifCheckFrames(total_counts);
            % if any(~frameIndex)
            %     [bcg,zpFWHM,~,N,~,bcg_counts] = sifBatchBackground(flist,frameIndex,[]);
            % %     f_totCounts = figure;
            % %     plot(total_counts);
            % %     hold on
            % %     a= total_counts;
            % %     a(frameIndex) = NaN;
            % %     plot(a,'ro')
            % %     xlabel('Frame no')
            % %     ylabel('Counts [ADU]')
            % %     title(file_name,'interpreter','none');
            % %     legend({'total counts' 'bad frames'});
            % end
        catch err
            if isequal(err.message ,'Not enough frames or sif files')
                sifInfo = sifread(file_name);
                bcg = zeros(sifInfo.Width,sifInfo.Height);
                frameIndex =1;
                bcg_counts = 0;
                total_counts = 0;
            else
                rethrow(err);
            end
        end
    else
        frameIndex =scanNbrs;
        bcg_counts = 0;
        total_counts = 0;
    end
    %bcg = sifBacgroundAdjust(bcg,raw,hist,'std');
    
%     if nargin<2 || isempty(Treshold)
%         Treshold = [100 1200];
%     elseif numel(Treshold)==1
%         Treshold(2) = 2^16;
%     end
%     
    bcg_info = [];
    his_prep = [];
    
    % if evolution
    %     [signal_bkgFree,~,his_prep,~,~,~,bcg_info] =  sifAnalyze(files,Treshold(1),bcg,fileNbrs,frameIndex,'scan',scan,'bcgAdjust',bcgAdjust);
    %     bcg = bcg_info.bcg;
    %     [~ , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
    %     [signal_bkgFree,total_counts2,his,bcg_free,bcg_adj,raw] =  sifAnalyze(files,Treshold(2:end),bcg,fileNbrs,frameIndex,'scan',scan,'t',t,'bcgAdjust',bcgAdjust);
    %     [corr_signal , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
    % else
    %     [signal_bkgFree,total_counts2,his,bcg_free,bcg_adj,raw] =  sifAnalyze(files,Treshold(2:end),bcg,fileNbrs,frameIndex,'scan',scan,'bcgAdjust',bcgAdjust);
    % 
    %     [corr_signal , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
    % end

    %% rr test 2024/04/14
    if evolution
        [signal_bkgFree,~,his_prep,~,~,~,bcg_info] =  sifAnalyze(flist,Treshold(1),bcg,fileNbrs,frameIndex,'scan',scan,'bcgAdjust',bcgAdjust);
        bcg = bcg_info.bcg;
        [~ , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
        [signal_bkgFree,total_counts2,his,bcg_free,bcg_adj,raw] =  sifAnalyze(flist,Treshold(2:end),bcg,fileNbrs,frameIndex,'scan',scan,'t',t,'bcgAdjust',bcgAdjust);
        [corr_signal , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
    else
        [signal_bkgFree,total_counts2,his,bcg_free,bcg_adj,raw] =  sifAnalyze(flist,Treshold(2:end),bcg,fileNbrs,frameIndex,'scan',scan,'bcgAdjust',bcgAdjust);
        
        [corr_signal , t] = sifAutoCorrelation(sum(signal_bkgFree,3),[],t);
    end

    %%
    
    corr_signal_posive = corr_signal;
    corr_signal_posive(corr_signal_posive<0) = 0;
    
    if frameIndex ==0
        total_counts = sum(total_counts2.raw);
        frameIndex = true(size(total_counts));
    end
    
    
    if scan
        for i=1:numel(flist)
            scan_data(:,i) = sum(sifAutoCorrelation(signal_bkgFree(:,:,i),[],t));
        end
        signal_bkgFree = sum(signal_bkgFree,3);
    else
        scan_data = [];
    end
    
    if save_data
        save([ save_path , strrep(file_name,'*','') file_postfix '.mat' ] , ...
            'scan_data','corr_signal','signal_bkgFree','bcg_counts','raw','total_counts','total_counts2','t','Treshold','bcg','bcg_info','his','his_prep','bcg_free','bcg_adj','fileNbrs','frameIndex' ,'scanNbrs','measue_time')%, 'adu_map' )
    end
end


hfig = [];
    %X = 1:size(corr_signal,2);
    if exist('X','var')
        Y = 1:size(corr_signal,1);
    else
        X = 1:size(corr_signal,2);
        Y = 1:size(corr_signal,1);
    end
if drawing_mode >0
   % if iscell(files)
    %   files = files{1};
   % end
    hfig=figure('Name',[file_name file_postfix]);
    fpos=get(hfig,'position');
    switch drawing_mode
        case 1
            s1 =1;s2=1;
        case 2
            s1 =2;s2=1;
            order = [1 2];
            set(hfig,'position',fpos+[0 -fpos(4) 0 fpos(4)])
        otherwise
            order = [1 3 2 4];
            s1 =2;s2=2;
            set(hfig,'position',fpos+[0 -fpos(4) fpos(3) fpos(4)])
    end
    %%% Plotting final corrected image
    
    

    
    subplot(s1,s2,1); im_h = imagesc(X,Y,log(corr_signal_posive)); title(file_name,'interpreter','none');
    shading flat; axis ij
    xlabel(label_X); ylabel('Pixel Row')
    set(im_h,'UserData',signal_bkgFree,'Tag',file_name);
    
    if drawing_mode >=2
        
        %%% Plotting spectra
        subplot(s1,s2,order(2));
        
        raw_ = [sum(raw)', sum(sum(bcg_adj(frameIndex))*bcg)'];
        corr_ = [ squeeze(sum(raw) - sum(sum(bcg_adj(frameIndex))*bcg))' , sum(corr_signal)'  ];
        
        [ax,line1,line2] = plotyy(X, raw_ , X, corr_ );
        
        set(line2,{'color'},{[ .3 .75 .93];'b'},{'LineStyle'},{':';'-'})
        set(line1,{'color'},{'r' ;[1 .6 .78]},{'LineStyle'},{':';':'})
        set(ax,{'ycolor'},{'r';'b'})
        
        set(ax(2), 'YTickMode' ,'auto')
        set(ax(2), 'XTickMode' ,'manual','XTick',[]);
        
        ylabel(ax(2),'Bacground Corrected Counts [ADU]')
        set(ax(1), 'YTickMode' ,'auto')
        ylabel(ax(1),'Raw Counts [ADU]')
        
        [max_corr,max_ind] = max(corr_(:,2));
        ylim_range = max(range(corr_(:)),range(raw_(:)));
        bottom = min(...colormap
            max_corr- (raw_(max_ind,1) - min(raw_(:))),...
            min(corr_(:))...
            );
        top = max(bottom + ylim_range , max(corr_(:)));
        ylim(ax(2),[bottom, top]) %max(corr_(:)) - [ylim_range 0])
        ylim(ax(1),min(raw_(:)) +[0 range([bottom, top])]);
        xlim(ax(1),[min(X) max(X)])
        xlim(ax(2),[min(X) max(X)])
        box(ax(1),'off')
        xlabel(label_X)
        title('Spectrum');
        lgnd =  legend('Raw','Background','Raw - bacground',...
            sprintf('Corrected %.0f',sum(sum(corr_signal)) ));
        set(lgnd,'color','none');
        
        if extract_ascii_flag == true
             fileSave=strcat('extract_',file_name);
%added line below
%            fileSave=strcat('extract_',file_name,num2str(fnum));
            fileSave=strcat(fileSave,'.txt');
            fid=fopen(fileSave,'wt');
            Kappa=get(line2,'YData');
            fprintf(fid,'%d\t%f\n',[X(:), sum(corr_signal)']');
            fclose(fid);
        end
    end
    if drawing_mode >=3
        %%% Plotting histograms
        subplot(s1,s2,2); plot(his(:,1:5)); set(gca,'yScale','log'), xlim([0 1.3*Treshold(4)]);
        xlabel('Counts [ADU]')
        ylabel('Frequency')
        title('Histograms');
        hold on
        c_order = get(gca,'colororder');
        
        plot(Treshold(1),his(Treshold(1),[2]), '.', 'MarkerSize',15, 'Color', c_order(2,:))
        plot(Treshold(2),his(Treshold(2),[3]), '.', 'MarkerSize',15, 'Color', c_order(3,:))
        plot(Treshold(3),his(Treshold(3),[1]), '.', 'MarkerSize',15, 'Color', c_order(1,:))
%         plot(Treshold(4),his(Treshold(4),[1]), '.', 'MarkerSize',15, 'Color', c_order(2,:))
        
%         plot([1;1]*Treshold(1), [1; max(his(:))],'LineStyle','-','Color',c_order(2,:))
%         plot([1;1]*Treshold(2), [1; max(his(:))],'LineStyle','--','Color',c_order(3,:))
%         plot([1;1]*Treshold(3), [1 ;max(his(:))],'LineStyle','--','Color',c_order(1,:))
        plot([1;1]*Treshold(4), [1; max(his(:))],'LineStyle',':','Color',c_order(2,:))
        
        hold off
        lgnd=legend('Extracted X-ray signal'  ,'Raw - bacground', ...
            '3x3 nearest neighbours binned data', 'Raw data','Background image', 'bcg cutoff treshold','Lo intensity treshold','X-ray treshold','Hi intensity treshold');
        set(lgnd,'color','none');
        
        %%% Plotting counts per frame
        subplot(s1,s2,4);
        
        N=size(total_counts2.signal,2);
        a= total_counts(1,:);
        a(frameIndex) = NaN;
        %comment out from here        
        %[ax,line1,line2] = plotyy(1:numel(frameIndex),total_counts(1,:),1:N,total_counts2(2,:)./frameIndex);
        [ax,lines] = plotyyy(1:numel(frameIndex),total_counts(1,:),1:N,sum(total_counts2.signal)./frameIndex,1:numel(frameIndex),bcg_counts./frameIndex);
        
        set(lines(1),'Marker','.')
        set(lines(2),'Marker','.')
        set(lines(3),'Marker','.','color','k')
        set(ax(3),'YColor','k')
        axes(ax(1))
        hold on
        %plot(1:N,bcg_counts./frameIndex,'k.-');
        lines(4) = plot(a,'or');
        
        
        axes(ax(2))
        axes(ax(3))
        
        lgnd = legend(lines,{'Total Counts' 'X-ray Counts' 'Background Counts' 'Bad Frames' });
        set(lgnd,'color','none');
        hold on
        set(ax(1), 'YTickMode' ,'auto')
        ylabel(ax(1),'Total Counts [ADU]')
        set(ax(2), 'YTickMode' ,'auto')
        set(ax(1), 'XTickMode' ,'manual','XTick',[]);
        ylabel(ax(2),'X-ray Counts [ADU]')
        ylabel(ax(3),'Background Counts [ADU]')
        %         factor1 = min(total_counts2(2,frameIndex))/mean(total_counts2(2,frameIndex));
        %         factor2 = max(total_counts2(2,frameIndex))/mean(total_counts2(2,frameIndex));
        %         if factor1~=factor2
        %             ylim(ax(1),mean(total_counts2(1,frameIndex))*[factor1 factor2])
        %             ylim(ax(2),mean(total_counts2(2,frameIndex))*[factor1 factor2])
        %         end
        ylim(ax(1),'auto')
        ylim(ax(2),'auto')
        ylim(ax(3),'auto')
        
        
        box(ax(1),'off')
        %xlim(ax(1),[1 ,numel(frameIndex)])
        %xlim(ax(2),[1 ,numel(frameIndex)])
        %xlim(ax(3),[1 ,numel(frameIndex)])
        
        xlabel('Frame NO')
        title('Counts Per Frame');
        
        %         plot([sum(raw,2), sum(bcg_adj)*sum(bcg,2)]);xlim([0,2048]);title('Raw data and background')
        %         legend('Raw','Background')
    end
    h = findobj(hfig,'type','line');
    set(h,'Tag',[file_name file_postfix]);
    
    
    if save_data
        saveas(hfig,[ save_path , strrep(file_name,'*','') file_postfix '.fig' ] )
        saveas(hfig,[ save_path , strrep(file_name,'*','') file_postfix '.pdf' ] )
    end
    
    
    if scan && drawing_mode >4
        x=1:size(scan_data,2);
        y=1:size(scan_data,1);
        if isempty(scanParam)
            x_label = 'Scan NO';
        else
            x_label = scanParam;
        end
        
        
        scan_data_corr = scan_data;
        
        I0 = zeros(size(x)); 
        I1 = zeros(size(x)); 
        for i = 1:numel(flist)
            energy_str = regexp(flist{i},'\d+\.\d+(?=(_[1-9])?.sif)','match');
            x(i) = str2double(energy_str);
            
            if exist([flist{i}(1:end-4) '_I0.txt'],'file') & exist([flist{i}(1:end-4) '_I1.txt'],'file')
                I0(i) = load([flist{i}(1:end-4) '_I0.txt']);
                I1(i) = load([flist{i}(1:end-4) '_I1.txt']);
            else
               info = sifread(flist{i});
               info = info.comment;
               I0(i)=str2double(regexprep(info,['.*' 'I0' ' *= *(-?\d+.?\d*).*'],'$1'));
               I1(i)=str2double(regexprep(info,['.*' 'I1' ' *= *(-?\d+.?\d*).*'],'$1'));

               if I0(i) == 0 || isnan(I0(i))
                I0(i) = 1;
                I1(i)= nan;
               end
            end
            
%             %%
%             info = sifread(flist{i});
%             info = info.comment;
%             I0(i)=str2double(regexprep(info,['.*' 'I0' ' *= *(-?\d+.?\d*).*'],'$1'));
%             I1(i)=str2double(regexprep(info,['.*' 'I1' ' *= *(-?\d+.?\d*).*'],'$1'));
            scan_data_corr(:,i) = scan_data_corr(:,i)/I0(i); 
%             if ~isempty(scanParam)
%                 x(i) = str2double(regexprep(info,['.*' scanParam ' *= *(-?\d+.?\d*).*'],'$1'));
%             end
        end
        

        if any(isnan(x))
            x=1:size(scan_data,2);
            x_label = 'Scan NO';
        end
        
        
        
        hfig(end+1)=figure('Name', [strrep(file_name,'*','') file_postfix '_scan']);
        fpos=get(hfig(end),'position');
        %set(hfig(end),'position',fpos+[0 -fpos(4) 0 fpos(4)])
        set(hfig(end),'position',fpos+[0 -fpos(4) fpos(3) fpos(4)])
        subplot(2,2,1)
        pcolor(x,y,scan_data_corr)
        xlim([min(x) max(x)])
        shading flat
        set(gca,'ydir','rev')
        ylabel('Pixel')
        xlabel(x_label)
        title(file_name,'interpreter','none');
        subplot(2,2,2)
        plot(x,sum(scan_data_corr,1),'DISPLAYNAME','TFY')
        xlim([min(x) max(x)])
        ylabel('Total counts per I0 per second [ADU/s]')
        xlabel(x_label)
        
        
        subplot(2,2,3)
        pcolor(x,y,scan_data)
        xlim([min(x) max(x)])
        shading flat
        set(gca,'ydir','rev')
        ylabel('Pixel')
        xlabel(x_label)
        title('Not corrected for I0','interpreter','none');
        subplot(2,2,4)
        hold on
        plot(x,sum(scan_data,1),'DISPLAYNAME','TFY')
        
        [ax,line] = plotyyy(x,sum(scan_data,1),x,I1,x,I0,...
        {'TFY (not corrected)','I1', 'I0' });
        
        %set(line(1),'DISPLAYNAME','TFY (not corrected)')
        %set(line(2),'DISPLAYNAME','I1')
        %set(line(3),'DISPLAYNAME','I0') 
        
        for i=1:3
            limy=get(ax(i),'ylim');
            ylim(ax(i),[0 limy(2)])
        end
        xlim(ax(1),[min(x) max(x)])
        xlim(ax(2),[min(x) max(x)])
        limx1=get(ax(1),'xlim');
        xlim(ax(3),[limx1(1)   limx1(1) + 1.2*(limx1(2)-limx1(1))]);
        ylabel('Counters per second [ADU/s]')
        xlabel(x_label)
        h = findobj(hfig,'type','line');
        set(h,'Tag',file_name);
        
        
        if save_data
            saveas(hfig(end),[ save_path , strrep(file_name,'*','') '_scan' file_postfix '.fig' ] )
            saveas(hfig(end),[ save_path , strrep(file_name,'*','') '_scan' file_postfix '.pdf' ] )
        end
    end
    
end

if evolution
    hfig(end+1)=figure('Name', [strrep(file_name,'*','') file_postfix '_evolution']);
    fpos=get(hfig(end),'position');
    set(hfig(end),'position',fpos+[0 -fpos(4) 0 fpos(4)])
    subplot(2,1,1)
%     color_map = total_counts2.raw;
    color_map = total_counts2.common_mode_adj;
    a=true(1,size(color_map,2));
    a(frameIndex)=false;
    color_map(:,a)=NaN;
    imagesc(color_map);
    title([file_name '   raw data (common mode)'],'interpreter','none');
    ylabel('Pixel')
    xlabel('Frame NO')
    colorbar
    subplot(2,1,2)
    color_map = total_counts2.signal;
    a=true(1,size(color_map,2));
    a(frameIndex)=false;
    color_map(:,a)=NaN;
    imagesc(color_map);
    title([file_name '   X-ray signal'],'interpreter','none');
    ylabel('Pixel')
    xlabel('Frame NO')
    colorbar
    
end

if nargout>0,
    if scan
        corr_signal = scan_data;
    end
    
    out = struct('signal_bkgFree',signal_bkgFree,...
        'raw',raw,...
        'bcg',bcg,...
        'bcg_info', bcg_info,...
        'auto_corr',t);
    varargout={corr_signal,hfig,out};
    
end

end