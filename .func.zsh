# shell functions

lc(){
    if (( $# == 0 ));
    then
        ls | wc -l
    else
        ls "$1" | wc -l
    fi
}

lac(){
    if (( $# == 0 ));
    then
        echo $[ `la | wc -l` - 1 ]
    else
        echo $[ `la "$1" | wc -l` - 1 ]
    fi
}

up(){
    local old=`pwd`
    for i in $(seq "${1:-1}"); do
        old="${old%/*}"
        if [ -z "$old" ]; then
            break
        fi
    done
    if [ -z "$old" ]; then
        old='/'
    fi
    cd "$old"
}

mkcd(){
    mkdir -vp $1 && cd $1
}

dumpinto(){
    if (( $# == 0 )); then
        echo Need one argument
        return 1
    fi
    if (( $# > 1 )); then
        echo Too many arguments
        return 1
    fi
    if [ ! -d "$1" ]; then
        mkdir "$1"
    fi
    if (( `ls "$1" | wc -l` > 0 )); then
        echo Directory "$1" exists and not empty
        return 1
    fi
    ls -A | grep -v "^$1$" | xargs -I file mv file "$1"
}

swap(){
    if (( $# != 2 )) ; then
        echo "Exact 2 command line arguments needed!" >&2
        return 1
    fi
    local tmpnames=(tmp.$$ .tmp.$$ tmp temp .tmp .temp)
    for ((i = 1; i <= $#tmpnames; i++)) ; do
        if [ ! -f "$i" ] ; then
            mv "$1" $tmpnames[i] && mv "$2" "$1" && mv $tmpnames[i] "$2"
            return 0
        fi
    done
    echo "tmpfile names are all in conflict!" >$2
    return 1
}
