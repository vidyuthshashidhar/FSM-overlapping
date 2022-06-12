`timescale 1ns / 1ps
module fsm10110_overlapping(
input i_seq_in,i_clk,i_reset,
output reg o_seq_detected
);

    parameter IDLE=0,G1=1,G10=2,G101=3,G1011=4;
    reg[2:0] pst,nst;
    reg o_sequence_detected;
    
    
    always@(posedge i_clk)
    begin
        if(i_reset)
            pst<=IDLE;
        else
            pst<=nst;
    end
    
    always@(pst,i_seq_in)
    begin
        case(pst)
        IDLE:nst =i_seq_in?G1:IDLE;
        G1:nst=i_seq_in?G1:G10;
        G10:nst=i_seq_in?G101:IDLE;
        G101:nst=i_seq_in?G1011:G10;
        G1011:nst=i_seq_in?G1:G10;
        endcase
        end
        
        always@(pst,i_seq_in)
        begin
        if(pst==G1011 && i_seq_in==0)
          o_seq_detected<= 1;
        else
         o_seq_detected<= 0;
        end
        
        endmodule        
 
