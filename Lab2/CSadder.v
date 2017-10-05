`timescale 1ns / 1ps


module CSadder#(parameter bits=8, 
                parameter levels=3)(
    input [bits-1:0] x,
    input [bits-1:0] y,
    input mode,
    input cin,
    output [bits-1:0] sum,
    output cout
    );
    wire [bits-1:0] yt;
    wire [bits-1:0] Hsum [bits-1:0], Fsum [bits-1:0];
    wire [bits-1:0] resnc [levels-1:0][bits-1:0], reswc[levels-1:0][bits-1:0];
    wire [bits-1:0] muxres[levels-1:0][bits-1:0];
    assign yt[7] = y[7]^mode;
    assign yt[6] = y[6]^mode;
    assign yt[5] = y[5]^mode;
    assign yt[4] = y[4]^mode;
    assign yt[3] = y[3]^mode;
    assign yt[2] = y[2]^mode;
    assign yt[1] = y[1]^mode;
    assign yt[0] = y[0]^mode;
    
    //level 0 assignments
    HalfAdder SumNoCarry0(.x(x[0]), .y(yt[0]), .r(Hsum[0][1:0]));
    FullAdder SumWithCarry0(.x(x[0]), .y(yt[0]), .CarryIn(1), .r(Fsum[0][1:0]));
    
    HalfAdder SumNoCarry1(.x(x[1]), .y(yt[1]), .r(Hsum[1][1:0]));
    FullAdder SumWithCarry1(.x(x[1]), .y(yt[1]), .CarryIn(1), .r(Fsum[1][1:0]));
    
    HalfAdder SumNoCarry2(.x(x[2]), .y(yt[2]), .r(Hsum[2][1:0]));
    FullAdder SumWithCarry2(.x(x[2]), .y(yt[2]), .CarryIn(1), .r(Fsum[2][1:0]));
    
    HalfAdder SumNoCarry3(.x(x[3]), .y(yt[3]), .r(Hsum[3][1:0]));
    FullAdder SumWithCarry3(.x(x[3]), .y(yt[3]), .CarryIn(1), .r(Fsum[3][1:0]));
    
    HalfAdder SumNoCarry4(.x(x[4]), .y(yt[4]), .r(Hsum[4][1:0]));
    FullAdder SumWithCarry4(.x(x[4]), .y(yt[4]), .CarryIn(1), .r(Fsum[4][1:0]));
    
    HalfAdder SumNoCarry5(.x(x[5]), .y(yt[5]), .r(Hsum[5][1:0]));
    FullAdder SumWithCarry5(.x(x[5]), .y(yt[5]), .CarryIn(1), .r(Fsum[5][1:0]));
    
    HalfAdder SumNoCarry6(.x(x[6]), .y(yt[6]), .r(Hsum[6][1:0]));
    FullAdder SumWithCarry6(.x(x[6]), .y(yt[6]), .CarryIn(1), .r(Fsum[6][1:0]));
    
    HalfAdder SumNoCarry7(.x(x[7]), .y(yt[7]), .r(Hsum[7][1:0]));
    FullAdder SumWithCarry7(.x(x[7]), .y(yt[7]), .CarryIn(1), .r(Fsum[7][1:0]));
    

    //level 0 muxs 
    assign muxres[0][7]=Fsum[6][1] ? Fsum[7] : Hsum[7]; 
    assign muxres[0][6]=Hsum[6][1] ? Fsum[7] : Hsum[7]; 
    assign muxres[0][5]=Fsum[4][1] ? Fsum[5] : Hsum[5]; 
    assign muxres[0][4]=Hsum[4][1] ? Fsum[5] : Hsum[5]; 
    assign muxres[0][3]=Fsum[2][1] ? Fsum[3] : Hsum[3]; 
    assign muxres[0][2]=Hsum[2][1] ? Fsum[3] : Hsum[3]; 
    assign muxres[0][1]=Fsum[0][1] ? Fsum[1] : Hsum[1]; 
    assign muxres[0][0]=Hsum[0][1] ? Fsum[1] : Hsum[1]; 
    
    //resnc and reswc level 0 assignments
    assign reswc[0][3]={muxres[0][7][6:0], Fsum[6][0]};
    assign resnc[0][3]={muxres[0][6][6:0], Hsum[6][0]};
    assign reswc[0][2]={muxres[0][5][6:0], Fsum[4][0]};
    assign resnc[0][2]={muxres[0][4][6:0], Hsum[4][0]};
    assign reswc[0][1]={muxres[0][3][6:0], Fsum[2][0]};
    assign resnc[0][1]={muxres[0][2][6:0], Hsum[2][0]};
    assign reswc[0][0]={muxres[0][1][6:0], Fsum[0][0]};
    assign resnc[0][0]={muxres[0][0][6:0], Hsum[0][0]};
    
    //level 1 muxs
    assign muxres[1][3]=reswc[0][2][2] ? reswc[0][3] : resnc[0][3];
    assign muxres[1][2]=resnc[0][2][2] ? reswc[0][3] : resnc[0][3];
    assign muxres[1][1]=reswc[0][0][2] ? reswc[0][1] : resnc[0][1];
    assign muxres[1][0]=resnc[0][0][2] ? reswc[0][1] : resnc[0][1];
    
    //resnc and reswc level 1 assignments
    assign reswc[1][1]={muxres[1][3][4:0], reswc[0][2][1:0]};
    assign resnc[1][1]={muxres[1][2][4:0], resnc[0][2][1:0]};
    assign reswc[1][0]={muxres[1][1][4:0], reswc[0][0][1:0]};
    assign resnc[1][0]={muxres[1][0][4:0], resnc[0][0][1:0]};
    
    //level 2 muxs
    assign muxres[2][1]=reswc[1][0][4] ? reswc[1][1] : resnc[1][1];
    assign muxres[2][0]=resnc[1][0][4] ? reswc[1][1] : reswc[1][1];
    
    //resnc and reswc level 2 assignments
    assign reswc[2][0]={muxres[2][1][3:0], reswc[1][0][3:0]};
    assign resnc[2][0]={muxres[2][0][3:0], resnc[1][0][3:0]};


    assign sum = cin ? reswc[2][0]:resnc[2][0];
    assign cout = cin ? muxres[2][1][4]:muxres[2][0][4];
    
    
    
    
endmodule
