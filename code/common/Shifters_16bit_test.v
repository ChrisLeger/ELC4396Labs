`timescale 1ns / 1ps

module Shifters_16bit_test;
    
    reg [15:0] a;
    reg [3:0] amt;
    reg choice;
   
    wire [15:0] ystage;
    wire [15:0] ycase;
    
Shifters_stage_16bit UUTs(
    .a(a),
    .amt(amt),
    .choice(choice),
    .y(ystage)
);

Shifters_case_16bit UUTc(
    .a(a),
    .amt(amt),
    .choice(choice),
    .y(ycase)
);

    initial begin
        a = 16'b1101011111111111;
        choice = 0;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
        amt = 8; #10;
        amt = 9; #10;
        amt = 10; #10;
        amt = 11; #10;
        amt = 12; #10;
        amt = 13; #10;
        amt = 14; #10;
        amt = 15; #10;
        a = 16'b1111001111111111;
        choice = 1;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
        amt = 8; #10;
        amt = 9; #10;
        amt = 10; #10;
        amt = 11; #10;
        amt = 12; #10;
        amt = 13; #10;
        amt = 14; #10;
        amt = 15; #10;
        a = 16'b0000000000000001;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        choice = 0;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
        amt = 8; #10;
        amt = 9; #10;
        amt = 10; #10;
        amt = 11; #10;
        choice = 1;
        amt = 12; #10;
        amt = 13; #10;
        amt = 14; #10;
        amt = 15; #10;
     end

endmodule