

//PWM Generator
//Inputs : clk_1MHz, pulse_width
//Output : clk_500Hz, pwm_signal

module pwm_generator(
    input clk_1MHz,
    input [3:0] pulse_width,
    output reg clk_500Hz, pwm_signal
);

initial begin
    clk_500Hz = 1; pwm_signal = 1;
end



//clock from 1MHz to 500 Hz
reg [9:0] clk_div_counter = 10'd0; // 10-bit counter (counts up to 999 for clock division)

    always @(posedge clk_1MHz) begin
		  clk_div_counter <= clk_div_counter + 10'd1; // Increment counter
        if (clk_div_counter == 10'd1000) begin
            clk_div_counter <= 10'd1;      // Reset counter
            clk_500Hz <= ~clk_500Hz;       // Toggle 500Hz clock
        end 
    end


reg [10:0] counter_pwm = 0; 

always @(posedge clk_1MHz) begin

	if(counter_pwm < 1999) counter_pwm <= counter_pwm + 1;
	else counter_pwm <= 0;

	// Ensure pwm_signal starts high in the first cycle and updates properly
    if (counter_pwm == 0)
        pwm_signal <= 1'b1;  // Ensure pwm_signal is high at the start of a cycle
    else
		  // Compute the value based on pulse_width
        pwm_signal <= (counter_pwm < (pulse_width * 100)) ? 1'b1 : 1'b0; // Update pwm_signal
	
end



endmodule
