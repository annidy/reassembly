

================ B E G I N N I N G   O F   P R O C E D U R E ================



                     _setkey:
0000000100000e20         push       rbp                                         ; XREF=_main+13
0000000100000e21         mov        rbp, rsp
0000000100000e24         mov        dword [ss:rbp+var_4], edi
0000000100000e27         mov        edi, dword [ss:rbp+var_4]
0000000100000e2a         mov        dword [ss:rbp+var_C], edi
0000000100000e2d         mov        dword [ss:rbp+var_8], 0x0

0000000100000e34         cmp        dword [ss:rbp+var_8], 0x1a                  ; XREF=_setkey+87
0000000100000e38         jge        0x100000e7c

0000000100000e3e         lea        rax, qword [ds:_keybuf]
0000000100000e45         mov        ecx, 0x1a
0000000100000e4a         mov        edx, dword [ss:rbp+var_C]
0000000100000e4d         mov        qword [ss:rbp+var_18], rax
0000000100000e51         mov        eax, edx
0000000100000e53         cdq        
0000000100000e54         idiv       ecx
0000000100000e56         mov        sil, dl
0000000100000e59         movsxd     rdi, dword [ss:rbp+var_8]
0000000100000e5d         mov        r8, qword [ss:rbp+var_18]
0000000100000e61         mov        byte [ds:r8+rdi], sil
0000000100000e65         mov        ecx, dword [ss:rbp+var_4]
0000000100000e68         add        ecx, dword [ss:rbp+var_C]
0000000100000e6b         mov        dword [ss:rbp+var_C], ecx
0000000100000e6e         mov        eax, dword [ss:rbp+var_8]
0000000100000e71         add        eax, 0x1
0000000100000e74         mov        dword [ss:rbp+var_8], eax
0000000100000e77         jmp        0x100000e34

0000000100000e7c         pop        rbp                                         ; XREF=_setkey+24
0000000100000e7d         ret        
                        ; endp
