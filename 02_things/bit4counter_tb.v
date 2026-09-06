module bit4counter_tb;

reg clk;
reg en;
reg rst; 
wire [3:0] count;

bit4counter dut(.clk(clk), .en(en), .rst(rst), .count(count));
always #3 clk = ~clk;

initial begin
    $dumpfile("bit4counter.vcd");
    $dumpvars(0, bit4counter_tb);
    clk = 0;
    rst = 0; 
    en = 0; 
    
    #5 rst = 1; en = 0; 
    #5 rst = 0; en = 0; 
    #5 rst = 0; en = 1; 
    #5 $finish; 
end
endmodule