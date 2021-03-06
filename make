#!/bin/bash

help() {
   echo 'usage: ./make --help'
   echo '       ./make run'
   echo '       ./make run [lang]'
   echo '       ./make list'
   echo '       ./make build'
   echo '       ./make clean'
   echo
   echo '  ./make run      - run all language benchmarks'
   echo '  ./make run LANG - run only benchmark for language LANG'
   echo '  ./make list     - list known languages'
   echo '  ./make build    - compile stuff, generate diagram'
   echo '  ./make clean    - clean up artifacts'
   exit 1
}

[ "$1" == "--help" ] && help

DEBUG= # set to 1


suites=( hello startup increment )
types=( asm c rs pl pyc py lua rb java tcl sbcl sh )
command=$1
typ=$2

cmd_line() {
    local name=$1
    shift
    local typ=$1
    shift

    local exe=${name}.${typ}

    case $typ in

        asm|c|rs)
            echo "./$exe.exe"
            ;;
        java)
            first_char=$( echo $name | cut -c 1 | tr [:lower:] [:upper:] )
            rest_char=$(  echo $name | cut -c 2- )
            class=${first_char}${rest_char}
            echo "java $class"
            ;;
        lua|sh|pl|rb|py|tcl|sbcl)
            echo "./$exe"
            ;;
        pyc)
            echo "python $exe"
            ;;
        *)
            echo "echo unknown typ $typ"
    esac
}

# run "hello" "without output"
# 
run() {
    local name="$1"
    local comment="$2"

    echo "execution time for $name $comment" >&2

    for typ in "${types[@]}"; do
        echo -n -e "$typ\t" >&2
        cmd="time $( cmd_line $name $typ )"
        [ "$DEBUG" ] && \
        echo "will execute: $cmd" >&2
        eval "$cmd"
    done
}

build() {
    for suite in "${suites[@]}"; do
        # asm
        nasm -f elf64 $suite.asm
        ld -s -o $suite.asm.exe $suite.o
        # C
        gcc $suite.c -o $suite.c.exe
        # Rust
        rustc $suite.rs -o $suite.rs.exe
        # Java
        javac $suite.java
        # Python
        pycompile $suite.pyc
    done

    gnuplot -c analysis.gnu
}

case "$command" in
    run)
        if [ "$typ" ]; then
            types=( "$typ" )
        fi

        export TIMEFORMAT=$'%3R\t%3U\t%3S'
        run hello "with output"
        run hello "without output" >/dev/null
        run increment
        run startup
        ;;
    list)
        echo "${types[@]}"
        ;;
    build)
        build
        ;;
    clean)
        rm *.o *.class *.exe luac.out *.pyc
        ;;
    *)
        echo "sorry, I don't understand what to do :-("
esac
