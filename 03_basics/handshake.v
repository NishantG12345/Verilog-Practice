module handshake(
    input clk,
    input rst,
    input valid,
    input ready,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output reg transfer 
)

always @(posedge clk) begin
    if(rst) begin
        data_out<= 0;
        transfer <= 0; 
    end 
    else begin
        transfer <= ready && valid; 
        if(valid && ready)
        data_out <= data_in; 
    end
end
endmodule