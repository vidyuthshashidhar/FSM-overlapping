`timescale 1ns / 1ps

module fsm10110_overlapping_tb;
reg i_seq_in;
reg i_clk;
reg i_reset;
wire o_seq_detected;


fsm10110_overlapping uut(.i_seq_in(i_seq_in),.i_clk(i_clk),.i_reset(i_reset),.o_seq_detected(o_seq_detected));
initial 
begin
i_seq_in=0;
i_clk=1;
i_reset=1;
#5;
i_reset=0;
#10;
end
////////////////////
always
begin
i_seq_in=$random;
#17;
end

////////////////////

always
begin
#15 i_clk=~i_clk;
end

endmodule
