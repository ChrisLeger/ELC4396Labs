`timescale 1ns / 1ps

module pass_through_shifter_16bit(
    input [15:0] SW,
    input BTNC,
    input BTNU,
    input BTNL,
    input BTNR,
    input BTND,
    output [15:0] LED
    );
    
Shift_left_or_right_case_16bit UUT(
    .a(SW),
    .amt({BTND,BTNL,BTNC,BTNR}),
    .choice(BTNU),
    .y(LED)
);

endmodule
