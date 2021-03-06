#!bash

# Generated with perl module App::Spec v0.012

_h2xs() {

    COMPREPLY=()
    local program=h2xs
    local cur prev words cword
    _init_completion -n : || return
    declare -a FLAGS
    declare -a OPTIONS
    declare -a MYWORDS

    local INDEX=`expr $cword - 1`
    MYWORDS=("${words[@]:1:$cword}")

    FLAGS=('--omit-autoload' 'Omit all autoload facilities' '-A' 'Omit all autoload facilities' '--beta-version' 'Use an alpha/beta style version number' '-B' 'Use an alpha/beta style version number' '--omit-changes' 'Omits creation of the Changes file' '-C' 'Omits creation of the Changes file' '--overwrite-ok' 'Allows a pre-existing extension directory to be overwritten' '-O' 'Allows a pre-existing extension directory to be overwritten' '--omit-pod' 'Omit the autogenerated stub POD section' '-P' 'Omit the autogenerated stub POD section' '--omit-XS' 'Omit the XS portion' '-X' 'Omit the XS portion' '--gen-accessors' 'Generate an accessor method for each element of structs and unions' '-a' 'Generate an accessor method for each element of structs and unions' '--omit-constant' 'Omit "constant()" from the .xs file' '-c' 'Omit "constant()" from the .xs file' '--debugging' 'Turn on debugging messages' '-d' 'Turn on debugging messages' '--force' 'Allows an extension to be created for a header not found' '-f' 'Allows an extension to be created for a header not found' '--global' 'Include code for safely storing static data in the .xs file' '-g' 'Include code for safely storing static data in the .xs file' '--omit-const-func' 'omit the const attribute in the generated XS code' '-k' 'omit the const attribute in the generated XS code' '--gen-tied-var' 'for each variable declare a perl variable of the same...' '-m' 'for each variable declare a perl variable of the same...' '--use-new-tests' 'use "Test::More" rather than "Test"' '--use-old-tests' 'Will force the generation of test code that uses the older "Test" module' '--skip-exporter' 'Do not use "Exporter" and/or export any symbol' '--skip-ppport' 'Do not use "Devel::PPPort"' '--skip-autoloader' 'Do not use the module "AutoLoader"' '--skip-strict' 'Do not use the pragma "strict"' '--skip-warnings' 'Do not use the pragma "warnings"' '--autogen-xsubs' 'Automatically generate XSUBs basing on function declarations in the header file' '-x' 'Automatically generate XSUBs basing on function declarations in the header file' '--help' 'Show command help' '-h' 'Show command help')
    OPTIONS=('--cpp-flags' 'Additional flags to specify to C preprocessor' '-F' 'Additional flags to specify to C preprocessor' '--func-mask' 'selects functions/macros to process' '-M' 'selects functions/macros to process' '--compat-version' 'Generates a .pm file which is backwards compatible...' '-b' 'Generates a .pm file which is backwards compatible...' '--omit-enums' 'skip all constants (matching the regex) that are defined in a C enumeration' '-e' 'skip all constants (matching the regex) that are defined in a C enumeration' '--name' 'Specifies a name to be used for the extension' '-n' 'Specifies a name to be used for the extension' '--opaque-re' 'Use "opaque" data type for the C types matched...' '-o' 'Use "opaque" data type for the C types matched...' '--remove-prefix' 'Specify a prefix which should be removed from the Perl function names' '-p' 'Specify a prefix which should be removed from the Perl function names' '--const-subs' 'Create a perl subroutine for the specified macros...' '-s' 'Create a perl subroutine for the specified macros...' '--default-type' 'Specify the internal type that the constant() mechanism uses for macros' '-t' 'Specify the internal type that the constant() mechanism uses for macros' '--version' 'Specify a version number for this extension' '-v' 'Specify a version number for this extension')
    __h2xs_handle_options_flags

    case ${MYWORDS[$INDEX-1]} in
      --cpp-flags|-F)
      ;;
      --func-mask|-M)
      ;;
      --compat-version|-b)
      ;;
      --omit-enums|-e)
      ;;
      --name|-n)
      ;;
      --opaque-re|-o)
      ;;
      --remove-prefix|-p)
      ;;
      --const-subs|-s)
      ;;
      --default-type|-t)
      ;;
      --version|-v)
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

_h2xs_compreply() {
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


__h2xs_dynamic_comp() {
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
    _h2xs_compreply ${comp[@]}
}

function __h2xs_handle_options() {
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

function __h2xs_handle_flags() {
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

__h2xs_handle_options_flags() {
    __h2xs_handle_options
    __h2xs_handle_flags
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
      __h2xs_dynamic_comp 'options' "$options_spec"

      return 1
    else
      return 0
    fi
}


complete -o default -F _h2xs h2xs

