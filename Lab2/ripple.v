`timescale 1ns / 1ps

module ripple#(parameter bits=8)(
    input [bits-1:0] x,
    input [bits-1:0] y,
    input mode,
    input cin,
    output [bits-1:0] sum,
    output cout
    );
    wire [bits:0] carry;
    wire [bits-1:0] ty;
    
    assign carry[0]=cin|mode;
    assign cout=carry[bits];
    
    generate
    genvar i;
    for (i=0;i<bits;i=i+1) begin:fa
        assign #10 ty[i]= y[i]^mode;
        assign #10 carry[i+1]= x[i]&ty[i] | x[i]&carry[i] | ty[i]&carry[i];
        assign #10 sum[i]= x[i]^ty[i]^carry[i];
    end
    endgenerate
    
endmodule
