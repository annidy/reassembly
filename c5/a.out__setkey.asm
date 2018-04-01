        
        
                ; ================ B E G I N N I N G   O F   P R O C E D U R E ================
        
                ; Variables:
                ;    var_4: -4
                ;    var_8: -8
                ;    var_C: -12
                ;    var_18: -24
        
        
 _setkey:
        push       rbp                                                                  ; CODE XREF=_main+13
        mov        rbp, rsp
        mov        dword [rbp+var_4], edi
        mov        edi, dword [rbp+var_4]
        mov        dword [rbp+var_C], edi
        mov        dword [rbp+var_8], 0x0
        
 loc_100000e34:
        cmp        dword [rbp+var_8], 0x1a                                              ; CODE XREF=_setkey+87
        jge        loc_100000e7c
        
        lea        rax, qword [_keybuf]
        mov        ecx, 0x1a
        mov        edx, dword [rbp+var_C]
        mov        qword [rbp+var_18], rax
        mov        eax, edx
        cdq
        idiv       ecx
        mov        sil, dl
        movsxd     rdi, dword [rbp+var_8]
        mov        r8, qword [rbp+var_18]
        mov        byte [r8+rdi], sil
        mov        ecx, dword [rbp+var_4]
        add        ecx, dword [rbp+var_C]
        mov        dword [rbp+var_C], ecx
        mov        eax, dword [rbp+var_8]
        add        eax, 0x1
        mov        dword [rbp+var_8], eax
        jmp        loc_100000e34
        
 loc_100000e7c:
        pop        rbp                                                                  ; CODE XREF=_setkey+24
        ret
                                ; endp
