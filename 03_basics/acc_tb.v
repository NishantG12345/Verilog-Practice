module acc_tb;

reg clk;
reg rst;
reg start; 
reg [7:0] B;
reg [7:0] A;    
wire [7:0] result;
wire valid; 

acc dut(.clk(clk), .rst(rst), .start(start), .B(B), .A(A), .result(result), .valid(valid));
always #5 clk = ~clk; 
initial begin
    $dumpfile("acc.vcd");
    $dumpvars(0, acc_tb);
    clk = 0; 
    rst = 1;
    start = 0;
    B = 8'b00010101;
    A = 8'b10101010;

    #7 rst = 0; start = 1;
    #35 B = 8'b01101011; 
    #1 A = 8'b11110010; 
    #10 $finish;
end
endmodule
