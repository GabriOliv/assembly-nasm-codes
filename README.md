# [Assembly Codes [Nasm]](https://github.com/GabriOliv/assembly-nasm-codes)

#### Some Assembly x86 codes with NASM.

-----

[![NASM Status](https://img.shields.io/badge/NASM-2.14.02-blue)](https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/)
[![Language Status](https://img.shields.io/badge/Language-pt--BR-success)](https://github.com/GabriOliv/assembly-nasm-codes/blob/main/pt_br/README.md)
[![Language Status](https://img.shields.io/badge/Language-en-success)](https://github.com/GabriOliv/assembly-nasm-codes/blob/main/README.md)

[NASM Syscall Documentation](https://github.com/GabriOliv/assembly-nasm-codes/blob/main/library/syscall_table.md)

-----

## Installation
##### 1. Clone the Repository:
(or Download and Extract a zip [HERE](https://github.com/GabriOliv/assembly-nasm-codes/archive/main.zip))
```sh
git clone https://github.com/GabriOliv/assembly-nasm-codes.git
```

##### 2. Install [NASM](https://www.nasm.us/):
- If in Ubuntu 18.04:
    ```sh
    sudo apt update
    sudo apt install nasm
    ```
---
## Compilation
##### Use the script .sh
1. Give Permission
    ```sh
    chmod +x compile_asm.sh
    ```

2. Run the script .sh (without ".asm")
    ```sh
    ./compile_asm Script_Name
    ```
3. Run the Assembly Script .exe
    ```sh
    ./Script_Name.exe
    ```

##### Use the Default Commands
1. mount
    ```sh
    nasm -f elf64 program.asm
    ```
2. link
    ```sh
    ld program.o -o program
    ```
3. execute
    ```sh
    ./program
    ```
-------------------------------------------



## List of Scripts
Listing of Scripts in this Repository

| Scripts (.asm) | Description | Programming |
| ------ | ------ | ------ |
| 001_Nothing | Simple Script | Simple System Call (mov, int) |
| 002_Output_Msg | Static Text Output | Use of static section (section .data) |
| 003_Input_Msg | Return user input on the screen | Text Entry Using Buffers (section .bss) |
| 004_Jump_Flag | Return Even or Odd | Compare (cmp), <br/> Jump (jmp) <br/> and Labels |
| 005_Subroutines | Return Even or Odd | Subroutine call (call) |
| 006_Macro_Intern | Return Even or Odd | Macro inside the same file (% macro) |
| 007_0_Macro_Extern | Return Even or Odd | Macro call external to the file (% include) |
| 007_1_Macro_Lib | Macro Library | Macro Library called by the Script "007_0_Macro_Extern" |
| 008_Input_Validation | Sum of Two Numbers | Input Validation using Stack (push, pop) |
| 009_Open_File | Return File Contents | Syscall 5 (open) |
| 010_Write_File | Save user input inside the File | Syscall 8 (creat) |
| 011_Copy_File | Copy data from one file to another | --- |
| 012_Uppercase | Uppercase Input Text | Using Macros in Library |
| 013_Lowercase | LowerCase Input Text | Using Macros in Library |
| 014_Change_Letter_Case | Input Text in Upper and Lower Case | Include from Macro | 
