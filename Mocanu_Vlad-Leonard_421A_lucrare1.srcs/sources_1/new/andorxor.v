`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module andorxor(
                input i0,
                input i1,
                input i2,
                input i3,
                output out

    );
    
    wire o_a, o_x;
    
    aand and1(.in0(i0),
              .in1(i1),
              .out(o_a)
    );
    xoor xor1(.in0(i2),
              .in1(i3),
              .out(o_x)
              );
    oor or1(.in0(o_a),
            .in1(o_x),
            .out(out)
            );
    
endmodule
