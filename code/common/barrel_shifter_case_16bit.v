`timescale 1ns / 1ps

module barrel_shifter_case_right_16bit(
     input wire [15:0] a,
     input wire [3:0] amt,
     output reg [15:0] y
    );

   // body
   always @*
      case(amt)
         4'h0: y = a;
         4'h1: y = {a[0], a[15:1]};
         4'h2: y = {a[1:0], a[15:2]};
         4'h3: y = {a[2:0], a[15:3]};
         4'h4: y = {a[3:0], a[15:4]};
         4'h5: y = {a[4:0], a[15:5]};
         4'h6: y = {a[5:0], a[15:6]};
         4'h7: y = {a[6:0], a[15:7]};
         4'h8: y = {a[7:0], a[15:8]};
         4'h9: y = {a[8:0], a[15:9]};
         4'ha: y = {a[9:0], a[15:10]};
         4'hb: y = {a[10:0], a[15:11]};
         4'hc: y = {a[11:0], a[15:12]};
         4'hd: y = {a[12:0], a[15:13]};
         4'he: y = {a[13:0], a[15:14]};
         default: y = {a[14:0], a[15]};
      endcase

endmodule

module barrel_shifter_case_left_16bit
   (
     input wire [15:0] a,
     input wire [3:0] amt,
     output reg [15:0] y
    );

   // body
   always @*
      case(amt)
         4'h0: y = a;
         4'h1: y = {a[14:0], a[15]};
         4'h2: y = {a[13:0], a[15:14]};
         4'h3: y = {a[12:0], a[15:13]};
         4'h4: y = {a[11:0], a[15:12]};
         4'h5: y = {a[10:0], a[15:11]};
         4'h6: y = {a[9:0], a[15:10]};
         4'h7: y = {a[8:0], a[15:9]};
         4'h8: y = {a[7:0], a[15:8]};
         4'h9: y = {a[6:0], a[15:7]};
         4'ha: y = {a[5:0], a[15:6]};
         4'hb: y = {a[4:0], a[15:5]};
         4'hc: y = {a[3:0], a[15:4]};
         4'hd: y = {a[2:0], a[15:3]};
         4'he: y = {a[1:0], a[15:2]};
         default: y = {a[0], a[15:1]};
      endcase

endmodule
