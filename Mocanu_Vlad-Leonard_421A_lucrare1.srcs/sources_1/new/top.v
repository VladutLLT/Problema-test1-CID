`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module top(
            input [3:0] A,
            input [3:0] B,
            input [3:0] C,
            input [3:0] D,
            input [3:0] const,
            input [2:0] sel,
            output out_cflag,
            output [3:0] out_mux,
            output out_fct,
            output reg [3:0] out_conc
    );
    
    wire [3:0] o_mux1, o_mux2, o_c1;
    wire [4:0] o_s;
    
    mux mux1(.in0(A),
             .in1(B),
             .sel(sel[0]),
             .out(o_mux1)
             );
             
    mux mux2(.in0(C),
             .in1(D),
             .sel(sel[1]),
             .out(o_mux2)
             );
             
    andorxor andorxor(.i0(A[0]),
                      .i1(B[0]),
                      .i2(C[0]),
                      .i3(D[0]),
                      .out(out_fct)
                      );
    //concatenare
    always @(*)
    begin
    out_conc[3]=A[0];
    out_conc[2]=B[0];
    out_conc[1]=C[0];
    out_conc[0]=D[0];
    
    end
    
    
    sumator s1(.in1(o_mux1),
               .in0(o_mux2),
               .out(o_s)
               );
    
    comparator c1(.in1(o_mux1),
                  .in0(o_mux2),
                  .out(o_c1)
                  );
                  
    mux4 mux4(.in0(out_conc),
              .in1(const),
              .in2(o_c1),
              .in3(o_s[3:0]),
              .sel(sel[2:1]),
              .out(out_mux)
              );
    
    assign out_cflag=o_s[4];
    
    
    
endmodule
