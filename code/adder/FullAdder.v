`timescale 1ns / 1ps

module FullAdder(
input  x,
input  y,
input  CarryIn,
output [1:0] r
);

wire [1:0] CS1;
wire [1:0] CS2;

assign r[1] = CS1[1] | CS2[1];
assign r[0] = CS2[0];

HalfAdder HA1
(
.x(x),
.y(y),
.r(CS1)
);                    
HalfAdder HA2
(
.x(CS1[0]),
.y(CarryIn),
.r(CS2)
);              
endmodule
