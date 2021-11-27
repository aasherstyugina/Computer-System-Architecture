






global _Z2InP5beastP8_IO_FILE
global _Z5InRndP5beast
global _Z7GetNameN5beast4typeE
global _Z2InP4fishP8_IO_FILE
global _Z5InRndP4fish
global _Z7GetNameN4fish4areaE
global _Z2InP4birdP8_IO_FILE
global _Z5InRndP4bird
global _Z7GetNamei
global _Z2InP6animalP8_IO_FILE
global _Z5InRndP6animal
global _Z13CountQuotientPci
global _Z3OutPK6animalP8_IO_FILE
global _Z4Initv
global _Z5ClearP9container
global _Z7AddItemP9containerP6animal
global _Z2InP9containerP8_IO_FILE
global _Z5InRndP9containeriP8_IO_FILE
global _Z3OutPK9containerP8_IO_FILE
global _Z17StraightSelectionP9container
global _Z11helpMessagev
global _Z11errMessage1v
global _Z11errMessage2v
global main

extern difftime
extern strlen
extern atoi
extern fwrite
extern fclose
extern fopen
extern strcmp
extern clock
extern srand
extern time
extern free
extern fprintf
extern strcpy
extern malloc
extern printf
extern puts
extern __stack_chk_fail
extern __isoc99_fscanf
extern _Znaj
extern rand


SECTION .text   

_ZL4Randii:
        push    ebp
        mov     ebp, esp
        sub     esp, 8
        call    rand
        cdq
        idiv    dword [ebp+0CH]
        mov     eax, dword [ebp+8H]
        add     eax, edx
        leave
        ret

_ZL8RandNamev:
        push    ebp
        mov     ebp, esp
        push    ebx
        sub     esp, 20
        sub     esp, 8
        push    15
        push    1
        call    _ZL4Randii
        add     esp, 16
        mov     dword [ebp-14H], eax
        mov     eax, dword [ebp-14H]
        sub     esp, 12
        push    eax
        call    _Znaj
        add     esp, 16
        mov     dword [ebp-10H], eax
        mov     dword [ebp-0CH], L_092
        mov     dword [ebp-18H], 0
        jmp     L_002

L_001:  mov     ebx, dword [ebp-0CH]
        sub     esp, 8
        push    26
        push    0
        call    _ZL4Randii
        add     esp, 16
        add     eax, ebx
        mov     ecx, dword [ebp-18H]
        mov     edx, dword [ebp-10H]
        add     edx, ecx
        movzx   eax, byte [eax]
        mov     byte [edx], al
        add     dword [ebp-18H], 1
L_002:  mov     eax, dword [ebp-18H]
        cmp     eax, dword [ebp-14H]
        jl      L_001
        mov     eax, dword [ebp-10H]
        mov     ebx, dword [ebp-4H]
        leave
        ret

_Z2InP5beastP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 40
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-1CH], eax
        mov     eax, dword [ebp+0CH]
        mov     dword [ebp-20H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-10H], -1
        sub     esp, 4
        lea     eax, [ebp-10H]
        push    eax
        push    L_093
        push    dword [ebp-20H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     eax, dword [ebp-10H]
        cmp     eax, 2
        jz      L_005
        cmp     eax, 2
        jg      L_006
        test    eax, eax
        jz      L_003
        cmp     eax, 1
        jz      L_004
        jmp     L_006

L_003:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 0
        mov     eax, 0
        jmp     L_007

L_004:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 1
        mov     eax, 0
        jmp     L_007

L_005:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 2
        mov     eax, 0
        jmp     L_007

L_006:  mov     eax, 1
L_007:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_008
        call    __stack_chk_fail
L_008:  leave
        ret


_Z5InRndP5beast:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 8
        push    3
        push    0
        call    _ZL4Randii
        add     esp, 16
        mov     dword [ebp-0CH], eax
        cmp     dword [ebp-0CH], 2
        jz      L_011
        cmp     dword [ebp-0CH], 2
        jg      L_012
        cmp     dword [ebp-0CH], 0
        jz      L_009
        cmp     dword [ebp-0CH], 1
        jz      L_010
        jmp     L_012

L_009:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 0
        jmp     L_012

L_010:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 1
        jmp     L_012

L_011:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 2
        nop
L_012:  nop
        leave
        ret


_Z7GetNameN5beast4typeE:
        push    ebp
        mov     ebp, esp
        sub     esp, 24

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-18H], L_094
        mov     dword [ebp-14H], L_095
        mov     dword [ebp-10H], L_096
        mov     eax, dword [ebp+8H]
        mov     eax, dword [ebp+eax*4-18H]
        mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_013
        call    __stack_chk_fail
L_013:  leave
        ret


_Z2InP4fishP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 40
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-1CH], eax
        mov     eax, dword [ebp+0CH]
        mov     dword [ebp-20H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-10H], -1
        sub     esp, 4
        lea     eax, [ebp-10H]
        push    eax
        push    L_093
        push    dword [ebp-20H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     eax, dword [ebp-10H]
        cmp     eax, 2
        jz      L_016
        cmp     eax, 2
        jg      L_017
        test    eax, eax
        jz      L_014
        cmp     eax, 1
        jz      L_015
        jmp     L_017

L_014:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 0
        mov     eax, 0
        jmp     L_018

L_015:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 1
        mov     eax, 0
        jmp     L_018

L_016:  mov     eax, dword [ebp-1CH]
        mov     dword [eax], 2
        mov     eax, 0
        jmp     L_018

L_017:  mov     eax, 1
L_018:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_019
        call    __stack_chk_fail
L_019:  leave
        ret


_Z5InRndP4fish:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 8
        push    3
        push    0
        call    _ZL4Randii
        add     esp, 16
        mov     dword [ebp-0CH], eax
        cmp     dword [ebp-0CH], 2
        jz      L_022
        cmp     dword [ebp-0CH], 2
        jg      L_023
        cmp     dword [ebp-0CH], 0
        jz      L_020
        cmp     dword [ebp-0CH], 1
        jz      L_021
        jmp     L_023

L_020:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 0
        jmp     L_023

L_021:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 1
        jmp     L_023

L_022:  mov     eax, dword [ebp+8H]
        mov     dword [eax], 2
        nop
L_023:  nop
        leave
        ret


_Z7GetNameN4fish4areaE:
        push    ebp
        mov     ebp, esp
        sub     esp, 24

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-18H], L_097
        mov     dword [ebp-14H], L_098
        mov     dword [ebp-10H], L_099
        mov     eax, dword [ebp+8H]
        mov     eax, dword [ebp+eax*4-18H]
        mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_024
        call    __stack_chk_fail
L_024:  leave
        ret


_Z2InP4birdP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 40
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-1CH], eax
        mov     eax, dword [ebp+0CH]
        mov     dword [ebp-20H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-10H], -1
        sub     esp, 4
        lea     eax, [ebp-10H]
        push    eax
        push    L_093
        push    dword [ebp-20H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     eax, dword [ebp-10H]
        test    eax, eax
        jz      L_025
        cmp     eax, 1
        jz      L_026
        jmp     L_027

L_025:  mov     eax, dword [ebp-1CH]
        mov     byte [eax], 0
        mov     eax, 0
        jmp     L_028

L_026:  mov     eax, dword [ebp-1CH]
        mov     byte [eax], 1
        mov     eax, 0
        jmp     L_028

L_027:  mov     eax, 1
L_028:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_029
        call    __stack_chk_fail
L_029:  leave
        ret


_Z5InRndP4bird:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 8
        push    2
        push    0
        call    _ZL4Randii
        add     esp, 16
        mov     dword [ebp-0CH], eax
        cmp     dword [ebp-0CH], 0
        jz      L_030
        cmp     dword [ebp-0CH], 1
        jz      L_031
        jmp     L_032

L_030:  mov     eax, dword [ebp+8H]
        mov     byte [eax], 0
        jmp     L_032

L_031:  mov     eax, dword [ebp+8H]
        mov     byte [eax], 1
        nop
L_032:  nop
        leave
        ret


_Z7GetNamei:
        push    ebp
        mov     ebp, esp
        sub     esp, 24

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        mov     dword [ebp-14H], L_100
        mov     dword [ebp-10H], L_101
        mov     eax, dword [ebp+8H]
        mov     eax, dword [ebp+eax*4-14H]
        mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_033
        call    __stack_chk_fail
L_033:  leave
        ret


_Z2InP6animalP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 1048
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-40CH], eax
        mov     eax, dword [ebp+0CH]
        mov     dword [ebp-410H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        sub     esp, 4
        lea     eax, [ebp-3F5H]
        push    eax
        push    L_102
        push    dword [ebp-410H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     dword [ebp-3FCH], eax
        cmp     dword [ebp-3FCH], 1
        jz      L_034
        sub     esp, 12
        push    L_103
        call    puts
        add     esp, 16
        mov     eax, 1
        jmp     L_040

L_034:  sub     esp, 4
        lea     eax, [ebp-404H]
        push    eax
        push    L_093
        push    dword [ebp-410H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     dword [ebp-3FCH], eax
        cmp     dword [ebp-3FCH], 1
        jz      L_035
        sub     esp, 12
        push    L_104
        call    printf
        add     esp, 16
        mov     eax, 1
        jmp     L_040

L_035:  sub     esp, 12
        push    1001
        call    malloc
        add     esp, 16
        mov     edx, eax
        mov     eax, dword [ebp-40CH]
        mov     dword [eax], edx
        mov     eax, dword [ebp-40CH]
        mov     eax, dword [eax]
        sub     esp, 8
        lea     edx, [ebp-3F5H]
        push    edx
        push    eax
        call    strcpy
        add     esp, 16
        mov     edx, dword [ebp-404H]
        mov     eax, dword [ebp-40CH]
        mov     dword [eax+4H], edx
        mov     dword [ebp-400H], -1
        sub     esp, 4
        lea     eax, [ebp-400H]
        push    eax
        push    L_093
        push    dword [ebp-410H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     eax, dword [ebp-400H]
        cmp     eax, 2
        jz      L_038
        cmp     eax, 2
        jg      L_039
        test    eax, eax
        jz      L_036
        cmp     eax, 1
        jz      L_037
        jmp     L_039

L_036:  mov     eax, dword [ebp-40CH]
        mov     dword [eax+8H], 0
        mov     eax, dword [ebp-40CH]
        add     eax, 12
        sub     esp, 8
        push    dword [ebp-410H]
        push    eax
        call    _Z2InP5beastP8_IO_FILE
        add     esp, 16
        jmp     L_040

L_037:  mov     eax, dword [ebp-40CH]
        mov     dword [eax+8H], 1
        mov     eax, dword [ebp-40CH]
        add     eax, 12
        sub     esp, 8
        push    dword [ebp-410H]
        push    eax
        call    _Z2InP4fishP8_IO_FILE
        add     esp, 16
        jmp     L_040

L_038:  mov     eax, dword [ebp-40CH]
        mov     dword [eax+8H], 2
        mov     eax, dword [ebp-40CH]
        add     eax, 12
        sub     esp, 8
        push    dword [ebp-410H]
        push    eax
        call    _Z2InP4birdP8_IO_FILE
        add     esp, 16
        jmp     L_040

L_039:  mov     eax, 1
L_040:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_041
        call    __stack_chk_fail
L_041:  leave
        ret


_Z5InRndP6animal:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 12
        push    1001
        call    malloc
        add     esp, 16
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        mov     dword [eax], edx
        call    _ZL8RandNamev
        mov     edx, dword [ebp+8H]
        mov     edx, dword [edx]
        sub     esp, 8
        push    eax
        push    edx
        call    strcpy
        add     esp, 16
        sub     esp, 8
        push    5000
        push    1
        call    _ZL4Randii
        add     esp, 16
        mov     edx, dword [ebp+8H]
        mov     dword [edx+4H], eax
        sub     esp, 8
        push    3
        push    0
        call    _ZL4Randii
        add     esp, 16
        mov     dword [ebp-0CH], eax
        cmp     dword [ebp-0CH], 2
        jz      L_044
        cmp     dword [ebp-0CH], 2
        jg      L_045
        cmp     dword [ebp-0CH], 0
        jz      L_042
        cmp     dword [ebp-0CH], 1
        jz      L_043
        jmp     L_045

L_042:  mov     eax, dword [ebp+8H]
        mov     dword [eax+8H], 0
        mov     eax, dword [ebp+8H]
        add     eax, 12
        sub     esp, 12
        push    eax
        call    _Z5InRndP5beast
        add     esp, 16
        jmp     L_045

L_043:  mov     eax, dword [ebp+8H]
        mov     dword [eax+8H], 1
        mov     eax, dword [ebp+8H]
        add     eax, 12
        sub     esp, 12
        push    eax
        call    _Z5InRndP4fish
        add     esp, 16
        jmp     L_045

L_044:  mov     eax, dword [ebp+8H]
        mov     dword [eax+8H], 2
        mov     eax, dword [ebp+8H]
        add     eax, 12
        sub     esp, 12
        push    eax
        call    _Z5InRndP4bird
        add     esp, 16
        nop
L_045:  nop
        leave
        ret


_Z13CountQuotientPci:
        push    ebp
        mov     ebp, esp
        sub     esp, 16
        mov     dword [ebp-0CH], 0
        mov     dword [ebp-8H], 0
        jmp     L_047

L_046:  mov     edx, dword [ebp-8H]
        mov     eax, dword [ebp+8H]
        add     eax, edx
        movzx   eax, byte [eax]
        movsx   eax, al
        add     dword [ebp-0CH], eax
        add     dword [ebp-8H], 1
L_047:  mov     eax, dword [ebp-8H]
        cmp     eax, 3
        jbe     L_046
        fild    dword [ebp-0CH]
        fldz
        faddp   st1, st0
        fild    dword [ebp+0CH]
        fdivp   st1, st0
        fstp    dword [ebp-4H]
        fld     dword [ebp-4H]
        leave
        ret


_Z3OutPK6animalP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+8H]
        cmp     eax, 2
        je      L_050
        cmp     eax, 2
        jg      L_051
        test    eax, eax
        jz      L_048
        cmp     eax, 1
        jz      L_049
        jmp     L_051

L_048:  mov     eax, dword [ebp+8H]
        mov     edx, dword [eax+4H]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        push    edx
        push    eax
        call    _Z13CountQuotientPci
        add     esp, 8
        fstp    qword [ebp-10H]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+0CH]
        sub     esp, 12
        push    eax
        call    _Z7GetNameN5beast4typeE
        add     esp, 16
        mov     edx, dword [ebp+8H]
        mov     ecx, dword [edx+4H]
        mov     edx, dword [ebp+8H]
        mov     edx, dword [edx]
        sub     esp, 4
        push    dword [ebp-0CH]
        push    dword [ebp-10H]
        push    eax
        push    ecx
        push    edx
        push    L_105
        push    dword [ebp+0CH]
        call    fprintf
        add     esp, 32
        jmp     L_052

L_049:  mov     eax, dword [ebp+8H]
        mov     edx, dword [eax+4H]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        sub     esp, 8
        push    edx
        push    eax
        call    _Z13CountQuotientPci
        add     esp, 16
        fstp    qword [ebp-10H]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+0CH]
        sub     esp, 12
        push    eax
        call    _Z7GetNameN4fish4areaE
        add     esp, 16
        mov     edx, dword [ebp+8H]
        mov     ecx, dword [edx+4H]
        mov     edx, dword [ebp+8H]
        mov     edx, dword [edx]
        sub     esp, 4
        push    dword [ebp-0CH]
        push    dword [ebp-10H]
        push    eax
        push    ecx
        push    edx
        push    L_106
        push    dword [ebp+0CH]
        call    fprintf
        add     esp, 32
        jmp     L_052

L_050:  mov     eax, dword [ebp+8H]
        mov     edx, dword [eax+4H]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        sub     esp, 8
        push    edx
        push    eax
        call    _Z13CountQuotientPci
        add     esp, 16
        fstp    qword [ebp-10H]
        mov     eax, dword [ebp+8H]
        movzx   eax, byte [eax+0CH]
        movzx   eax, al
        sub     esp, 12
        push    eax
        call    _Z7GetNamei
        add     esp, 16
        mov     edx, dword [ebp+8H]
        mov     ecx, dword [edx+4H]
        mov     edx, dword [ebp+8H]
        mov     edx, dword [edx]
        sub     esp, 4
        push    dword [ebp-0CH]
        push    dword [ebp-10H]
        push    eax
        push    ecx
        push    edx
        push    L_107
        push    dword [ebp+0CH]
        call    fprintf
        add     esp, 32
        jmp     L_052

L_051:  sub     esp, 12
        push    L_108
        call    puts
        add     esp, 16
        nop
L_052:  nop
        leave
        ret


_Z4Initv:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        sub     esp, 12
        push    40004
        call    malloc
        add     esp, 16
        mov     dword [ebp-0CH], eax
        mov     eax, dword [ebp-0CH]
        mov     dword [eax], 0
        mov     dword [ebp-10H], 0
        jmp     L_054

L_053:  mov     eax, dword [ebp-0CH]
        mov     edx, dword [ebp-10H]
        mov     dword [eax+edx*4+4H], 0
        add     dword [ebp-10H], 1
L_054:  cmp     dword [ebp-10H], 9999
        jle     L_053
        mov     eax, dword [ebp-0CH]
        leave
        ret


_Z5ClearP9container:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        mov     dword [ebp-0CH], 0
        jmp     L_057

L_055:  mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-0CH]
        mov     eax, dword [eax+edx*4+4H]
        test    eax, eax
        jz      L_056
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-0CH]
        mov     eax, dword [eax+edx*4+4H]
        sub     esp, 12
        push    eax
        call    free
        add     esp, 16
L_056:  add     dword [ebp-0CH], 1
L_057:  mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        cmp     dword [ebp-0CH], eax
        jl      L_055
        mov     eax, dword [ebp+8H]
        mov     dword [eax], 0
        nop
        leave
        ret


_Z7AddItemP9containerP6animal:
        push    ebp
        mov     ebp, esp
        push    ebx
        sub     esp, 4
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        test    eax, eax
        jnz     L_058
        mov     eax, dword [ebp+8H]
        mov     ebx, dword [eax]
        sub     esp, 12
        push    4
        call    malloc
        add     esp, 16
        mov     edx, eax
        mov     eax, dword [ebp+8H]
        mov     dword [eax+ebx*4+4H], edx
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     ebx, dword [eax+edx*4+4H]
        sub     esp, 12
        push    1001
        call    malloc
        add     esp, 16
        mov     dword [ebx], eax
L_058:  mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [ebp+0CH]
        mov     edx, dword [edx+8H]
        mov     dword [eax+8H], edx
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [ebp+0CH]
        mov     edx, dword [edx+4H]
        mov     dword [eax+4H], edx
        mov     eax, dword [ebp+0CH]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     ecx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+ecx*4+4H]
        mov     eax, dword [eax]
        sub     esp, 8
        push    edx
        push    eax
        call    strcpy
        add     esp, 16
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [ebp+0CH]
        mov     edx, dword [edx+0CH]
        mov     dword [eax+0CH], edx
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [ebp+0CH]
        movzx   edx, byte [edx+0CH]
        mov     byte [eax+0CH], dl
        mov     eax, dword [ebp+8H]
        mov     edx, dword [eax]
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [ebp+0CH]
        mov     edx, dword [edx+0CH]
        mov     dword [eax+0CH], edx
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        lea     edx, [eax+1H]
        mov     eax, dword [ebp+8H]
        mov     dword [eax], edx
        nop
        mov     ebx, dword [ebp-4H]
        leave
        ret


_Z2InP9containerP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 72
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-3CH], eax
        mov     eax, dword [ebp+0CH]
        mov     dword [ebp-40H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        sub     esp, 4
        lea     eax, [ebp-2CH]
        push    eax
        push    L_109
        push    dword [ebp-40H]
        call    __isoc99_fscanf
        add     esp, 16
        mov     dword [ebp-24H], eax
        cmp     dword [ebp-24H], 1
        jz      L_059
        sub     esp, 12
        push    L_110
        call    puts
        add     esp, 16
        mov     eax, 1
        jmp     L_067

L_059:  mov     eax, dword [ebp-2CH]
        test    eax, eax
        js      L_060
        mov     eax, dword [ebp-2CH]
        cmp     eax, 10000
        jle     L_061
L_060:  sub     esp, 8
        push    40004
        push    L_111
        call    printf
        add     esp, 16
        mov     eax, 1
        jmp     L_067

L_061:  mov     dword [ebp-28H], 0
        jmp     L_066

L_062:  mov     dword [ebp-1CH], 0
        mov     dword [ebp-18H], 0
        mov     dword [ebp-14H], 0
        mov     dword [ebp-10H], 0
        sub     esp, 8
        push    dword [ebp-40H]
        lea     eax, [ebp-1CH]
        push    eax
        call    _Z2InP6animalP8_IO_FILE
        add     esp, 16
        mov     dword [ebp-20H], eax
        cmp     dword [ebp-20H], 0
        jz      L_063
        sub     esp, 8
        push    dword [ebp-28H]
        push    L_112
        call    printf
        add     esp, 16
        mov     eax, 1
        jmp     L_067

L_063:  mov     eax, dword [ebp-3CH]
        mov     eax, dword [eax]
        cmp     eax, 9999
        jle     L_064
        sub     esp, 12
        push    L_113
        call    printf
        add     esp, 16
        jmp     L_065

L_064:  sub     esp, 8
        lea     eax, [ebp-1CH]
        push    eax
        push    dword [ebp-3CH]
        call    _Z7AddItemP9containerP6animal
        add     esp, 16
L_065:  add     dword [ebp-28H], 1
L_066:  mov     eax, dword [ebp-2CH]
        cmp     dword [ebp-28H], eax
        jl      L_062
        mov     eax, 0
L_067:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_068
        call    __stack_chk_fail
L_068:  leave
        ret


_Z5InRndP9containeriP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 56
        mov     eax, dword [ebp+8H]
        mov     dword [ebp-2CH], eax
        mov     eax, dword [ebp+10H]
        mov     dword [ebp-30H], eax

        mov     eax, dword [gs:14H]
        mov     dword [ebp-0CH], eax
        xor     eax, eax
        cmp     dword [ebp+0CH], 0
        js      L_069
        cmp     dword [ebp+0CH], 10000
        jle     L_070
L_069:  sub     esp, 8
        push    10000
        push    L_114
        call    printf
        add     esp, 16
        mov     eax, 1
        jmp     L_077

L_070:  sub     esp, 4
        push    dword [ebp+0CH]
        push    L_093
        push    dword [ebp-30H]
        call    fprintf
        add     esp, 16
        mov     dword [ebp-20H], 0
        jmp     L_076

L_071:  sub     esp, 12
        lea     eax, [ebp-1CH]
        push    eax
        call    _Z5InRndP6animal
        add     esp, 16
        mov     eax, dword [ebp-14H]
        mov     ecx, eax
        mov     edx, dword [ebp-18H]
        mov     eax, dword [ebp-1CH]
        sub     esp, 12
        push    ecx
        push    edx
        push    eax
        push    L_115
        push    dword [ebp-30H]
        call    fprintf
        add     esp, 32
        mov     eax, dword [ebp-14H]
        cmp     eax, 2
        jz      L_074
        cmp     eax, 2
        jg      L_075
        test    eax, eax
        jz      L_072
        cmp     eax, 1
        jz      L_073
        jmp     L_075

L_072:  mov     eax, dword [ebp-10H]
        sub     esp, 4
        push    eax
        push    L_093
        push    dword [ebp-30H]
        call    fprintf
        add     esp, 16
        jmp     L_075

L_073:  mov     eax, dword [ebp-10H]
        sub     esp, 4
        push    eax
        push    L_093
        push    dword [ebp-30H]
        call    fprintf
        add     esp, 16
        jmp     L_075

L_074:  movzx   eax, byte [ebp-10H]
        movzx   eax, al
        sub     esp, 4
        push    eax
        push    L_093
        push    dword [ebp-30H]
        call    fprintf
        add     esp, 16
        nop
L_075:  sub     esp, 8
        lea     eax, [ebp-1CH]
        push    eax
        push    dword [ebp-2CH]
        call    _Z7AddItemP9containerP6animal
        add     esp, 16
        add     dword [ebp-20H], 1
L_076:  mov     eax, dword [ebp-20H]
        cmp     eax, dword [ebp+0CH]
        jl      L_071
        mov     eax, 0
L_077:  mov     edx, dword [ebp-0CH]

        sub     edx, dword [gs:14H]
        jz      L_078
        call    __stack_chk_fail
L_078:  leave
        ret


_Z3OutPK9containerP8_IO_FILE:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        sub     esp, 4
        push    eax
        push    L_116
        push    dword [ebp+0CH]
        call    fprintf
        add     esp, 16
        mov     dword [ebp-0CH], 0
        jmp     L_080

L_079:  sub     esp, 4
        push    dword [ebp-0CH]
        push    L_117
        push    dword [ebp+0CH]
        call    fprintf
        add     esp, 16
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-0CH]
        mov     eax, dword [eax+edx*4+4H]
        sub     esp, 8
        push    dword [ebp+0CH]
        push    eax
        call    _Z3OutPK6animalP8_IO_FILE
        add     esp, 16
        add     dword [ebp-0CH], 1
L_080:  mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        cmp     dword [ebp-0CH], eax
        jl      L_079
        nop
        nop
        leave
        ret


_Z17StraightSelectionP9container:
        push    ebp
        mov     ebp, esp
        sub     esp, 24
        mov     dword [ebp-10H], 0
        jmp     L_085

L_081:  mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-10H]
        mov     eax, dword [eax+edx*4+4H]
        mov     dword [ebp-4H], eax
        mov     eax, dword [ebp-10H]
        mov     dword [ebp-0CH], eax
        mov     eax, dword [ebp-10H]
        add     eax, 1
        mov     dword [ebp-8H], eax
        jmp     L_084

L_082:  mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-8H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [eax+4H]
        mov     eax, dword [ebp+8H]
        mov     ecx, dword [ebp-8H]
        mov     eax, dword [eax+ecx*4+4H]
        mov     eax, dword [eax]
        push    edx
        push    eax
        call    _Z13CountQuotientPci
        add     esp, 8
        fstp    dword [ebp-14H]
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-10H]
        mov     eax, dword [eax+edx*4+4H]
        mov     edx, dword [eax+4H]
        mov     eax, dword [ebp+8H]
        mov     ecx, dword [ebp-10H]
        mov     eax, dword [eax+ecx*4+4H]
        mov     eax, dword [eax]
        push    edx
        push    eax
        call    _Z13CountQuotientPci
        add     esp, 8
        fld     dword [ebp-14H]
        fcomip  st0  , st1
        fstp    st0
        seta    al
        test    al, al
        jz      L_083
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-8H]
        mov     ecx, dword [eax+edx*4+4H]
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-10H]
        mov     dword [eax+edx*4+4H], ecx
        mov     eax, dword [ebp-8H]
        mov     dword [ebp-0CH], eax
L_083:  add     dword [ebp-8H], 1
L_084:  mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        cmp     dword [ebp-8H], eax
        jl      L_082
        mov     eax, dword [ebp+8H]
        mov     edx, dword [ebp-0CH]
        mov     ecx, dword [ebp-4H]
        mov     dword [eax+edx*4+4H], ecx
        add     dword [ebp-10H], 1
L_085:  mov     eax, dword [ebp+8H]
        mov     eax, dword [eax]
        sub     eax, 1
        cmp     dword [ebp-10H], eax
        jl      L_081
        nop
        nop
        leave
        ret


_Z11helpMessagev:
        push    ebp
        mov     ebp, esp
        sub     esp, 8
        sub     esp, 12
        push    L_118
        call    puts
        add     esp, 16
        nop
        leave
        ret


_Z11errMessage1v:
        push    ebp
        mov     ebp, esp
        sub     esp, 8
        sub     esp, 12
        push    L_119
        call    puts
        add     esp, 16
        nop
        leave
        ret


_Z11errMessage2v:
        push    ebp
        mov     ebp, esp
        sub     esp, 8
        sub     esp, 12
        push    L_120
        call    puts
        add     esp, 16
        nop
        leave
        ret


main:
        lea     ecx, [esp+4H]
        and     esp, 0FFFFFFF0H
        push    dword [ecx-4H]
        push    ebp
        mov     ebp, esp
        push    esi
        push    ebx
        push    ecx
        sub     esp, 60
        mov     ebx, ecx
        sub     esp, 12
        push    0
        call    time
        add     esp, 16
        sub     esp, 12
        push    eax
        call    srand
        add     esp, 16
        call    clock
        mov     dword [ebp-3CH], eax
        call    _Z11helpMessagev
        cmp     dword [ebx], 4
        jz      L_086
        call    _Z11errMessage1v
        mov     eax, 1
        jmp     L_091

L_086:  sub     esp, 12
        push    L_121
        call    puts
        add     esp, 16
        call    _Z4Initv
        mov     dword [ebp-38H], eax
        mov     eax, dword [ebx+4H]
        add     eax, 4
        mov     eax, dword [eax]
        sub     esp, 8
        push    L_122
        push    eax
        call    strcmp
        add     esp, 16
        test    eax, eax
        jne     L_088
        mov     eax, dword [ebx+4H]
        add     eax, 8
        mov     eax, dword [eax]
        sub     esp, 8
        push    L_123
        push    eax
        call    fopen
        add     esp, 16
        mov     dword [ebp-28H], eax
        sub     esp, 8
        push    dword [ebp-28H]
        push    dword [ebp-38H]
        call    _Z2InP9containerP8_IO_FILE
        add     esp, 16
        mov     dword [ebp-24H], eax
        sub     esp, 12
        push    dword [ebp-28H]
        call    fclose
        add     esp, 16
        cmp     dword [ebp-24H], 0
        jz      L_087
        sub     esp, 12
        push    L_124
        call    puts
        add     esp, 16
        jmp     L_090

L_087:  mov     eax, dword [ebx+4H]
        add     eax, 12
        mov     eax, dword [eax]
        sub     esp, 8
        push    L_125
        push    eax
        call    fopen
        add     esp, 16
        mov     dword [ebp-20H], eax
        sub     esp, 8
        push    dword [ebp-20H]
        push    dword [ebp-38H]
        call    _Z3OutPK9containerP8_IO_FILE
        add     esp, 16
        push    dword [ebp-20H]
        push    21
        push    1
        push    L_126
        call    fwrite
        add     esp, 16
        sub     esp, 12
        push    dword [ebp-38H]
        call    _Z17StraightSelectionP9container
        add     esp, 16
        sub     esp, 8
        push    dword [ebp-20H]
        push    dword [ebp-38H]
        call    _Z3OutPK9containerP8_IO_FILE
        add     esp, 16
        sub     esp, 12
        push    dword [ebp-20H]
        call    fclose
        add     esp, 16
        jmp     L_090

L_088:  mov     eax, dword [ebx+4H]
        add     eax, 4
        mov     eax, dword [eax]
        sub     esp, 8
        push    L_127
        push    eax
        call    strcmp
        add     esp, 16
        test    eax, eax
        jne     L_089
        mov     eax, dword [ebx+4H]
        add     eax, 8
        mov     eax, dword [eax]
        sub     esp, 12
        push    eax
        call    atoi
        add     esp, 16
        mov     dword [ebp-34H], eax
        mov     eax, dword [ebx+4H]
        add     eax, 12
        mov     esi, dword [eax]
        sub     esp, 12
        push    esi
        call    strlen
        add     esp, 16
        add     eax, esi
        mov     dword [eax], 1852139359
        mov     dword [eax+4H], 1952543333

        mov     word [eax+8H], 25701
        mov     byte [eax+0AH], 0
        sub     esp, 8
        push    L_125
        push    esi
        call    fopen
        add     esp, 16
        mov     dword [ebp-30H], eax
        mov     eax, dword [ebx+4H]
        add     eax, 12
        mov     ebx, dword [eax]
        sub     esp, 12
        push    ebx
        call    strlen
        add     esp, 16
        add     eax, ebx
        mov     dword [eax], 1953853279
        mov     dword [eax+4H], 7632240
        sub     esp, 8
        push    L_125
        push    ebx
        call    fopen
        add     esp, 16
        mov     dword [ebp-2CH], eax
        sub     esp, 4
        push    dword [ebp-30H]
        push    dword [ebp-34H]
        push    dword [ebp-38H]
        call    _Z5InRndP9containeriP8_IO_FILE
        add     esp, 16
        sub     esp, 8
        push    dword [ebp-2CH]
        push    dword [ebp-38H]
        call    _Z3OutPK9containerP8_IO_FILE
        add     esp, 16
        push    dword [ebp-2CH]
        push    21
        push    1
        push    L_126
        call    fwrite
        add     esp, 16
        sub     esp, 12
        push    dword [ebp-38H]
        call    _Z17StraightSelectionP9container
        add     esp, 16
        sub     esp, 8
        push    dword [ebp-2CH]
        push    dword [ebp-38H]
        call    _Z3OutPK9containerP8_IO_FILE
        add     esp, 16
        sub     esp, 12
        push    dword [ebp-2CH]
        call    fclose
        add     esp, 16
        jmp     L_090

L_089:  call    _Z11errMessage2v
        mov     eax, 1
        jmp     L_091

L_090:  mov     dword [ebp-38H], 0
        sub     esp, 12
        push    L_128
        call    puts
        add     esp, 16
        call    clock
        mov     dword [ebp-1CH], eax
        sub     esp, 8
        push    dword [ebp-3CH]
        push    dword [ebp-1CH]
        call    difftime
        add     esp, 16
        fld     qword [L_130]
        fdivp   st1, st0
        sub     esp, 4
        lea     esp, [esp-8H]
        fstp    qword [esp]
        push    L_129
        call    printf
        add     esp, 16
        mov     eax, 0
L_091:  lea     esp, [ebp-0CH]
        pop     ecx
        pop     ebx
        pop     esi
        pop     ebp
        lea     esp, [ecx-4H]
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata align=8

L_092:
        db 61H, 62H, 63H, 64H, 65H, 66H, 67H, 68H
        db 69H, 6AH, 6BH, 6CH, 6DH, 6EH, 6FH, 70H
        db 71H, 72H, 73H, 74H, 75H, 76H, 77H, 78H
        db 79H, 7AH, 00H

L_093:
        db 25H, 64H, 0AH, 00H

L_094:
        db 50H, 52H, 45H, 44H, 41H, 54H, 4FH, 52H
        db 00H

L_095:
        db 48H, 45H, 52H, 42H, 49H, 56H, 4FH, 52H
        db 45H, 00H

L_096:
        db 49H, 4EH, 53H, 45H, 43H, 54H, 49H, 56H
        db 4FH, 52H, 4FH, 55H, 53H, 00H

L_097:
        db 52H, 49H, 56H, 45H, 52H, 00H

L_098:
        db 53H, 45H, 41H, 00H

L_099:
        db 4CH, 41H, 4BH, 45H, 00H

L_100:
        db 46H, 41H, 4CH, 53H, 45H, 00H

L_101:
        db 54H, 52H, 55H, 45H, 00H

L_102:
        db 25H, 73H, 0AH, 00H

L_103:
        db 57H, 72H, 6FH, 6EH, 67H, 20H, 61H, 6EH
        db 69H, 6DH, 61H, 6CH, 20H, 6EH, 61H, 6DH
        db 65H, 21H, 00H

L_104:
        db 57H, 72H, 6FH, 6EH, 67H, 20H, 61H, 6EH
        db 69H, 6DH, 61H, 6CH, 20H, 77H, 65H, 69H
        db 67H, 68H, 74H, 21H, 00H, 00H, 00H

L_105:
        db 49H, 74H, 20H, 69H, 73H, 20H, 61H, 20H
        db 62H, 65H, 61H, 73H, 74H, 3AH, 20H, 6EH
        db 61H, 6DH, 65H, 20H, 3DH, 20H, 25H, 73H
        db 2CH, 20H, 77H, 65H, 69H, 67H, 68H, 74H
        db 20H, 3DH, 20H, 25H, 64H, 2CH, 20H, 74H
        db 79H, 70H, 65H, 20H, 3DH, 20H, 25H, 73H
        db 2CH, 20H, 66H, 75H, 6EH, 63H, 74H, 69H
        db 6FH, 6EH, 20H, 72H, 65H, 73H, 75H, 6CH
        db 74H, 20H, 3DH, 20H, 25H, 66H, 2EH, 0AH
        db 00H, 00H, 00H, 00H

L_106:
        db 49H, 74H, 20H, 69H, 73H, 20H, 61H, 20H
        db 66H, 69H, 73H, 68H, 3AH, 20H, 6EH, 61H
        db 6DH, 65H, 20H, 3DH, 20H, 25H, 73H, 2CH
        db 20H, 77H, 65H, 69H, 67H, 68H, 74H, 20H
        db 3DH, 20H, 25H, 64H, 2CH, 20H, 61H, 72H
        db 65H, 61H, 20H, 3DH, 20H, 25H, 73H, 2CH
        db 20H, 66H, 75H, 6EH, 63H, 74H, 69H, 6FH
        db 6EH, 20H, 72H, 65H, 73H, 75H, 6CH, 74H
        db 20H, 3DH, 20H, 25H, 66H, 2EH, 0AH, 00H

L_107:
        db 49H, 74H, 20H, 69H, 73H, 20H, 61H, 20H
        db 62H, 69H, 72H, 64H, 3AH, 20H, 6EH, 61H
        db 6DH, 65H, 20H, 3DH, 20H, 25H, 73H, 2CH
        db 20H, 77H, 65H, 69H, 67H, 68H, 74H, 20H
        db 3DH, 20H, 25H, 64H, 2CH, 20H, 6DH, 69H
        db 67H, 72H, 61H, 74H, 69H, 6FH, 6EH, 20H
        db 3DH, 20H, 25H, 73H, 2CH, 20H, 66H, 75H
        db 6EH, 63H, 74H, 69H, 6FH, 6EH, 20H, 72H
        db 65H, 73H, 75H, 6CH, 74H, 20H, 3DH, 20H
        db 25H, 66H, 2EH, 0AH, 00H

L_108:
        db 49H, 6EH, 63H, 6FH, 72H, 72H, 65H, 63H
        db 74H, 20H, 61H, 6EH, 69H, 6DH, 61H, 6CH
        db 20H, 74H, 79H, 70H, 65H, 21H, 00H

L_109:
        db 25H, 6CH, 64H, 0AH, 00H

L_110:
        db 57H, 72H, 6FH, 6EH, 67H, 20H, 66H, 6FH
        db 72H, 6DH, 61H, 74H, 21H, 00H, 00H

L_111:
        db 41H, 6DH, 6FH, 75H, 6EH, 74H, 20H, 6FH
        db 66H, 20H, 69H, 74H, 65H, 6DH, 73H, 20H
        db 69H, 6EH, 20H, 63H, 6FH, 6EH, 74H, 61H
        db 69H, 6EH, 65H, 72H, 20H, 6DH, 75H, 73H
        db 74H, 20H, 62H, 65H, 20H, 3CH, 20H, 25H
        db 6CH, 64H, 20H, 61H, 6EH, 64H, 20H, 3EH
        db 20H, 30H, 2EH, 0AH, 00H, 00H, 00H, 00H

L_112:
        db 43H, 6FH, 75H, 6CH, 64H, 6EH, 27H, 74H
        db 20H, 63H, 72H, 65H, 61H, 74H, 65H, 20H
        db 69H, 74H, 65H, 6DH, 20H, 77H, 69H, 74H
        db 68H, 20H, 69H, 6EH, 64H, 65H, 78H, 20H
        db 3DH, 20H, 25H, 64H, 2EH, 0AH, 00H

L_113:
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H
        db 72H, 20H, 69H, 73H, 20H, 66H, 75H, 6CH
        db 6CH, 2EH, 00H, 00H, 00H

L_114:
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H
        db 72H, 20H, 73H, 69H, 7AH, 65H, 20H, 6DH
        db 75H, 73H, 74H, 20H, 62H, 65H, 20H, 3EH
        db 20H, 30H, 20H, 61H, 6EH, 64H, 20H, 3CH
        db 20H, 25H, 64H, 2EH, 0AH, 00H

L_115:
        db 25H, 73H, 0AH, 25H, 64H, 0AH, 25H, 64H
        db 0AH, 00H

L_116:
        db 43H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H
        db 72H, 20H, 63H, 6FH, 6EH, 74H, 61H, 69H
        db 6EH, 73H, 20H, 25H, 64H, 20H, 65H, 6CH
        db 65H, 6DH, 65H, 6EH, 74H, 73H, 2EH, 0AH
        db 00H

L_117:
        db 25H, 64H, 20H, 3AH, 20H, 00H, 00H

L_118:
        db 49H, 6EH, 73H, 74H, 72H, 75H, 63H, 74H
        db 69H, 6FH, 6EH, 21H, 0AH, 0AH, 59H, 6FH
        db 75H, 20H, 63H, 61H, 6EH, 20H, 6FH, 70H
        db 65H, 6EH, 20H, 69H, 6EH, 70H, 75H, 74H
        db 20H, 66H, 69H, 6CH, 65H, 20H, 75H, 73H
        db 69H, 6EH, 67H, 20H, 63H, 6FH, 6DH, 6DH
        db 61H, 6EH, 64H, 3AH, 0AH, 09H, 2DH, 66H
        db 20H, 2AH, 69H, 6EH, 70H, 75H, 74H, 2AH
        db 20H, 2AH, 6FH, 75H, 74H, 70H, 75H, 74H
        db 2AH, 0AH, 77H, 68H, 65H, 72H, 65H, 20H
        db 2AH, 69H, 6EH, 70H, 75H, 74H, 2AH, 20H
        db 61H, 6EH, 64H, 20H, 2AH, 6FH, 75H, 74H
        db 70H, 75H, 74H, 2AH, 20H, 61H, 72H, 65H
        db 20H, 70H, 61H, 74H, 68H, 73H, 2EH, 0AH
        db 0AH, 59H, 6FH, 75H, 20H, 63H, 61H, 6EH
        db 20H, 63H, 72H, 65H, 61H, 74H, 65H, 20H
        db 72H, 61H, 6EH, 64H, 6FH, 6DH, 20H, 69H
        db 6EH, 70H, 75H, 74H, 20H, 66H, 69H, 6CH
        db 65H, 20H, 75H, 73H, 69H, 6EH, 67H, 20H
        db 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H, 3AH
        db 0AH, 09H, 2DH, 6EH, 20H, 2AH, 73H, 69H
        db 7AH, 65H, 2AH, 20H, 2AH, 66H, 69H, 6CH
        db 65H, 73H, 20H, 70H, 61H, 74H, 68H, 2AH
        db 0AH, 77H, 68H, 65H, 72H, 65H, 20H, 2AH
        db 73H, 69H, 7AH, 65H, 2AH, 20H, 69H, 73H
        db 20H, 61H, 6EH, 20H, 61H, 6DH, 6FH, 75H
        db 6EH, 74H, 20H, 6FH, 66H, 20H, 69H, 74H
        db 65H, 6DH, 73H, 20H, 69H, 6EH, 20H, 63H
        db 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H, 72H
        db 2CH, 20H, 2AH, 66H, 69H, 6CH, 65H, 73H
        db 20H, 70H, 61H, 74H, 68H, 2AH, 20H, 69H
        db 73H, 20H, 70H, 61H, 74H, 68H, 20H, 66H
        db 6FH, 72H, 20H, 69H, 6EH, 70H, 75H, 74H
        db 20H, 61H, 6EH, 64H, 20H, 6FH, 75H, 74H
        db 70H, 75H, 74H, 20H, 66H, 69H, 6CH, 65H
        db 73H, 2EH, 0AH, 00H

L_119:
        db 57H, 72H, 6FH, 6EH, 67H, 20H, 69H, 6EH
        db 70H, 75H, 74H, 20H, 61H, 72H, 67H, 75H
        db 6DH, 65H, 6EH, 74H, 73H, 21H, 00H

L_120:
        db 57H, 72H, 6FH, 6EH, 67H, 20H, 63H, 6FH
        db 6DH, 6DH, 61H, 6EH, 64H, 21H, 00H

L_121:
        db 53H, 74H, 61H, 72H, 74H, 21H, 00H

L_122:
        db 2DH, 66H, 00H

L_123:
        db 72H, 00H

L_124:
        db 43H, 6FH, 75H, 6CH, 64H, 6EH, 27H, 74H
        db 20H, 6FH, 70H, 65H, 6EH, 20H, 69H, 6EH
        db 70H, 75H, 74H, 20H, 66H, 69H, 6CH, 65H
        db 2EH, 00H

L_125:
        db 77H, 00H

L_126:
        db 0AH, 53H, 6FH, 72H, 74H, 65H, 64H, 20H
        db 63H, 6FH, 6EH, 74H, 61H, 69H, 6EH, 65H
        db 72H, 20H, 3AH, 20H, 0AH, 00H

L_127:
        db 2DH, 6EH, 00H

L_128:
        db 53H, 74H, 6FH, 70H, 21H, 00H

L_129:
        db 50H, 72H, 6FH, 67H, 72H, 61H, 6DH, 20H
        db 72H, 75H, 6EH, 6EH, 69H, 6EH, 67H, 20H
        db 74H, 69H, 6DH, 65H, 20H, 3DH, 20H, 25H
        db 66H, 0AH, 00H, 00H, 00H, 00H, 00H

L_130:  dq 412E848000000000H


SECTION .note.gnu.property align=4

        db 04H, 00H, 00H, 00H, 18H, 00H, 00H, 00H
        db 05H, 00H, 00H, 00H, 47H, 4EH, 55H, 00H
        db 02H, 00H, 01H, 0C0H, 04H, 00H, 00H, 00H
        db 01H, 00H, 00H, 00H, 01H, 00H, 01H, 0C0H
        db 04H, 00H, 00H, 00H, 03H, 00H, 00H, 00H


