`timescale 1ns/1ns      

module alu (
    input  [31:0] srca, srcb,
    input  [ 2:0] alucontrol ,
    output [31:0] aluout,
    output        zero
);
    assign aluout = 2'b00;
    assign zero = ~| aluout;

endmodule