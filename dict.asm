global find_word
extern string_equals

section .text
find_word:
    push rdi
    push rsi
    add rsi, 8
    call string_equals
    pop rsi
    pop rdi
    test rax, rax
    jnz .end
    mov rsi, [rsi]
    test rsi, rsi
    jz .end
    jmp find_word
.end:
   mov rax, rsi
   ret
