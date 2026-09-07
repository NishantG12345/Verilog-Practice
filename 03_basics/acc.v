module acc(input clk, input rst, input start, input [7:0] B, input [7:0] A, output reg [7:0] result, output reg valid);
localparam IDLE = 2'b00;
localparam LOAD = 2'b01;
localparam COMPUTE = 2'b10;
localparam DONE = 2'b11;
reg [1:0] state; 
reg [1:0] next_state; 
reg load_a; 
reg load_b; 
reg [7:0] reg_a; 
reg [7:0] reg_b; 
reg add_enable; 
always @(posedge clk) begin
    if(rst)
    state <= IDLE;  
    else
    state <= next_state;
    if(load_a)
    reg_a <= A;
    if(load_b) 
    reg_b <= B;
    if(add_enable)
    result <= reg_a + reg_b; 
    
end
always @(*) begin
    load_a = 0;
    load_b = 0; 
    add_enable = 0;
    valid = 0;
    next_state = state; 
    if(start && state == IDLE)
        next_state = LOAD;
    else if(state == LOAD) begin
        load_a = 1;
        load_b = 1; 
        next_state = COMPUTE; 
    end 
    else if(state == COMPUTE) begin
        add_enable = 1; 
        next_state = DONE; 
    end 
    else if(state == DONE) begin
        valid = 1;
        next_state = IDLE;
    end

end
endmodule