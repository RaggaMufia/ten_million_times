;; exit immediately

section     .text
global      _start                              ;must be declared for linker (ld)

_start:                                         ;tell linker entry point

_exit:
    mov     eax,1                               ;system call number (sys_exit)
    mov     ebx,0                               ;exit value
    int     0x80                                ;call kernel
