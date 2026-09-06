module fulladder(input a, input b, input cin, output cout, output sum);
    assign sum = a ^ b ^ cin; 
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
/*
a b  cin  sum carry out
0 0  1  |  1    0
0 1  0  |  1    0
0 1  1  | 0     1
1 0  0  | 1     0
1 0  1  | 0     1
1 1  0  | 0     1
1 1  1  | 1     1
*/