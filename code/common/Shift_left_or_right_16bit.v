`timescale 1ns / 1ps

module Shift_left_or_right_16bit(
    input [15:0] a,
    input [3:0] amt,
    input choice,
    output [15:0] y
    );
    
    wire [15:0] reverse_a;
    wire [15:0] a_to_shift;
    wire [15:0] new_a;
    wire [15:0] right_shifted_a;
    
    
    assign reverse_a = {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7],a[8],
                        a[9],a[10],a[11],a[12],a[13],a[14],a[15]};
                        
    assign a_to_shift = choice ? reverse_a : a;
    
barrel_shifter_case_left_16bit shifter(
    .a(a_to_shift),
    .amt(amt),
    .y(new_a)
);
    assign right_shifted_a = {new_a[0],new_a[1],new_a[2],new_a[3],
                              new_a[4],new_a[5],new_a[6],new_a[7],
                              new_a[8],new_a[9],new_a[10],new_a[11],
                              new_a[12],new_a[13],new_a[14],new_a[15]};
                              
    assign y = choice ? right_shifted_a : shifted_a;
    
endmodule
