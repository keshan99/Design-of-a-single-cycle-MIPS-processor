`timescale 1ns/1ns      

module alu (
    input  [31:0] srca, srcb,
    input  [ 2:0] alucontrol ,
    output reg [31:0] aluout,
    output        zero
);

    wire [31:0] sub;
    assign sub = srca + (~srcb) +1;

    always @(*) begin
    
        case (alucontrol)
            3'b010: aluout <=srca+srcb;
            3'b110: aluout <=sub;
            3'b000: aluout <=srca&srcb;
            3'b001: aluout <=srca|srcb;
            3'b111: aluout <= sub[31];
            default: aluout <= 32'bx;
        endcase

    end
 
    assign zero = ~| aluout;

endmodule



