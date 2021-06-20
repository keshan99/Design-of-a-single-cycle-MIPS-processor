`timescale 1ns/1ns      

module alu (
    input  [31:0] srca, srcb,
    input  [ 2:0] alucontrol ,
    output [31:0] aluout,
    output        zero
);
    always @(*) begin
    
        case (alucontrol)
            3'b010: aluout <= A + B;
            3'b110: aluout <= A - B;
            3'b000: aluout <= A & B;
            3'b001: aluout <= A | B;
            3'b111: aluout <= A << B;
            default: aluout <= 32'bx;
        endcase

    end

    assign zero = ~| aluout;

endmodule



