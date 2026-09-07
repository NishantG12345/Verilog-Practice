module fifo #(
    parameter DATA_WIDTH=8,
    parameter DEPTH = 4 
    )(
        input clk, 
        input rst,
        input write_en,
        input read_en,
        input [DATA_WIDTH-1:0] write_data,
        output reg [DATA_WIDTH-1:0] read_data,

        output full,
        output empty
    );
    localparam ADDR_WIDTH = $clog2(DEPTH);
    reg [DATA_WIDTH-1:0] memory [DEPTH-1:0];
    reg [ADDR_WIDTH-1:0] write_ptr; 
    reg [ADDR_WIDTH-1:0] read_ptr;
    reg [ADDR_WIDTH:0] count; 

    always @(posedge clk) begin
        if(rst) begin
            write_ptr <= 0;
            read_ptr <= 0; 
            count <= 0;
        end
        else begin
            if(write_en && !full) begin
                memory[write_ptr] <= write_data;
                write_ptr <= write_ptr + 1;
            end
            if(read_en && !empty) begin
                read_data <= memory[read_ptr]; 
                read_ptr <= read_ptr + 1;
            end
            if((write_en && !full) && !(read_en && !empty))
            count <= count + 1;
            else if((read_en && !empty) && !(write_en && !full))
            count <= count - 1;
        end
    end

    assign full = (count == DEPTH); 
    assign empty = (count == 0);
endmodule   
        

    