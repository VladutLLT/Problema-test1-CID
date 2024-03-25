`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module mux(
           input [3:0] in0,
           input [3:0] in1,
           input sel,
           output reg [3:0] out
    );
    
    always@(*)
    begin
    case(sel)
    0:
    begin
    out=in0;
    end
    1:
    begin
    out=in1;
    end
    
    endcase
    
    end
    
    
    
    
endmodule
