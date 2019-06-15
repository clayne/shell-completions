#!bash

# Generated with perl module App::Spec v0.010

_prove() {

    COMPREPLY=()
    local program=prove
    local cur prev words cword
    _init_completion -n : || return
    declare -a FLAGS
    declare -a OPTIONS
    declare -a MYWORDS

    local INDEX=`expr $cword - 1`
    MYWORDS=("${words[@]:1:$cword}")

    FLAGS=('--verbose' 'Print all test lines' '-v' 'Print all test lines' '--lib' 'Add '"\\'"'lib'"\\'"' to the path for your tests' '-l' 'Add '"\\'"'lib'"\\'"' to the path for your tests' '--blib' 'Add '"\\'"'blib/lib'"\\'"' and '"\\'"'blib/arch'"\\'"' to the path' '-b' 'Add '"\\'"'blib/lib'"\\'"' and '"\\'"'blib/arch'"\\'"' to the path' '--shuffle' 'Run the tests in random order' '-s' 'Run the tests in random order' '--color' 'Colored test output (default)' '-c' 'Colored test output (default)' '--nocolor' 'Do not color test output' '--count' 'Show the X/Y test count when not verbose' '--nocount' 'Disable the X/Y test count' '--dry' 'Dry run' '-D' 'Dry run' '--failures' 'Show failed tests' '-f' 'Show failed tests' '--comments' 'Show comments' '-o' 'Show comments' '--ignore-exit' 'Ignore exit status from test scripts' '--merge' 'Merge test scripts'"\\'"' STDERR with their STDOUT' '-m' 'Merge test scripts'"\\'"' STDERR with their STDOUT' '--recurse' 'Recursively descend into directories' '-r' 'Recursively descend into directories' '--reverse' 'Run the tests in reverse order' '--quiet' 'Suppress some test output' '-q' 'Suppress some test output' '--QUIET' 'Only print summary results' '-Q' 'Only print summary results' '--parse' 'Show full list of TAP parse errors' '-p' 'Show full list of TAP parse errors' '--directives' 'Only show results with TODO or SKIP directives' '--timer' 'Print elapsed time after each test' '--trap' 'Trap Ctrl-C and print summary on interrupt' '--normalize' 'Normalize TAP output in verbose output' '-T' 'Enable tainting checks' '-t' 'Enable tainting warnings' '-W' 'Enable fatal warnings' '-w' 'Enable warnings' '--version' 'Display the version' '-V' 'Display the version' '--man' 'Longer manpage' '-H' 'Longer manpage' '--norc' 'Don'"\\'"'t process default .proverc' '--help' 'Show command help' '-h' 'Show command help')
    OPTIONS=('-I' 'Library paths to include' '--exec' 'Interpreter to run the tests' '-e' 'Interpreter to run the tests' '--ext' 'Set the extension for tests' '--harness' 'Define test harness to use' '--formatter' 'Result formatter to use' '--source' 'Load and/or configure a SourceHandler' '--archive' 'Store the resulting TAP in an archive file' '-a' 'Store the resulting TAP in an archive file' '--rc' 'Process options from rcfile' '--rules' 'Rules for parallel vs sequential processing' '-j' 'Run N test jobs in parallel' '--state' 'Control prove'"\\'"'s persistent state' '-s' 'Control prove'"\\'"'s persistent state' '-P' 'Load plugin' '-M' 'Load a module')
    __prove_handle_options_flags

    case ${MYWORDS[$INDEX-1]} in
      -I)
      ;;
      --exec|-e)
      ;;
      --ext)
      ;;
      --harness)
      ;;
      --formatter)
      ;;
      --source)
      ;;
      --archive|-a)
      ;;
      --rc)
      ;;
      --rules)
      ;;
      -j)
        _prove_compreply "1" "2" "3" "4" "5" "6" "7" "8" "9"
        return
      ;;
      --state|-s)
        _prove_compreply "last" "failed" "passed" "all" "hot" "todo" "slow" "fast" "new" "old" "fresh" "save"
        return
      ;;
      -P)
        _prove__option_P_completion
      ;;
      -M)
        _prove__option_M_completion
      ;;

    esac
    case $INDEX in
      0)
          __comp_current_options || return
      ;;


    *)
        __comp_current_options || return
    ;;
    esac

}

_prove_compreply() {
    local prefix=""
    cur="$(printf '%q' "$cur")"
    IFS=$'\n' COMPREPLY=($(compgen -P "$prefix" -W "$*" -- "$cur"))
    __ltrim_colon_completions "$prefix$cur"

    # http://stackoverflow.com/questions/7267185/bash-autocompletion-add-description-for-possible-completions
    if [[ ${#COMPREPLY[*]} -eq 1 ]]; then # Only one completion
        COMPREPLY=( "${COMPREPLY[0]%% -- *}" ) # Remove ' -- ' and everything after
        COMPREPLY=( "${COMPREPLY[0]%%+( )}" ) # Remove trailing spaces
    fi
}

_prove__option_P_completion() {
    local CURRENT_WORD="${words[$cword]}"
    local param_P="$(find `perl -wE'say for @INC'` | grep '/App/Prove/Plugin/.*.pm$' | perl -plE's{^.*/(App/Prove/Plugin/.*)\.pm$}{$1}; s{/}{::}g')"
    _prove_compreply "$param_P"
}
_prove__option_M_completion() {
    local CURRENT_WORD="${words[$cword]}"
    local param_M="$(\
for incpath in $(perl -wE'say for @INC'); do \
find $incpath -name "*.pm" -printf "%P\n" \
| perl -plE's{/}{::}g; s{\.pm}{}'; \
done)"
    _prove_compreply "$param_M"
}

__prove_dynamic_comp() {
    local argname="$1"
    local arg="$2"
    local name desc cols desclength formatted
    local comp=()
    local max=0

    while read -r line; do
        name="$line"
        desc="$line"
        name="${name%$'\t'*}"
        if [[ "${#name}" -gt "$max" ]]; then
            max="${#name}"
        fi
    done <<< "$arg"

    while read -r line; do
        name="$line"
        desc="$line"
        name="${name%$'\t'*}"
        desc="${desc/*$'\t'}"
        if [[ -n "$desc" && "$desc" != "$name" ]]; then
            # TODO portable?
            cols=`tput cols`
            [[ -z $cols ]] && cols=80
            desclength=`expr $cols - 4 - $max`
            formatted=`printf "%-*s -- %-*s" "$max" "$name" "$desclength" "$desc"`
            comp+=("$formatted")
        else
            comp+=("'$name'")
        fi
    done <<< "$arg"
    _prove_compreply ${comp[@]}
}

function __prove_handle_options() {
    local i j
    declare -a copy
    local last="${MYWORDS[$INDEX]}"
    local max=`expr ${#MYWORDS[@]} - 1`
    for ((i=0; i<$max; i++))
    do
        local word="${MYWORDS[$i]}"
        local found=
        for ((j=0; j<${#OPTIONS[@]}; j+=2))
        do
            local option="${OPTIONS[$j]}"
            if [[ "$word" == "$option" ]]; then
                found=1
                i=`expr $i + 1`
                break
            fi
        done
        if [[ -n $found && $i -lt $max ]]; then
            INDEX=`expr $INDEX - 2`
        else
            copy+=("$word")
        fi
    done
    MYWORDS=("${copy[@]}" "$last")
}

function __prove_handle_flags() {
    local i j
    declare -a copy
    local last="${MYWORDS[$INDEX]}"
    local max=`expr ${#MYWORDS[@]} - 1`
    for ((i=0; i<$max; i++))
    do
        local word="${MYWORDS[$i]}"
        local found=
        for ((j=0; j<${#FLAGS[@]}; j+=2))
        do
            local flag="${FLAGS[$j]}"
            if [[ "$word" == "$flag" ]]; then
                found=1
                break
            fi
        done
        if [[ -n $found ]]; then
            INDEX=`expr $INDEX - 1`
        else
            copy+=("$word")
        fi
    done
    MYWORDS=("${copy[@]}" "$last")
}

__prove_handle_options_flags() {
    __prove_handle_options
    __prove_handle_flags
}

__comp_current_options() {
    local always="$1"
    if [[ -n $always || ${MYWORDS[$INDEX]} =~ ^- ]]; then

      local options_spec=''
      local j=

      for ((j=0; j<${#FLAGS[@]}; j+=2))
      do
          local name="${FLAGS[$j]}"
          local desc="${FLAGS[$j+1]}"
          options_spec+="$name"$'\t'"$desc"$'\n'
      done

      for ((j=0; j<${#OPTIONS[@]}; j+=2))
      do
          local name="${OPTIONS[$j]}"
          local desc="${OPTIONS[$j+1]}"
          options_spec+="$name"$'\t'"$desc"$'\n'
      done
      __prove_dynamic_comp 'options' "$options_spec"

      return 1
    else
      return 0
    fi
}


complete -o default -F _prove prove
