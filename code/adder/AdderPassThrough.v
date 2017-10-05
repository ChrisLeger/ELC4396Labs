`timescale 1ns / 1ps

module AdderPassThrough(
    input [15:0] SW,
    input BTNC,
    input BTNU,
    output [8:0] LED
    );
    
CSadder UUT(
    .x(SW[15:8]),
    .y(SW[7:0]),
    .mode(BTNC),
    .cin(BTNU),
    .sum(LED[7:0]),
    .cout(LED[8])
);
endmodule
