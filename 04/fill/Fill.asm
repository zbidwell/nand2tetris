// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// constants

// screen is 512x256, each row is 32 16-bit words
@8192
D=A
@MAXOFFSET
M=D

// starts as white
@color
M=0 

// This loop reads if a key is pressed and if so, fills the screen with black
(LOOP)

// check if key is pressed and set color
@KBD
D=M
// if kbd == 0 then color=0 (white) else color=-1 (black)
@WHITE
D;JEQ
@color
M=-1
@BLACK
0;JMP
(WHITE)
@color
M=0
(BLACK)


// initialize address offset from the start of screen memory
@offset
M=0

@address
M=0

// loop to fill screen
(DRAWLOOP)

// bounds check for screen if offset==MAXOFFSET
@MAXOFFSET
D=M
@offset
D=D-M
@DONEDRAW
D;JEQ

// adjust address to screen + offset
@SCREEN
D=A
@offset
D=D+M
@address
M=D

@color
D=M
@address
A=M // goto where address points
M=D // set to color

// increment the offset
@offset
M=M+1

@DRAWLOOP
0;JMP

(DONEDRAW)

// goto start of loop
@LOOP
0;JMP