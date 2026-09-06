module ripplecarry_tb;

reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum; 
wire cout;

ripplecarry dut(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

initial begin
    $dumpfile("ripplecarry.vcd");
    $dumpvars(0, ripplecarry_tb);   
    a=4'b0000;
    b=4'b0001;
    cin = 0; 
    
    #10 a=4'b0111; b=4'b0101; //11
    #10 a=4'b0011; b=4'b0100; //7
    #10 a=4'b1101; b=4'b1111; //28
    #10 a=4'b0100; b=4'b1100; //16
    #10 $finish; 
end
endmodule
    