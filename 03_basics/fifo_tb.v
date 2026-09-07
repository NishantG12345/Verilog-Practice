module fifo_tb;

reg clk;
reg rst;
reg write_en;
reg read_en;
reg [7:0] write_data;

wire [7:0] read_data;
wire full;
wire empty;

fifo dut(
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .read_en(read_en),
    .write_data(write_data),
    .read_data(read_data),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0, fifo_tb);

    clk = 0;
    rst = 1;
    write_en = 0;
    read_en = 0;
    write_data = 0;
    $monitor("t=%0t write=%b read=%b data_in=%h data_out=%h full=%b empty=%b",
         $time, write_en, read_en, write_data, read_data, full, empty);

    #8 rst=0;
    #2 write_en=1; write_data = 8'b10101010; 
    #10 write_en=1; write_data = 8'b10111110;
    #10 write_en=1; write_data = 8'b10101000;
    #10 write_en=1; write_data = 8'b10101000; read_en = 1;
    #10 write_en=0; read_en=1;
    #10 read_en=1;
    #10 read_en=1;
    
//5 15 25 35 45 55 65 clk
//15 write 25 write 35 write 45 wrtie 55 read 65 read 75 read 

    #10 $finish;

end

endmodule