`timescale 1ns / 1ps

module CarryLookAhead_test;


    reg [7:0] x;
    reg [7:0] y;
    reg mode;
    reg cin;
    wire [7:0] sum;
    wire [7:0] sumBlocks;
    wire cout;
    wire coutBlocks;

CarryLookAhead UUT(

    .x(x),
    .y(y),
    .mode(mode),
    .cin(cin),
    .sum(sum),
    .cout(cout) 
);
CarryLookAheadBlocks UUT2(
    .x(x),
    .y(y),
    .mode(mode),
    .cin(cin),
    .sum(sumBlocks),
    .cout(coutBlocks)
);

initial 
begin 
    x<=8'd127;
    y<=8'd1;
    mode<=0;
    cin<=0;
    #100;
    x<=8'b00001101;
    y<=8'b01010101;
    mode<=0;
    cin<=1;
    #100;
    x<=8'd255;
    y<=0;
    mode<=0;
    cin<=1;
    #100;
    x<=8'd127;
    y<=8'd126;
    mode<=1;
    cin<=1;
    #100;
    x<=8'b00001010;
    y<=8'b00000101;
    cin<=1;
    mode<=1;
    #100;
    x<=8'b10100000;
    y<=8'b01010000;
    mode<=0;
    cin<=1;
    #100;
    $finish;
end 
endmodule
