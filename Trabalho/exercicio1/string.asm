@strlen
@ Diz qual o tamanho da string
@ Input:
@ R0 -> endereço da string de entrada
@ Output:
@ R0 -> número de caracteres copiados
strlen:
    @ achar o final (dimensão) da string de entrada:
    MOV R2, #0  @ counter/dimensão da string de input
    strlen_count_loop:   
        LDRB R3, [R0], #1
        CMP R3, #0   @ compara R3 com null (último caracter duma string)
            BEQ strlen_count_loop_end @ se for igual saí do for
        ADD R2, #1
    B strlen_count_loop
    @END_strlen_count_loop
    strlen_count_loop_end:
        SUB R2, #1
        MOV R0, R2 @ guarda o tamanho da string em R0 prá ser retornada
        BX LR
    @END_strlen_count_loop_end
@END_strlen

@memchr
@ procura o caractere na string
@ Input:
@ R0 -> endereço da string de entrada
@ R1 -> caractere a procurar
@ Output:
@ R0 -> endereço do caracter encontrado
memchr:
    @MOV R2, #0  @ counter/dimensão da string de input
    memchr_loop:
        LDRB R3, [R0], #1
        CMP R3, R1   @ compara se encontrou o caracter na string
            BEQ memchr_loop_end @ se for igual, ou seja se encontrar o caracter na string saí do loop
        CMP R3, #0   @ compara se o increment é maior que o tamanho da string
            MOVEQ R0, #0 @ se não encontrar altera o valor do R0 para 0 para retornar null no pointer
            BEQ memchr_loop_end @ se não encontrar vai retornar null e sai do loop
        @ADD R2, #1
    B memchr_loop
    @memchr_loop

    memchr_loop_end:
        BX LR
    @memchr_loop_end
@memchr


@memmove
@ Copia os n caracteres da str2 para a str1
@ Input
@ R0 -> endereço da string onde vão ser copiados
@ R1 -> endereço da string dos valores a serem copiados
memmove:
    MOV R4, #0 @ Incrementador
    LDRB R3, [R1] @ Traz o primeiro caractere da string
    memmove_loop:
        CMP R4, R2 @ compara R4, com o N
            BEQ memmove_loop_end @ Se o incrementador for igual ao N saí do loop
        LDRB R3, [R1], #1 @ Traz caractere da string
        STRB R3, [R0], #1 @ Altera o caractere da string
        ADD R4, #1 @ Incrementa
    B memmove_loop
    @memmove_loop
    memmove_loop_end:
        BX LR
    @memmove_loop_end
@memmove

@strcpy
@ copia os caracteres da str1 1 prá str2
@ R0 -> string inicial
@ R1 -> string final
strcpy:
    LDRB R4, [R0]
    strcpy_loop:
        CMP R4, #0 @ compara o caractere da string com null
            BEQ strcpy_loop_end @ se for já não tem mais nada prá copiar e sai do loop
        LDRB R4, [R0], #1    @Traz o valor armazenado no endereço de memória R0 + 1
        STRB R4, [R1], #1    @Guarda o proximo caracter na string no endereço R1 + 1
    B strcpy_loop

    strcpy_loop_end:
        BX LR
    @END_strcpy_loop_end
@ENDstrcpy

@strncpy
@ Copia os n caracteres da str1 1 prá str2
@ R0 -> string inicial
@ R1 -> string final
@ R2 -> N
strncpy:
    LDRB R4, [R0] @ Traz o primeiro caractere da str1
    MOV R3, #0 @ Incrementador
    strncpy_loop:
        CMP R4, #0
            BEQ strncpy_loop_end
        CMP R3, R2
            BEQ strncpy_loop_end
        LDRB R4, [R0], #1    @Traz o valor armazenado no endereço de memória R0 + 1
        STRB R4, [R1], #1    @Guarda o proximo caracter na string no endereço R1 + 1
        ADD R3, #1 @ Incrementa 1
    B strncpy_loop
    @END_strcpy_n_loop

    strncpy_loop_end:
        BX LR
    @END_strcpy_n_loop_end
@END strcpy_n


@strncmp
@ Verifica qual é a maior string em relação a valores ASCII até n caracteres
@ Input
@ R0 -> str1
@ R1 -> str2
@ R2 -> n
@ Output:
@ R0 -> qual o mairor (0, 1, 2)
strncmp:
    LDRB R3, [R0] @Lê o primeiro caracter da str1
    LDRB R4, [R1] @Lê o primeiro caracter da str2
    MOV R5, #0 @counter
    MOV R6, #0 @ Armazena o valor ASCII total da str1
    strncmp_loop:
        CMP R2, R5 @Compara n com contador R5
            BEQ strncmp_str2_loop @se forem iguais passa para proxima string
        LDRB R3, [R0], #1 @ Lê o registro da str1
        ADD R6, R3  @Adiciona ao R6, o valor ascii da letra
        ADD R5, #1   @Adiciona ao counter
    B strncmp_loop
    @End strncmp_loop

    strncmp_str2_loop:
    MOV R8, #0 @counter
    MOV R9, #0 @ Armazena o valor ASCII total da str2
        strncmp_loop2:
            CMP R2, R8 @Compara n com contador R8
                BEQ strncmp_loop2_end @Se chegou passa para a próxima função
            LDRB R4, [R1], #1 @ Lê o registro da str2
            ADD R9, R4 @Adiciona ao R9, o valor ascii da letra
            ADD R8, #1 @Adiciona ao counter
        b strncmp_loop2
        @End strncmp_loop2

        strncmp_loop2_end:
            CMP R6, R9      @compara o valor total dos registos
                MOVEQ R0, #2  @Se a str1 for igual a str2 a função devolve 2.
                MOVLT R0, #0  @Se a str1 for menor a str2 a função devolve 0.
                MOVGT R0, #1  @Se a str1 for maior a str2 a função devolve 1.

            BX LR
        @End strncmp_n_loop2_end
    @ End strncmp_str2_loop
@ End strncmp

@strcmp
@ Verifica qual é a maior string em relação a valores ASCII
@ Input
@ R0 -> str1
@ R1 -> str2
@ Output:
@ R0 -> qual o mairor (0, 1, 2)
strcmp:

    LDRB R3, [R0] @Lê o primeiro caracter da str1
    LDRB R4, [R1] @Lê o primeiro caracter da str2
    MOV R6, #0 @ Armazena o valor ASCII total da str1
    strcmp_loop:
        CMP R3, #0  @Se chegar ao final da string
            BEQ strcmp_str2_loop @se forem iguais passa para proxima string
        LDRB R3, [R0], #1 @ Lê o registro da str1
        ADD R6, R3 @Adiciona ao R5, o valor ascii da letra
    B strcmp_loop
    @end_strcmp_loop

    strcmp_str2_loop:
        MOV R9, #0 @ Armazena o valor ASCII total da str2
        strcmp_loop2:
            CMP R4, #0 @Verifica se chegou ao final da string
                BEQ strcmp_loop2_end @Se chegou passa para a próxima função
            LDRB R4, [R1], #1 @ Lê o registro da str2
            ADD R9, R4 @Adiciona ao R9, o valor ascii da letra
        b strcmp_loop2
        @end_strcmp_loop2


        strcmp_loop2_end:
            CMP R6, R9 @compara o valor total dos registos
                MOVEQ R0, #2  @Se a str1 for igual a str2 a função devolve 2.
                MOVLT R0, #0  @Se a str1 for menor a str2 a função devolve 0.
                MOVGT R0, #1  @Se a str1 for maior a str2 a função devolve 1.

            BX LR
        @endfstrcmp_loop2_end
    @ End strcmp_str2_loop
@End strncmp

@ strspn
@ Verificaa o 1º segmento em que são as strings são iguais iguais
@ Input:
@ R0 -> str1
@ R1 -> str2
@ Outputs
@ R0 -> quantas vezes encontrou
strspn_lenght:
    MOV R2, #0 @Contador de quantas vezes encontrar um char igual
    LDRB R3, [R0] @ Lê o primeiro caractere da str
    LDRB R4, [R1] @ Lê o primeiro caractere da str
    strspn_loop:
        @Compara os caracteres
        CMP R3, R4 @ Compara o caractere da 1º string com o caractere da 2º string
            ADDEQ R2, #1 @Se estes forem iguais adiciona ao contador
        CMP R4, #0 @ Compara se a 2º string chegou ao fim, já que só queremos verificar o 1º segmento em que são iguais
            BEQ strspn_loop_end @Vai pró final da função se a segunda string chegar ao fim
        LDRB R3, [R0], #1 @ Lê ocaractere da str
        LDRB R4, [R1], #1 @ Lê ocaractere da str
    B strspn_loop
    @End strspn_loop

    strspn_loop_end:
        SUB R2, #1
        MOV R0, R2 @Guarda o resulatado do contador
        BX LR
    @End strspn_loop_end
@End strspn_lenght

@strcat
@ Copia a 1º string e a 2º string para a string de storage
@ Input:
@ R0 -> str1
@ R1 -> str storage
@ R2 -> str2
strcat:
    LDRB R3, [R0]                @Lê o primeiro caracter da strind dest
    for_strcat_storage:
        CMP R3, #0 @Verifica se chegou ao final da str1
            BEQ strcat_mem_continua @Se sim vai para a próxima função
        LDRB R3, [R0], #1  @Lê o caractere da str1
        STRB R3, [R1], #1 @Guarda o caractere da str1 no storage
    B for_strcat_storage
    @End for_strcat_storage

    strcat_mem_continua:
        LDRB R3, [R2] @Lê o primeiro char da string2
        strcat_mem_continua_loop:
            CMP R3, #0 @Verifica se chegou ao final da str1
                BEQ strcat_mem_continua_end @Se sim vai para o final do ciclo
            LDRB R3, [R2], #1 @Lê o caractere da str2
            STRB R3, [R0], #1 @Guarda o caractere da str2 no storage
        B strcat_mem_continua_loop

        strcat_mem_continua_end:
            BX LR @destino (dest).
        @End strcat_mem_continua_end
    @End strcat_mem_continua
@End strcat

@ strrchr
@ Procura pela última ocorrência de um caractere na sting
@ Input:
@ R0 -> str
@ R1 -> caractere a comparar
@ R3 -> str storage
@ Output:
@ R0 -> endereço do ponteiro do último caractere na na string
strrchr:
    LDRB R2, [R0] @ Lê o primeiro caractere
    strrchr_loop:
        CMP R2, #0 @ Verifica se a string chegou ao final
            BEQ strrchr_end @ se sim passa para o final do loop
        LDRB R2, [R0], #1 @ Lê o caractere da string
        CMP R2, R1 @ Verifica se o caractere da string é igual ao caractere de comparação
            BEQ strrchr_copyAddress @ Se sim vai para a função para guardar o endereço da função
    B strrchr_loop
    @End strrchr_loop
    strrchr_copyAddress:
        MOV R4, R0 @ guarda o endereço do ponteiro onde se encontra o ponto em R0
        B strrchr_loop @ volta para o loop prá verificar se este é o último caractere encontrado
    @End strrchr_copyAddress

    strrchr_end:
        SUB R4, #1 @ subtrai 1 ao ponteiro para mostrar o sítio correto do ponteiro
        MOV R0, R4 @ guarda o valor do ponteiro do último caractere em R0 prá ser retornado
        LDRB R2, [R4] @ Lê o caractere a partir do último caractere encontrado
        strrchr_loop2:
            CMP R2, #0 @ compara prá ver se a string chegou ao fim
                BEQ strrchr_loop2_end @ se sim saí do loop
            LDRB R2, [R4], #1 @ Lê o caractere da string
            STRB R2, [R3], #1 @ Guarda o caractere numa string storage
        B strrchr_loop2
        @End strrchr_loop2

        strrchr_loop2_end:
            BX LR
        @End strrchr_loop2_end
    @End strrchr_end
@End strrchr

@strcspn
@ Verifica quantos caracteres são diferentes entre a 1º e a 2º string
@ Input:
@ R0 -> str1
@ R1 -> str comparação
@ R8 -> tamanho da string
@ Output:
@ R0 -> Onde se encontra a primeira string
strcspn:
    MOV R4, #0 @ Contador
    LDRB R3, [R0] @ Lê o primeiro caractere
    strcspn_loop:
        LDRB R3, [R0], #1 @ Lê o caractere
        CMP R3, #0 @ Verifica se chegou ao final da str
            BNE strcspn_compare @ Se não for igual compara os caracteres da 1º com os da 2º str
            BEQ strcspn_loop_end @ Se chegou ao final vai pó final da str
    B strcspn_loop
    @ strcspn_loop

    strcspn_compare:
        MOV R5, #0 @ inicia o incrementador
        strcspn_compare_loop:
            LDRB R6, [R1, R5] @ Lê os caracteres da string
            CMP R6, #0 @ Verifica se a string chegou ao fim
                BEQ strcspn_loop @ Se sim continua a percorrer a string
            CMP R3, R6 @ Verifica se os caracteres são iguais
                ADDEQ R4, #1 @ Se sim adiciona 1 ao contador
                BEQ strcspn_loop @ Se sim volta continua a percorrer a string
            ADD R5, #1 @ adiciona 1 ao incrementador
        B strcspn_compare_loop
        @strcspn_compare_loop
    @strcspn_compare

    strcspn_loop_end:
        SUB R4, #1
        SUB R2, R4 @ faz o total de caracteres da string menos os que são iguais
        MOV R0, R2 @ guarda o resultado em R0
        BX LR
    @strcspn_loop_end
@strcspn

@ strpbrk
@ Procura qual o primeiro caractere da str2 que é encontrado na str1 
@ Input:
@ R0 -> Str1
@ R1 -> str2
@ R2 -> str storage
strpbrk:
    strpbrk_loop:
        LDRB R3, [R0], #1 @ Lê o caractere
        CMP R3, #0 @ Verifica se chegou ao final da string
            BNE strpbrk_compare @ Se não compara os caracteres da str1 com os da str2
            MOVEQ R0, #0 @ se sim altera o valor do R0 para 0 para retornar null no pointer
            BEQ strpbrk_loop_end @ se sim vai pó final do loop
    B strpbrk_loop
    @ strpbrk_loop

    strpbrk_compare:
        MOV R5, #0 @ inicia o incrementador
        strpbrk_compare_loop:
            LDRB R6, [R1, R5] @ Lê o caractere da str2
            CMP R6, #0 @ Verifica se chegou ao fim
                BEQ strpbrk_loop @ se sim volta a percorrer a str1
            CMP R3, R6 @ Compara se o caracteres da str1 é igual ao da str2
                BEQ strpbrk_loop_end @ Se sim vai pó final do loop
            ADD R5, #1 @ adiciona 1 ao incrementador
        B strpbrk_compare_loop
    @ strpbrk_compare

    strpbrk_loop_end:
        STRB R3, [R2] @ guarda o caractere que foi encontrado na str storage
        BX LR
    @ strpbrk_loop_end
@strpbrk

@ strxfrm
@ Copia os N caracteres da primeira string com os da segunda string, e retorna quantos caracteres foram copiados
@ Input:
@ R0 -> str1
@ R1 -> str storage
@ R5 -> n
@ Output:
@ R0 -> quantos caracteres foram copiados
strxfrm:
    LDRB R4, [R0] @ Lê o primeiro caractere da str1
    MOV R3, #0 @ inicia o contador
    strxfrm_loop:
        CMP R4, #0 @ Verifica se a string chegou ao final
            SUBEQ R3, #1 @ se for retira 1 ao contador porque ele contou con o valor nulo do funal da string
            BEQ strxfrm_loop_end @ vaii pó final da função
        CMP R3, R2 @ Verifica se o contador é igual a n
            BEQ strxfrm_loop_end @ se sim vai pó final da função
        LDRB R4, [R0], #1    @Lê o caractere da str1
        STRB R4, [R1], #1    @Guarda o caracter na str storage
        ADD R3, #1 @ adiciona um ao contador
    B strxfrm_loop
    @strxfrm_loop

    strxfrm_loop_end:
        MOV R0, R3 @ guarda o valor do contador em R0
        BX LR
    @END strxfrm_loop_end
@END strxfrm

@memset
@ Copia um específico caracter prá os n primeiros caracteres de str1
@ Input:
@ R0 -> str1
@ R1 -> str caractere
@ R5 -> n
memset:
    LDRB R4, [R1] @ Lê o primeiro caractere
    MOV R3, #0 @ inicia o incrementador
    memset_loop:
        CMP R4, #0 @ Verifica se chegou ao final da string
            BEQ memset_loop_end @ Se sim vai pó final do loop
        CMP R3, R2 @ Verifica se o incrementador chegou a n
            BEQ memset_loop_end @ Se sim vai pó final do loop
        STRB R4, [R0], #1 @Guarda o caracter na string
        ADD R3, #1 @ incrementa 1
    B memset_loop
    @END memset_loop

    memset_loop_end:
        BX LR
    @END memset_loop_end
@END memset

@memcpy
@ Copia n caracteres da str2 prá str1, copiando até os valores null até n
@ Input:
@ R0 -> str1
@ R1 -> str2
memcpy:
    LDRB R4, [R0] @ Lê o 1º caractere da str1
    MOV R3, #0 @ inicia o incrementador
    memcpy_loop:
        CMP R3, R2 @ Verifica se o incrementador chegou a n
            BEQ memcpy_loop_end @ Se sim vai pó final do loop
        LDRB R4, [R0], #1    @Lê o caractere da str1
        STRB R4, [R1], #1    @Guarda o caracter na str2
        ADD R3, #1 @ incrementa 1
    B memcpy_loop
    @END_memcpyloop

    memcpy_loop_end:
        BX LR
    @END_memcpy_loop_end
@END memcpy

@strstr
@ Diz onde se encontra a 2º string em relação á 1º string
@ Input:
@ R0 -> str1
@ R1 -> str2
@ R2 -> str storage
@ Output:
@ R0 -> endereço de onde se encontra a str2 na str1
_strstr:
    LDRB R4, [R1] @ Lê o 1º caractere da str2
    MOV R8, #0 @ inicia o incrementador
    strstr_loop:
        LDRB R3, [R0, R8] @ Lê o caractere (desta forma não perdemos o valor de R0)
        CMP R3, #0 @ Verifica se chegou ao final da string
            MOVEQ R0, #0
            BEQ strstr_loop_end @ Se sim vai pó final do loop
        CMP R3, R4 @ Verifica se o 1º caractere da str2 é igual ao da str1
            BEQ strstr_compare @ Se sim vamos verificar os próximos caracteres da string
        ADD R8, #1 @ incrementa 1
    B strstr_loop
    @End strstr_loop

    strstr_compare:
        MOV R5, #0 @ inicia o incrementador
        MOV R9, R8 @ Guarda o endereço guardado em R8 no R9
        strstr_compare_loop:
            LDRB R6, [R1, R5] @ Lê o caractere da str2
            LDRB R3, [R0, R9] @ Lê o caractere da str1
            CMP R6, #0 @ verifica se chegou ao fim da str2
                ADDEQ R8, R0 @ Adiciona ao R8 o endereço inicial de R0, assim guardado inde encontrou a str2
                MOVEQ R0, R8 @ Guarda o endereço em R0
                BEQ strstr_loop_end @ Se sim vai pó final do loop
            CMP R3, R6 @ Compara o caractere da str2 com o da str1
                ADDNE R8, #1 @ Se não for igual adiciona avança pró próximo caractere de str1
                BNE strstr_loop @ Se não for igual volta a percorrer a str1 
            ADD R5, #1 @ incremetna 1
            ADD R9, #1 @ incrementa 1
        B strstr_compare_loop
        @End strstr_compare_loop

    strstr_loop_end:
        BX LR
        /*MOV R10, R8 @ Guarda o valor do ponteiro onde encontrou a palavra em R10 e torna-o num incrementador
        strstr_storage_loop:
            LDRB R3, [R0, R10] @ Lê o registo da str1 a partir do endereço onde foi encontrada o str2
            CMP R3, #0 @ Verifica se chegou ao fim da string
                BEQ strstr_storage_loop_end @ Se sim vai pó final da função
            STRB R3, [R2], #1 @ guarda o valor na str storage a partir do ponto que encontrou a str2
            ADD R10, #1 @ incrementa 1
        B strstr_storage_loop
        @End strstr_storage_loop

        strstr_storage_loop_end:
            ADD R8, R0 @ Adiciona ao R8 o endereço inicial de R0, assim guardado inde encontrou a str2
            MOV R0, R8 @ Guarda o endereço em R0
            BX LR*/
        @ End strstr_storage_loop_end
    @End strstr_loop_end
@End _strstr