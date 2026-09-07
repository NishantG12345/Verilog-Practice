module pipeline(input clk, input [7:0] A, input [7:0] B, input [7:0] C, output reg[7:0] result);

reg [7:0] stage1; 

always @(posedge clk) begin
    stage1 <= A + B;
    result <= stage1 + C;
end
endmodule