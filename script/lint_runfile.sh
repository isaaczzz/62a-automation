#!/usr/bin/env bash

# Usage:
#   ./lint_runfile run#.m
#

## Context: when executing MatLab script runfiles, the script is not evaluated before runtime,
## this means we can encounter critical errors along the way which end up killing the given session
## this is problematic when we set up a run o/n and then come back to see it died party-way
## to mitigate, we are leveraging both a lint script (here) and a boilerplate generator to
## hopefully reduce the likelihood of such issues. Here, we are checking for the format of common commands
## and then will error out if the given format is not met; comments (%) and blank lines are ignored

file="$1"

if [[ ! -f "$file" ]]; then
    echo "Error: file not found: $file"
    exit 1
fi

line_num=0
spot_files=""

check_duplicate_file() {
    local fname="$1"

    # Check if fname is already in spot_files
    case " $spot_files " in
        *" $fname "*)
            return 1
            ;;
    esac

    # Otherwise add it
    spot_files="$spot_files $fname"
}

check_cmd() {
    local cmd="$1"

    # mv motor value
    [[ "$cmd" =~ ^mv[[:space:]]+[A-Za-z_]+[[:space:]]+[-+]?[0-9]*\.?[0-9]+$ ]] && return 0

    # mvr motor value
    [[ "$cmd" =~ ^mvr[[:space:]]+[A-Za-z_]+[[:space:]]+[-+]?[0-9]*\.?[0-9]+$ ]] && return 0

    # andorSet key value
    [[ "$cmd" =~ ^andorSet[[:space:]]+[A-Za-z_]+[[:space:]]+[-+]?[0-9]*\.?[0-9]+$ ]] && return 0

    # pause(n)
    [[ "$cmd" =~ ^pause\([[:space:]]*[-+]?[0-9]*\.?[0-9]+[[:space:]]*\)$ ]] && return 0

    # close all
    [[ "$cmd" == "close all" ]] && return 0

    # go_functionName
    [[ "$cmd" =~ ^go_[A-Za-z0-9_]+$ ]] && return 0

    # rixs filename
    if [[ "$cmd" =~ ^rixs[[:space:]]+([A-Za-z0-9_.-]+) ]]; then
        fname="${BASH_REMATCH[1]}"
        if ! check_duplicate_file "$fname"; then
            echo "[Warning] Line ($line_num) filename: $fname"
        fi
        return 0
    fi

    # rixs name + numeric pairs (XAS)
    [[ "$cmd" =~ ^rixs[[:space:]]+[A-Za-z0-9_]+([[:space:]]+[-+]?[0-9]*\.?[0-9]+)+$ ]] && return 0

    # acq filename
    if [[ "$cmd" =~ ^acq[[:space:]]+([A-Za-z0-9_.-]+) ]]; then
        fname="${BASH_REMATCH[1]}"
        if ! check_duplicate_file "$fname"; then
            echo "[Warning] Line ($line_num) duplicate filename: $fname"
        fi
        return 0
    fi

    # acq name expTime X numKins Y dark Z (XES)
    [[ "$cmd" =~ ^acq[[:space:]]+[A-Za-z0-9_.]+[[:space:]]+expTime[[:space:]]+[-+]?[0-9]*\.?[0-9]+[[:space:]]+numKins[[:space:]]+[0-9]+[[:space:]]+dark[[:space:]]+[01]$ ]] && return 0

    return 1
}

while IFS= read -r line || [[ -n "$line" ]]; do
    ((line_num++))

    # Remove inline comments first
    trimmed="$(echo "$line" | sed 's/%.*$//')"

    # Trim leading/trailing whitespace
    trimmed="$(echo "$trimmed" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"

    # Skip empty lines
    [[ -z "$trimmed" ]] && continue

    # Skip full-line comments
    [[ "$trimmed" =~ ^% ]] && continue

    # Split semicolon chains
    IFS=';' read -ra parts <<< "$trimmed"

    for part in "${parts[@]}"; do
        cmd="$(echo "$part" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')"
        [[ -z "$cmd" ]] && continue

        if ! check_cmd "$cmd"; then
            echo "[Warning] Line ($line_num: $cmd) unknown to linter"
        fi
    done

done < "$file"
