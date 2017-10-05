`timescale 1ns / 1ps

module CarryLookAheadBlocks#(parameter bits=8)(
    input [bits-1:0] x,
    input [bits-1:0] y,
    input mode,
    input cin,
    output [bits-1:0] sum,
    output cout
);

    wire coutBlock1;
    
    CarryLookAhead#(4) CLA1 (
    .x(x[3:0]),
    .y(y[3:0]),
    .mode(mode),
    .cin(cin),
    .sum(sum[3:0]),
    .cout(coutBlock1)
    );
    CarryLookAhead#(4) CLA2 (
    .x(x[7:4]),
    .y(y[7:4]),
    .mode(mode),
    .cin(coutBlock1),
    .sum(sum[7:4]),
    .cout(cout)
    );
endmodule
