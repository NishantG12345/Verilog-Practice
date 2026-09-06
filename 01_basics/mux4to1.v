module mux4to1(input a, input b, input c, input d, sel1, sel0, output y); 

always @(*) begin
    case(sel1, sel0)
        2'b00: y = a; 
        2'b01: y = b;
        2'b10: y = c;
        2'b11: y = d;
    endcase
end
endmodule