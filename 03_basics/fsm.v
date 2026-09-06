module simple_fsm(input clk, input rst, input start, input done, output reg[1:0] state);
localparam IDLE = 2'b00;
localparam LOAD = 2'b01;
localparam PROCESS = 2'b10;
reg [1:0] next_state; 
//sets
always @(posedge clk) begin 
    if(rst)
    state<=IDLE; 
    else
    state<=next_state;
end
//loads next_state
always @(*) begin
    next_state = state; 
    if(start && state == IDLE)
        next_state = LOAD;
    else if(done && state == LOAD)
        next_state = PROCESS; 
    else if(done && state == PROCESS)
        next_state = IDLE; 
end
endmodule