`timescale 1ns / 1ps

module Shift_left_or_right_test;
    
    reg [7:0] a;
    reg [2:0] amt;
    reg choice;
   
    wire [7:0] ystage;
    wire [7:0] ycase;
    
Shift_left_or_right_stage UUTs(
    .a(a),
    .amt(amt),
    .choice(choice),
    .y(ystage)
);

Shift_left_or_right_case UUTc(
    .a(a),
    .amt(amt),
    .choice(choice),
    .y(ycase)
);

    initial begin
        a = 8'b11010111;
        choice = 0;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
        a = 8'b11110011;
        choice = 1;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
        a = 8'b00000001;
        amt = 1; #10;
        amt = 2; #10;
        amt = 3; #10;
        choice = 0;
        amt = 4; #10;
        amt = 5; #10;
        amt = 6; #10;
        amt = 7; #10;
     end

endmodule
