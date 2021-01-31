#!/bin/bash

#--------------------------------
#	Compile Automation
#--------------------------------

#--------------------------------
# HOWTORUN

# 1- Give Permition
# $ chmod +x compile_asm.sh

# 2- Call de SH (without ".asm")
# $ ./compile_asm Name_of_Script

#--------------------------------

#--------------------------------
#Comando Executado
#	echo '$0 = ' $0

#Primeiro Parametro
#	echo '$1 = ' $1

#Segundo Parametro
#	echo '$2 = ' $2


echo 'Compile Automation'
echo
echo '====== Compile LOG ======'

nasm -f elf64 $1.asm && ld $1.o -o $1.exe

echo '====== Compile LOG ======'
echo
#--------------------------------
