.include "string.asm" 
@ Data Section   .fill  repeat, size, value
.section .data

@ Program description declaration
.balign 4
stringProgramDescript: .asciz "Olá!\nPor favor insira o numero correspondente ao metodo que deseja testar!\n1-memcpy\n2-strlen\n3-memchr\n4-memmove\n5-strcpy\n6-strncpy\n7-strncmp\n8-strcmp\n9-strspn\n10-strrchr\n11-strcspn\n12-strpbrk\n13-strxfrm\n14-memset\n15-strstr"
.balign 4
stringProgrammemcpyDescript: .asciz "\n1- (memcpy) Esta funcionalidade substitui os N caracteres da primeira string pelos da segunda string!\n"
.balign 4
stringProgramstrlenDescript: .asciz "\n2- (strlen) Esta funcionalidade diz quantos caracteres tem a string!\n"
.balign 4
stringProgrammemchrDescript: .asciz "\n3- (memchr) Esta funcionalidade procura o caractere na string e retorna o pointer address de onde ela se encontra!\n"
.balign 4
stringProgrammemmoveDescript: .asciz "\n4- (memmove) Esta funcionalidade muda os N caracteres da primeira string pelos caracteres da segunda string!\n"
.balign 4
stringProgramstrcpyDescript: .asciz "\n5- (strcpy) Esta funcionalidade copia a segunda string para a primeira string!\n"
.balign 4
stringProgramstrncpyDescript: .asciz "\n6- (strncpy) Esta funcionalidade copia as N caracteres da segunda string para a primeira string!\n"
.balign 4
stringProgramstrncmpDescript: .asciz "\n7- (strncmp) Esta funcionalidade vê qual é a maior string em relação ao valor total do ASCII até n (se a str1 for menor a str2 a função devolve 0, se a str1 for maior a str2 a função devolve 1, se a str1 for igual a str2 a função devolve 2)!\n"
.balign 4
stringProgramstrcmpDescript: .asciz "\n8- (strcmp) Esta funcionalidade vê qual é a maior string em relação ao valor total do ASCII (se a str1 for menor a str2 a função devolve 0, se a str1 for maior a str2 a função devolve 1, se a str1 for igual a str2 a função devolve 2)!\n"
.balign 4
stringProgramstrspnDescript: .asciz "\n9- (strspn) Esta funcionalidade verifica até qual char a string 2 é igual a string 1, Exemplo: string1= (ABCD) string2=(AB) resultado vai ser 2!\n"
.balign 4
stringProgramstrrchrDescript: .asciz "\n10- (strrchr) Esta funcionalidade procura o último sítio onde se encontra o caractere(string 2) em relação á string 1 e mostra a string a partir daí!\n"
.balign 4
stringProgramstrcspnDescript: .asciz "\n11- (strcspn) Esta funcionalidade diz a quantidade de caracteres que são diferentes entre a 1º e a 2º string!\n"
.balign 4
stringProgramstrpbrkDescript: .asciz "\n12- (strpbrk) Esta funcionalidade verifica qual o primeiro caractere da sting 2 que é igual ao caractere da string 1 e retorna o pointer address onde se encontra esse caractere na string 1!\n"
.balign 4
stringProgramstrxfrmDescript: .asciz "\n13- (strxfrm) Esta funcionalidade muda os N caracteres da primeira string com os da segunda string, e retorna quantos caracteres foram copiados!\n"
.balign 4
stringProgrammemsetDescript: .asciz "\n14- (memset) Esta funcionalidade muda os N caracteres da primeira string com o caractere inserido na segunda string!\n"
.balign 4
stringProgramstrstrDescript: .asciz "\n15- (strstr) Esta funcionalidade diz onde se encontra a 2º string em relação á 1º string, retornando o seu pointer address!\n"
.balign 4
stringProgramstrcatDescript: .asciz "Esta funcionalidade coloca a string 1 à frente da string 2 numa nova string!\n"
.balign 4
stringRepeat: .asciz "\nDeseja repetir?(Se sim insira 1, se não insira 2):"
.balign 4
invalidInput: .asciz "Este valor não é valido!"
.balign 4
resultado: .asciz "\nResultado:"

@ Input
.balign 4
stringInputN:    .asciz "\nIntroduza o valor de N: "
.balign 4
stringInputStr1:    .asciz "\nIntroduza o valor da str 1: "
.balign 4
stringInputStr2:    .asciz "\nIntroduza o valor da str 2: "

@ Strings declaration
.balign 4
strlenString:    .asciz "Hello World"
.balign 4
memchrString:    .asciz "Hello World"
.balign 4
memchrStringComparation:    .asciz "l"
.balign 4
memmoveStringIn:    .asciz "Tomas"
.balign 4
memmoveStringOut:    .asciz "Pedro"
.balign 4
strcpyStringIn:    .asciz "Ramos"
.balign 4
strcpyStringOut:    .asciz "Pita"
.balign 4
strncpyStringIn:    .asciz "Tomas Ramos"
.balign 4
strncpyStringOut:    .asciz "Pedro Pita"
.balign 4
strspnStringIn:    .asciz "Tomas Ramos"
.balign 4
strspnStringOut:    .asciz "To"
.balign 4
strxfrmStringIn:    .asciz "Tomas Ramos"
.balign 4
strxfrmStringOut:    .asciz "Pedro Pita"
.balign 4
memcpyStringIn:    .asciz "Beja"
.balign 4
memcpyStringOut:    .asciz "ESTIG"
.balign 4
strcmpStringIn:    .asciz "ABCDE"
.balign 4
strcmpStringOut:    .asciz "AB"
.balign 4
strncmpStringIn:    .asciz "ABCDE"
.balign 4
strncmpStringOut:    .asciz "AB"
.balign 4
string_strcat_dest:    .asciz "Ola"
.balign 4
string_strcat_src:    .asciz "Bebe"
.balign 4
string_strcat_dest_storage:    .asciz ""
.balign 4
string_strrchr: .asciz "www.google.com"
.balign 4
string_strrchr_comparator: .asciz "."
.balign 4
string_strrchr_final: .asciz "\nResultado:"
.balign 4
strcspn_str1: .asciz "AFGAG4235"
.balign 4
strcspn_str2: .asciz "GA"
.balign 4
strpbrk_str1: .asciz "AFGAG4235"
.balign 4
strpbrk_str2: .asciz "GTF"
.balign 4
strpbrk_str_storage: .asciz ""
.balign 4
memset_str: .asciz "Pedro Pita"
.balign 4
memset_caracter: .asciz "$"
.balign 4
strstr_str1: .asciz "Tomas Ramos"
.balign 4
strstr_str2: .asciz "mos"
.balign 4
strstr_str_storage: .asciz ""

@ scan values declaration
.balign 4
scanInt:    .asciz "%d"
.balign 4
scanString: .asciz "%s"

@ print values declaration
.balign 4
printInt: .asciz "%d\n"
.balign 4
printInt2: .asciz "%d\n"
.balign 4
printLn: .asciz "\n"
.balign 4
printString: .asciz "%s"
.balign 4
printPointerAddress: .asciz "Pointer address: 0x%x "
.balign 4
int_scanned: .word 0

@ Imput
.balign 4
stringInput:    .asciz "\nIntroduza o valor de N: "
@ Data Section   .fill  repeat, size, value
.section .data
.global main
@ Declare printf, gets and scanf global functions to be called from this program:
.global printf
.global fgets
.global stdin           @ to open stdin to read from keyboard
.arm

@ print values declaration
.balign 4	
prompt:	.asciz	"> "
format: .asciz 	"%d"
num:	.int	0
.balign 4
n: .word 0
/*.balign 4
str1: .asciz ""
.balign 4
str2: .asciz ""*/

.balign 4
str1: .fill 100, 1, 0
.balign 4
str2: .fill 100, 1, 0

@ Code Section
.section .text

main:
    PUSH {LR} @ save LR state, becaus of the C funtions could change the state

    @ Mostra Menu
    LDR R0, =stringProgramDescript
    BL printf

    @Scan for input:
    LDR	R0, =stringInput	@ print the stringInput
	BL	printf

	LDR R0, =format	@ call scanf, and pass address of format
	LDR	R1, =num	@ string and address of num in r0, and r1,
	BL	scanf		@ respectively.

	LDR	R0, =num	@ print num formatted by output string.
    B callLibraryMethod
    BL _exit
    

callLibraryMethod:
    LDR	R0, [R0]
    
    case_1:
        CMP R0, #1 @1-memcpy
            BEQ test_memcpy
    case_2:
        CMP R0, #2 @2-strlen
            BEQ test_strlen
    case_3: 
        CMP R0, #3 @3-memchr
            BEQ test_memchr
    case_4:
        CMP R0, #4 @4-memmove
            BEQ test_memmove
    case_5:
        CMP R0, #5 @5-strcpy
            BEQ test_strcpy 
    case_6:
        CMP R0, #6 @6-strncpy
            BEQ test_strncpy
    case_7:
        CMP R0, #7 @7-strncmp
            BEQ test_strncmp
    case_8:
        CMP R0, #8 @8-strcmp
            BEQ test_strcmp
    case_9:
        CMP R0, #9 @9-strspn
            BEQ test_strspn
    case_10:
        CMP R0, #10 @10-strrchr
            BEQ test_strrchr
    case_11:
        CMP R0, #11 @11-strcspn
            BEQ test_strcspn
    case_12:
        CMP R0, #12 @12-strpbrk
            BEQ test_strpbrk
    case_13:
        CMP R0, #13 @13-strxfrm
            BEQ test_strxfrm
    case_14:
        CMP R0, #14 @14-memset
            BEQ test_memset
    case_15:
        CMP R0, #15 @15-strstr
            BEQ test_strstr

    default_case:
        BL _invalidInput
@END_callLibraryMethod

@1-MEMCPY
test_memcpy:
    LDR R0, =stringProgrammemcpyDescript @descrição do programa
    BL printf
    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str1 @string1
    LDR R1, =str2 @string2
    BL memcpy
    LDR R0, =str2 @resultado
    BL printf
    B _repeat

@2-STRLEN
test_strlen:
    LDR R0, =stringProgramstrlenDescript @descrição do programa
    BL printf

    @Scan for input:
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream
    /*LDR R0, =stringInputStr1
    BL printf
    LDR R0, =scanString
    LDR R1, =str1
    BL scanf*/

    LDR R0, =str1 @stgring para verificar tamanho
    BL strlen
    MOV R1, R0
    LDR R0, =printInt @print do resultado
    BL printf
    B _repeat

@3-memchr
test_memchr:
    LDR R0, =stringProgrammemchrDescript @descrição do programa
    BL printf

    @scanString
    @Scan for input:
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream
    
    @String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    /*LDR R0, =stringInputStr1
    BL printf
    LDR R0, =scanString
    LDR R1, =str1
    BL scanf

    LDR R0, =stringInputStr2
    BL printf
    LDR R0, =scanString
    LDR R1, =str2
    BL scanf*/

    LDR R0, =str1 @string 1
    LDR R1, =str2 @string 2
    LDRB R1, [R1]
    BL memchr
    MOV R1, R0
    LDR R0, =printPointerAddress @print do resultado
    BL printf
    B _repeat

@4-memmove
test_memmove:
    LDR R0, =stringProgrammemmoveDescript @descrição do programa e print do resultado
    BL printf

    @scanString
    @Scan for input:
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream
    
    @String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str1 @ first string
    LDR R1, =str2 @ second string
    BL memmove
    LDR R0, =str1
    BL printf
    B _repeat

@5-strcpy
test_strcpy:
    LDR R0, =stringProgramstrcpyDescript @descrição do programa
    BL printf

    @Scan for input:
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str2 @string 1
    LDR R1, =str1 @string 2
    BL strcpy
    LDR R0, =str1
    BL printf
    B _repeat

@6-strncpy
test_strncpy: 
    LDR R0, =stringProgramstrncpyDescript @descricao
    BL printf

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str2 @string 1
    LDR R1, =str1 @string 2
    BL strncpy
    LDR R0, =str1
    BL printf
    B _repeat

@7-strncmp
test_strncmp: @teste
    LDR R0, =stringProgramstrncmpDescript @descrição
    BL printf

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str1  @char *str1
    LDR R1, =str2  @char *str2
    BL strncmp
    MOV R1, R0
    LDR R0, =printInt
    BL printf
    B _repeat

@8-strcmp
test_strcmp:
    LDR R0, =stringProgramstrcmpDescript @descrição 
    BL printf

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1  @char *str1
    LDR R1, =str2  @char *str2
    BL strcmp
    MOV R1, R0
    LDR R0, =printInt
    BL printf
    B _repeat

@9-strspn
test_strspn:
    LDR R0, =stringProgramstrspnDescript @descrição
    BL printf

    @scanString
    @Scan for input:
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1 @string 1 
    LDR R1, =str2 @string 2
    BL strspn_lenght
    MOV R1, R0
    LDR R0, =printInt
    BL printf
    B _repeat

@10-strrchr
test_strrchr:
    LDR R0, =stringProgramstrrchrDescript @descrição
    BL printf

    @scanString
    @Scan for input:
    
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1 @string1
    LDR R1, =str2 @string2
    LDR R3, =string_strrchr_final
    LDRB R1, [R1]
    BL strrchr
    MOV R1, R0
    LDR R0, =printPointerAddress
    BL printf
    LDR R0, =resultado
    BL printf
    LDR R0, =string_strrchr_final
    BL printf
    B _repeat

@11-strcspn
test_strcspn:
    LDR R0, =stringProgramstrcspnDescript @descricao
    BL printf

    @scanString
    @Scan for input:
    
    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @Calcula o tamanho da string
    LDR R0, =str1 
    BL strlen
    MOV R2, R0

    LDR R0, =str1 @string 1
    LDR R1, =str2 @string 2
    BL strcspn
    MOV R1, R0
    LDR R0, =printInt
    BL printf
    B _repeat

@12-strpbrk
test_strpbrk: @teste
    LDR R0, =stringProgramstrpbrkDescript @descricao
    BL printf

    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1 @string 1 
    LDR R1, =str2 @string 2
    LDR R2, =strpbrk_str_storage
    BL strpbrk
    MOV R1, R0
    LDR R0, =printPointerAddress
    BL printf
    LDR R0, =strpbrk_str_storage
    BL printf
    B _repeat

@13-strxfrm
test_strxfrm:
    LDR R0, =stringProgramstrxfrmDescript @descricao
    BL printf

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str2 @string 1
    LDR R1, =str1 @string 2
    BL strxfrm
    MOV R1, R0
    LDR R0, =printInt
    BL printf
    LDR R0, =str1
    BL printf
    B _repeat

@14-memset
test_memset:
    LDR R0, =stringProgrammemsetDescript @descricao
    BL printf

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ N
    LDR R0, =stringInputN
    BL printf
    LDR R0, =scanInt
    LDR R1, =n
    BL scanf
    LDR R2, =n
    LDR R2, [R2]  @size_t n

    LDR R0, =str1 @string 1
    LDR R1, =str2 @char de comparação
    BL memset
    LDR R0, =str1
    BL printf
    B _repeat

@15-strstr
test_strstr:
    LDR R0, =stringProgramstrstrDescript @descricao
    BL printf 

    @scanString
    @Scan for input:

    @ String 1
    LDR R0, =stringInputStr1
    BL printf

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    @ String 2
    LDR R0, =stringInputStr2
    BL printf
    
    LDR R0, =str2     @ memory address to place the string
    MOV R1, #100        @ maximum number of characters that are read (number of bytes reserved for the input string)
    LDR R2, =stdin      @ Read from StdIn
    LDR R2, [R2]
    BL fgets            @ read a string from a stream

    LDR R0, =str1 @string 1 
    LDR R1, =str2 @string 2
    @LDR R2, =strstr_str_storage
    BL _strstr
    MOV R1, R0
    LDR R0, =printPointerAddress
    BL printf
    /*LDR R0, =strstr_str_storage
    BL print*/
    LDR R0, =printLn
    BL printf
    B _repeat

_repeat:
    @Scan for input:
    LDR	R0, =stringRepeat	@ print the stringInput
    BL	printf
    LDR R0, =format	@ call scanf, and pass address of format
    LDR	R1, =num	@ string and address of num in r0, and r1,
    BL	scanf		@ respectively.
    LDR	R0, =num	@ print num formatted by output string.
    LDR R0,[R0]
    CMP R0,#1
        BEQ main
    BL _exit

_invalidInput:
    LDR R0, =invalidInput
    BL printf
    LDR R0, =printLn
    BL printf
    B _repeat
    
_exit:
    POP {LR}
    BX LR