module pipeline_tb; 
reg clk; 
reg [7:0] A;
reg [7:0] B;
reg [7:0] C;
wire [7:0] result; 

pipeline dut(.clk(clk), .A(A), .B(B), .C(C), .result(result));

always #5 clk = ~clk;

initial begin
    $dumpfile("pipeline.vcd");
    $dumpvars(0, pipeline_tb);
    A = 8'b10101010;
    B = 8'b00110101;
    C = 8'b01001001;
    clk = 0;
    #25 $finish;
end
endmodule