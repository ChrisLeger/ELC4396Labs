module Shifters_stage(
    input wire [7:0] a,
    input wire [2:0] amt,
    input wire choice,
    output wire [7:0] y
    );
    
    wire [7:0] left_result;
    wire [7:0] right_result;    
    
    barrel_shifter_stage_left uut1(
        .a(a),
        .amt(amt),
        .y(left_result)
    );
    
    barrel_shifter_stage_right uut2(
        .a(a),
        .amt(amt),
        .y(right_result)
    );
    
    assign y = choice? right_result : left_result;
    
endmodule
