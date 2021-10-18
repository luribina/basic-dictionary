%include "lib.inc"
global _start

section .rodata
%include "colon.inc"
%include "words.inc"

word_enter: db "Enter word: ", 0
word_found: db "Word found: ", 0
word_error: db "This word is not in the list", 0

section .text
_start:
    mov rdi, word_enter
    call print_string
    sub rsp, 256
    mov rdi, rsp
    call read_word
    mov rdi, rax
    mov rsi, last
    call find_word
    test rax, rax
    jz .error
    add rax, 8
    mov rdi, rax
    push rdi
    call string_length
    pop rdi
    inc rdi
    add rdi, rax
    push rdi
    mov rdi, word_found
    call print_string
    pop rdi
    call print_string
    jmp .exit
.error:
    mov rdi, word_error
    call print_error
.exit:
    call print_newline
    add rsp, 256
    xor rdi, rdi
    call exit
