module mux2to1_tb;
reg a; 
reg b;
reg sel; 
wire c; 

mux2to1 dut(.a(a), .b(b), .sel(sel), .c(c))

initial begin
    $dumpfile("mux2to1.vcd");
    $dumpvars(0, mux2to1_tb);
    a=0;
    b=1;
    sel=1;
    #5 sel=0; 
    #5 sel=1;
    #5 $finish;
end
endmodule