`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module oor(
            input in0,
            input in1,
            output out
    );
    assign out=in0|in1;
endmodule
