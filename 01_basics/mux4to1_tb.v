module mux4to1_tb; 
reg a;
reg b;
reg c;
reg d;
reg sel0; 
reg sel1; 
wire e;

mux4to1 dut(.a(a), .b(b), .c(c), .d(d), .sel0(sel0), .sel1(sel1), .y(y));

initial begin
    a=1;
    b=1;
    c=0;
    d=0
    $dumpfile("mux4to1.vcd");
    $dumpvars(0, mux4to1_tb);
    #5 sel0 = 0; sel1 = 0;
    #5 sel0 = 0; sel1 = 1;
    #5 sel0 = 1; sel1 = 0;
    #5 sel0 = 1; sel1 = 1;
    #5 $finish
end
endmodule