module fsm_tb;

reg clk; 
reg rst; 
reg start; 
reg done;
wire [1:0] state;

simple_fsm dut(.clk(clk), .rst(rst), .start(start), .done(done), .state(state));

always #4 clk = ~clk; 

initial begin
    $dumpfile("simple_fsm.vcd");
    $dumpvars(0, fsm_tb);

    clk = 0;
    rst = 1;
    start = 0;
    done = 0; 

    #10 rst=0; 
    #10 start = 1;
    #10 done = 1; 
    #10 done = 0; //so process stays process wait this dooesn't work right because clck will switch by 10
    #10 done = 1; //goes back to idle; 
    #10 $finish; 
end
endmodule
//moore only depends on the state
//mealy depends on the state and inputs. 