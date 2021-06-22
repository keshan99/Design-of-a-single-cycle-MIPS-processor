
module alu (
    input  [31:0] srca, srcb,
    input  [ 2:0] alucontrol ,
    output reg [31:0] aluout ,
    output zero 
);

    wire [31:0] not_b,b_mux,sum,slt;
    assign not_b = ~ srcb;

    assign b_mux = (1'b0 == alucontrol[2]) ? srcb : not_b;

    assign sum = srca + b_mux + alucontrol[2];
    assign slt = sum[31];


    always@(*)
    begin
        case (alucontrol[1:0])
            2'b00:aluout=srca & b_mux;
            2'b01:aluout=srca | b_mux;
            2'b10:aluout=sum;
            2'b11:aluout=slt;
        endcase
    end

    assign zero = (aluout==32'b0);    

endmodule
