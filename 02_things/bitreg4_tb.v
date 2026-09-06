module bitreg4_tb;

reg [3:0] d; 
reg clk; 
wire [3:0] q;
reg en; 
reg rst; 

bitreg4 dut(.d(d), .clk(clk), .q(q), .en(en), .rst(rst)); 

always #6 clk = ~clk;

initial begin 
    $dumpvars(0, bitreg4_tb);
    $dumpfile("bitreg4.vcd");
    clk = 0;
    d = 4'b0000;
    rst = 0; 
    en=0;
    #5 rst=1; en=1;d=4'b0100;
    #5 rst=0; en=1;d=4'b0101;
    #5 rst=1; en=0;d=4'b1001;
    #5 $finish;
end
endmodule