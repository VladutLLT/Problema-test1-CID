`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module simulare(
    );
    
    reg [3:0] a,b,c,d,const;
    reg [2:0] sel;
    wire c_flag, out_fct;
    wire [3:0] out_mux, out_conc;
    
    top dut(.A(a),
            .B(b),
            .C(c),
            .D(d),
            .const(const),
            .sel(sel),
            .out_cflag(c_flag),
            .out_mux(out_mux),
            .out_fct(out_fct),
            .out_conc(out_conc)
            );
            
     initial begin
     a=0;
     #5 a=8;
     #80 $stop();
     
     end
     
     initial begin
     b=0;
     #5 b=2;
     #80 $stop();
  
     end
     initial begin
     c=0;
     #5 c=6;
     #80 $stop();
     
     end
     initial begin
     d=0;
     #5 d=9;
     #80 $stop();
     
     end
     initial begin
     const=5;
     #85 $stop();
     
     
     end
     initial begin
     sel=0;
     #5 sel=3'b000;
     //in acest caz sel[2:1] este 00 =>out_conc va fi afisat scos
     //din out_mux => out_mux = out_conc, in acest caz va fi 1
     //si cflag va fi 0 deoarece sel[0] este 0 si sel[1] este 0
    //sumator=> a + c (8+6) = 14 , nu trece de limita de 4 biti(16)
     #10 sel=3'b001;
     //in acest caz sel[2:1] este 00 =>out_conc va fi afisat scos
     //din out_mux => out_mux = out_conc, in acest caz va fi 1
     //si cflag va fi 0 deoarece sel[0] este 1 si sel[1] este 0
    //sumator=> a + d (2+6) = 8 ,nu trece de limita de 4 biti(16)
     #10 sel=3'b010;
     //in acest caz sel[2:1] este 01 =>out_fct va fi afisat scos
     //din out_mux => out_mux = out_fct, in acest caz va fi constanta
     //adica 5
     //si cflag va fi 1 deoarece sel[0] este 0 si sel[1] este 1
    //sumator=> a + d (8+9) = 17 ,trece de limita de 4 biti(16)
     #10 sel=3'b011;
     //in acest caz sel[2:1] este 01 =>out_fct va fi afisat scos
     //din out_mux => out_mux = out_fct, in acest caz va fi constanta
     //adica 5
     //si cflag va fi 0 deoarece sel[0] este 1 si sel[1] este 1
    //sumator=> b + d (2+9) = 11 ,nu trece de limita de 4 biti(16)
     #10 sel=3'b100;
     //in acest caz sel[2:1] este 10 =>out_c1 va fi afisat scos
     //din out_mux => out_mux = out_c1, in acest caz va fi 8(8>6)
     //si cflag va fi 0 deoarece sel[0] este 0 si sel[1] este 0
    //sumator=> a + c (8+6) = 14 ,nu trece de limita de 4 biti(16)
     #10 sel=3'b101;
     //in acest caz sel[2:1] este 10 =>out_c1 va fi afisat scos
     //din out_mux => out_mux = out_c1, in acest caz va fi 6
     //si cflag va fi 0 deoarece sel[0] este 1 si sel[1] este 0
    //sumator=> b + c (2+6) = 8 ,nu trece de limita de 4 biti(16)
     #10 sel=3'b110;
     //in acest caz sel[2:1] este 11 =>out_s va fi afisat scos
     //din out_mux => out_mux = out_s, in acest caz va fi 1(17 este suma)
     //si cflag va fi 1 deoarece sel[0] este 0 si sel[1] este 1
    //sumator=> a + d (8+9) = 17 ,trece de limita de 4 biti(16)
     #10 sel=3'b111;
     //in acest caz sel[2:1] este 11 =>out_s va fi afisat scos
     //din out_mux => out_mux = out_s, in acest caz va fi 11
     //si cflag va fi 0 deoarece sel[0] este 1 si sel[1] este 1
    //sumator=> b + d (2+9) = 11 ,nu trece de limita de 4 biti(16)
     
     end
    
endmodule
