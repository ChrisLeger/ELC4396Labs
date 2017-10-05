`timescale 1ns / 1ps

module Shift_left_or_right(
    input [7:0] a,
    input [2:0] amt,
    input choice,
    output [7:0] y
    );
    
    wire [7:0] reverse_a;
    wire [7:0] a_to_shift;
    wire [7:0] shifted_a;
    wire [7:0] right_shifted_a;
    
    
    assign reverse_a = {a[0],a[1],a[2],a[3],
                        a[4],a[5],a[6],a[7]};
                        
    assign a_to_shift = choice ? reverse_a : a;
    
barrel_shifter_case_left shifter(
    .a(a_to_shift),
    .amt(amt),
    .y(shifted_a)
);
    assign right_shifted_a = {shifted_a[0],shifted_a[1],shifted_a[2],shifted_a[3],
                              shifted_a[4],shifted_a[5],shifted_a[6],shifted_a[7]};
                              
    assign y = choice ? right_shifted_a : shifted_a;
    
endmodule
