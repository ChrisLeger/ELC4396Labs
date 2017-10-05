`timescale 1ns / 1ps

module pass_through_shifter(
    input [7:0] SW,
    input BTNC,
    input BTNU,
    input BTNL,
    input BTNR,
    output [7:0] LED
    );
    
Shifters_stage UUT(
    .a(SW),
    .amt({BTNL,BTNC,BTNR}),
    .choice(BTNU),
    .y(LED)
);

endmodule
