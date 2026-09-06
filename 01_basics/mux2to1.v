module mux2to1(input a, input b, input sel, output c);
assign c = sel ? b : a; 
endmodule