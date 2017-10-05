`timescale 1ns / 1ps

module CarryLookAhead#(parameter bits=8)(
    input [bits-1:0] x,
    input [bits-1:0] y,
    input mode,
    input cin,
    output [bits-1:0] sum,
    output cout
    );
    wire [bits:0] carry;
    wire [bits-1:0] yt;
    wire [bits-1:0] gen;
    wire [bits-1:0] prop;
    wire [bits-1:0] recursionProp [bits-1:0];
    
    assign carry[0] = cin | mode;
    assign cout = carry[bits];
    
    generate
    genvar i,j;
    for(i=0;i<bits;i=i+1) begin:Lookahead
       assign #10 yt[i] = y[i]^mode;
       assign #10 gen[i] = x[i]&yt[i];
       assign #10 prop[i] = x[i]|yt[i];
       assign #10 sum[i] = x[i]^yt[i]^carry[i];  
       assign #10 carry[i+1] = |({gen[i:0],cin} & {1'b1,recursionProp[i][i:0]});
       
       for(j=0;j<i+1;j=j+1) begin:Recursive
           assign #10 recursionProp[i][j] = &(prop[i:j]);
       end
    end
    endgenerate
endmodule
