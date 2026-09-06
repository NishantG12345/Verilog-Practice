module dflipflop_tb; 

reg d;
reg clk;
wire q; 
reg rst;

dflipflop dut(.d(d), .clk(clk), .q(q), .rst(rst));

always #5 clk = ~clk;

initial begin
    $dumpfile("dflipflop.vcd");
    $dumpvars(0, dflipflop_tb);
    d=0;
    rst=0;
    clk = 0; 

    #7 d=0; rst=1;
    #7 d=1; rst=0;
    #7 d=1; rst=1;
    #7 $finish;
end
endmodule