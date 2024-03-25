`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module mux4( input [3:0] in0,
             input [3:0] in1,
             input [3:0] in2,
             input [3:0] in3,
             input [1:0] sel,
             output reg [3:0] out
    );
    
    always@(*)
    begin
    case(sel)
    2'b00:
    begin
    out=in0;
    end
    2'b01:
    begin
    out=in1;
    end
    2'b10:
    begin
    out=in2;
    end
    2'b11:
    begin
    out=in3;
    end
    
    
    
    endcase
    
    
    
    end
    
    
    
endmodule
