module bitreg4(input [3:0] d, input clk, input rst, input en, output reg [3:0] q);

always@(posedge clk) begin
    if(rst)
        q <= 0;
    else if(en)
        q<=d; 
end
endmodule