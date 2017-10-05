`timescale 1ns / 1ps

module shifter_stage_test;
     reg [7:0] a;
     reg [2:0] amt;
   
     wire [7:0] left_out;
     wire [7:0] right_out;
     
     barrel_shifter_stage_left uut1(
         .a(a),
         .amt(amt),
         .y(left_out)
     );
     
     barrel_shifter_stage_right uut2(
          .a(a),
          .amt(amt),
          .y(right_out)
      );
      
     initial begin
         a = 8'b11010111;
         amt = 1; #10;
         amt = 2; #10;
         amt = 3; #10;
         amt = 4; #10;
         amt = 5; #10;
         amt = 6; #10;
         amt = 7; #10;
         a = 8'b11110011;
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
         amt = 4; #10;
         amt = 5; #10;
         amt = 6; #10;
         amt = 7; #10;
      end

endmodule
