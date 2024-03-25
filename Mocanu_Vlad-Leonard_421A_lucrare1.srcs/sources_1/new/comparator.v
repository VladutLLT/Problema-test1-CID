`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module comparator(
                   input [3:0] in0,
                   input [3:0] in1,
                   output reg [3:0] out
    );
    always @(*)
    begin
    if(in0>in1)
    out=in0;
    if(in0<in1)
    out=in1;
    
    
    end
endmodule
