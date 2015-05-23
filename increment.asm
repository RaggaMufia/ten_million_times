;; from:
;;
;; - http://asm.sourceforge.net/intro/hello.html
;; - https://stackoverflow.com/questions/12943570/assigning-value-to-variable-in-x86-nasm
;;
;; build like this:
;;
;;   nasm -f elf64 hello.asm
;;   ld -s -o hello.asm.exe hello.o
;;

section     .text
global      _start                              ;must be declared for linker (ld)

_start:                                         ;tell linker entry point

    mov     edx,len                             ;message length
    mov     ecx,msg                             ;message to write
    mov     ebx,1                               ;file descriptor (stdout)

    mov     long [count],10000000               ;init counter

_loop:

    dec     long [count]                        ;decrement counter
    cmp     long [count],0                      ;have we reached 0 yet?
    jne     _loop                               ;if not 0 then go to _loop

_exit:
    mov     eax,1                               ;system call number (sys_exit)
    mov     ebx,0                               ;exit value
    int     0x80                                ;call kernel

section     .bss
count  resd 1                                   ;our counter, resd = "uninitialized long"

section     .data
msg     db  'hello',0xa                         ;our dear string
len     equ $ - msg                             ;length of our dear string
