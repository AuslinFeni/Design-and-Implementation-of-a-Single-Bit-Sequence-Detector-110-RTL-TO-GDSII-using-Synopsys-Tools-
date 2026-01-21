`timescale 1ns/1ps  // Specify time units and precision

module seq_detector_110 (
    input wire clk,
    input wire rst,
    input wire in_bit,
    output reg detected
);
    // Define state encoding
    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    // State registers
    reg [1:0] state, next_state;

    // Sequential logic for state transition
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;  // Reset to initial state
        else
            state <= next_state;  // Update state
    end

    // Combinational logic for next state
    always @(*) begin
        case (state)
            S0: next_state = (in_bit) ? S1 : S0;  
            S1: next_state = (in_bit) ? S2 : S0;  
            S2: next_state = (in_bit) ? S2 : S3;  
            S3: next_state = (in_bit) ? S1 : S0;  
            default: next_state = S0;
        endcase
    end

    // Moore Output Logic: Detect sequence "110"
    always @(posedge clk or posedge rst) begin
        if (rst)
            detected <= 1'b0;
        else if (state == S2 && in_bit == 1'b0)  
            detected <= 1'b1;  // Sequence "110" detected
        else
            detected <= 1'b0;
    end  

endmodule
