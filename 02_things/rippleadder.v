module ripplecarry(input [3:0] a, input [3:0] b, input cin, output [3:0] sum, output cout);
    wire carry0; 
    wire carry1;
    wire carry2;
    fulladder fa0(
        .a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(carry0));
    fulladder fa1(.a(a[1]), .b(b[1]), .cin(carry0), .sum(sum[1]), .cout(carry1));
    fulladder fa2(.a(a[2]), .b(b[2]), .cin(carry1), .sum(sum[2]), .cout(carry2));
    fulladder fa3(.a(a[3]), .b(b[3]), .cin(carry2), .sum(sum[3]), .cout(cout));
endmodule
    

