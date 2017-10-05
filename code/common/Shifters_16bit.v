`timescale 1ns / 1ps

module Shifters_16bit(
    input wire [15:0] a,
    input wire [3:0] amt,
    input wire choice,
    output wire [15:0] y
    );
    
    wire [15:0] left_result;
    wire [15:0] right_result;    
    
    barrel_shifter_stage_left_16bit uut1(
        .a(a),
        .amt(amt),
        .y(left_result)
    );
    
    barrel_shifter_stage_right_16bit uut2(
        .a(a),
        .amt(amt),
        .y(right_result)
    );
    
    assign y = choice? right_result : left_result;
    
endmodule
