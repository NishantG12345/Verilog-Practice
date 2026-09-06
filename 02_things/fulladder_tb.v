module fulladder_tb; 

reg a;
reg b;
reg cin; 
wire cout; 
wire sum; 

fulladder dut(.a(a), .b(b), .cin(cin), .cout(cout), .sum(sum));

initial begin
    $dumpvars(0, fulladder);
    $dumpfile("fulladder.vcd");
    a=0;
    b=0;
    cin=0; 
    #5 a=0;b=0;cin=1;
    #5 a=0;b=1;cin=0;
    #5 a=0;b=1;cin=1;
    #5 a=1;b=0;cin=0;
    #5 a=1;b=0;cin=1;
    #5 a=1;b=1;cin=0;
    #5 a=1;b=1;cin=1;
    #5 $finish;
end

endmodule