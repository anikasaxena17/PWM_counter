`timescale 1ns/1ps

module frequency_scaler_tb;

    // Testbench signals
    reg clk_50MHz;
    wire clk_1MHz;

    frequency_scaler uut (
        .clk_50MHz(clk_50MHz),
        .clk_1MHz(clk_1MHz)
    );

    // Clock generation: 50 MHz (20 ns period)
    initial begin
        clk_50MHz = 0;
        forever #10 clk_50MHz = ~clk_50MHz; // Toggle every 10 ns
    end


    initial begin
        $display("Starting simulation...");
        
        #2000; 
        $display("Simulation finished.");
        $stop;
    end

endmodule
