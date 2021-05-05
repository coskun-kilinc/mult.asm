//	@R0
//	@R1
// 	@i = 1 		// @i must be set to 1 to properly compare with R1, otherwise loop will 
//			//  repeat 1 too many times
//    	@temp = 0
//    	for ( i = 1;  i < R1; i++ ) { 
//    	@R2= R2 + R0
//    	}
//	R@ = RESULT

    @i      // variable to count loop iterations
    M=1     // set to 1 to compare with R1
    @2      // intitialise R2 to 0
    M=0

(LOOP) // loop conditions
    @i
    D=M     // takes value of i
    @1     // loads R1
    D=D-M  // subtracts R1 from i
    @END
    D; JGT   // if R1-i > 0, continue loop

    @0     // load R0
    D=M
    @2     // the result location
    M=M+D
    @i      // load increment counter
    M=M+1   // increment by 1
    @LOOP   // repeat LOOP
    0;JMP

(END) // infinite loop
        @END
        0; JMP
