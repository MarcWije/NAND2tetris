// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//Save Variables
@16384 
D=A 
@PX 
M=D 
@24575 
D=A 
@SCN
M=D 

//Clear Screen
(CLEAR)
    @PX
    A=M
    M=0
    @PX
    D=M+1
    @PX
    M=D
    @SCN
    D=M
    @PX
    D=D-M
    @CLEAR
    D;JGE
(ENDCLEAR)

//Save Variables
@16384 
D=A 
@PX 
M=D 
@24575 
D=A 
@SCN
M=D 

//Keyboard Listener
(LISTEN)
    @24576 
    D=M 
    @LISTEN 
    D;JLE
(ENDLISTEN)

//Fill Screen
(FILL)
    @PX
    A=M
    M=-1
    @PX
    D=M+1
    @PX
    M=D
    @SCN
    D=M
    @PX
    D=D-M
    @FILL
    D;JGE
(ENDFILL)
@0
0;JMP