// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Our pseudo-code is such:
//
// def mult(a, b):
//     product = 0
//     index = 0
//
//     loop {
//         if index == b {
//             break
//         }
//
//         product = product + a
//
//         index = index + 1
//     }
//
//     return product
    
    // initialize product to 0
    @product
    M=0

    // initialize index to 0
    @index
    M=0

    // initialize R2 (the output) to 0
    @R2
    M=0

(LOOP) // multiplication loop
    // jump to end if we are complete
    @index
    D=M // load index
    @R1
    D=D-M // D = R1 - index
    @END
    D;JEQ // exit loop if index == R1

    // add R0 to product and store back in product
    @product
    D=M
    @R0
    D=D+M
    @product
    M=D

    // increment the index
    @index
    M=M+1

    // goto start of LOOP
    @LOOP
    0;JMP

// End of While loop

    // set R2 to the value of product
    @product
    D=M
    @R2
    M=D

(END)
    // infinite loop
    @END
    0;JMP
