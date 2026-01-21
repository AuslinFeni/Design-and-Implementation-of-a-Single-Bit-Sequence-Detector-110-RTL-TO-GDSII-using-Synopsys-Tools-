`timescale 1ns/1ps
`include "seq_detector_110_rtl.v"  // Includes the module definition

module testbench;
    reg clk, rst, in_bit;
    wire detected;

    // Instantiate the module under test
    seq_detector_110 dut (
        .clk(clk),
        .rst(rst),
        .in_bit(in_bit),
        .detected(detected)
    );

    // Clock generation (50MHz => 20ns period)
    always #10 clk = ~clk;  

    // Stimulus
    initial begin
        $fsdbDumpvars(); // Tool-specific command for waveform generation

        // Reset inputs
        clk = 0;
        rst = 1;
        in_bit = 0;

        #20 rst = 0;  // De-assert reset

        // Apply test cases
        #20 in_bit = 1;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 0;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 1;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 1;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 0;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 1;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 1;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #20 in_bit = 0;  
        $display("Time = %0t | in_bit = %b | detected = %b", $time, in_bit, detected);

        #100 $finish;
    end
endmodule	
