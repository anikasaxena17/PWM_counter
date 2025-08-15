`timescale 1ns/1ps

module pwm_generator_tb;

    // Testbench signals
    reg clk_1MHz;
    reg [3:0] pulse_width;
    wire clk_500Hz;
    wire pwm_signal;

    pwm_generator uut (
        .clk_1MHz(clk_1MHz),
        .pulse_width(pulse_width),
        .clk_500Hz(clk_500Hz),
        .pwm_signal(pwm_signal)
    );

    // Clock generation: 1 MHz -> period = 1000 ns (1 us)
    initial begin
        clk_1MHz = 0;
        forever #500 clk_1MHz = ~clk_1MHz; // Toggle every 0.5 us
    end

    initial begin
        $display("Starting PWM Generator Testbench...");

        // Test case 1: 50% duty cycle
        pulse_width = 4'd10; // 10 * 100 = 1000 -> half of 2000
        #500000; // run for 0.5 ms

        // Test case 2: 25% duty cycle
        pulse_width = 4'd5;
        #500000;

        // Test case 3: 75% duty cycle
        pulse_width = 4'd15;
        #500000;

        $display("Simulation finished.");
        $stop;
    end

endmodule
