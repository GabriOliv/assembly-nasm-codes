# assembly-nasm-codes
---
## Lista dos Scripts
Listagem dos Scripts do repositório

| Scripts (.asm) | Descrição | Programação |
| ------ | ------ | ------ |
| 001_Nothing | Script Simples | Chamada de Sistema simples (mov, int) |
| 002_Output_Msg | Saida de Texto estático | Uso de seção estática (section .data) |
| 003_Input_Msg | Retorna entrada do usuário na tela | Entrada de Texto usando Buffers (section .bss) |
| 004_Jump_Flag | Retorna se é Par ou Impar | Uso de Comparação (cmp), Jump (jmp) e Labels |
| 005_Subroutines | Retorna se é Par ou Impar | Chamada de subrotina (call) |
| 006_Macro_Intern | Retorna se é Par ou Impar | Macros de código dentro do mesmo arquivo (%macro) |
| 007_0_Macro_Extern | Retorna se é Par ou Impar | Chamada de Macro externo ao arquivo (%include) |
| 007_1_Macro_Lib | Biblioteca de Macros | Biblioteca de Macros chamada pelo Script "007_0_Macro_Extern" |
| 008_Input_Validation | Soma de Dois Números | Validação de Entrada usando Pilha (push, pop) |
| 009_Open_File | Retorna Conteúdo do Arquivo | Syscall 5 (open)  |
| 010_Write_File | Salva entrada do usuário Dentro do Arquivo  | Syscall 8 (creat) |
| 011_Copy_File | Copia conteúdo de um Arquivo para Outro | --- |
| 012_Uppercase | Texto de Input em Caixa Alta | Uso dos Macros em Library |
| 013_Lowercase | Texto de Input em Caixa Baixa | Uso dos Macros em Library |
| 014_Change_Letter_Case | Texto de Input em Caixa Alta e Baixa | Include da pasta Macro |
