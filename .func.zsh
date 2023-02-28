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

mkold(){
    if (( $# != 1 )) ; then
        echo "Exact 1 command line arguments needed!" >&2
        return 1
    fi
    local oldname="$1.old"
    if [ -f "$oldname" ] ; then
        echo "$oldname already exists!" >&2
        return 1
    fi
    mv "$1" "$oldname"
}

rmold(){
    if (( $# != 1 )) ; then
        echo "Exact 1 command line arguments needed!" >&2
        return 1
    fi
    if [ ${1:0-4} != ".old" ] ; then
        echo "$1 is not an old!" >&2
        return 1
    fi
    local name="${1:0:0-4}"
    if [ -f "$name" ] ; then
        echo "$name already exists!" >&2
        return 1
    fi
    mv "$1" "$name"
}

shiftold(){
    if (( $# != 2 )) ; then
        echo "Exact 2 command line arguments needed!" >&2
        return 1
    fi
    local oldname="$2.old"
    if [ -f "$oldname" ] ; then
        echo "$oldname already exists!" >&2
        return 1
    fi
    mv "$2" "$oldname"
    cp -r "$1" "$2"
}

cless(){
    script -c "$*" /dev/null < /dev/null |& less
}

cpmd(){
    if (( $# != 2 )) ; then
        echo "Exact 2 command line arguments needed!" >&2
        return 1
    fi
    mkdir -p `dirname "$2"` || true
    cp -riv "$1" "$2"
}

tran(){
    if (( $# <= 0 )) ; then
        echo "Need argument(s)!" >&2
        return 1
    fi
    trans -b :zh-CN "$*"
}

dict(){
    if (( $# <= 0 )) ; then
        echo "Need argument(s)!" >&2
        return 1
    fi
    trans -d :zh-CN "$*"
}

gitup(){
    git log --reverse --pretty=%H origin/master | grep -A 1 $(git rev-parse HEAD) | tail -n1 | xargs git reset --hard
}

rr(){
    if [[ $# == 0 ]];
    then
        echo 'Argument needed!'
        exit 1
    fi
    while [[ -n $1 ]];
    do
        echo -n "Are you SURE to remove \"${1}\" FOREVER ??? "
        read ans
        ans=`echo $ans | tr '[:upper:]' '[:lower:]'`
        if [[ $ans == y || $and == yes ]];
        then
            \rm -rv "$1"
        else
            echo "Not removing \"${1}\""
        fi
        shift
    done
}

rf(){
    if [[ $# == 0 ]];
    then
        echo 'Argument needed!'
        exit 1
    fi
    while [[ -n $1 ]];
    do
        echo -n "Are you SURE to remove \"${1}\" FORCE and FOREVER ??? "
        read ans
        ans=`echo $ans | tr '[:upper:]' '[:lower:]'`
        if [[ $ans == y || $and == yes ]];
        then
            \rm -rfv "$1"
        else
            echo "Not removing \"${1}\""
        fi
        shift
    done
}
