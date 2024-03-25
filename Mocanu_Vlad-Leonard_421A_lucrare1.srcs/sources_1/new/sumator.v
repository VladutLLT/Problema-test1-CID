`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module sumator(
                input [3:0] in1,
                input [3:0] in0,
                output reg [4:0] out
                
    );
    
    always @(*)
    begin
    out=in1+in0;
    end
    
    
    
endmodule
