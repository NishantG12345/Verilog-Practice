module or_gate_tb; 

reg a; 
reg b;
wire c;

or_gate dut(
    .a(a), .b(b), .c(c)
);
initial begin
    $dumpfile("or_gate.vcd");
    $dumpvars(0,or_gate_tb);
    #10 a=1; b=0;
    #10 a=0; b=0;
    #10 a=0; b=1;
    #10 a=1; b=1;
    #10 $finish;
end
endmodule