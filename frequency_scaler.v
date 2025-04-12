

//Frequency Scaling
//Inputs : clk_50MHz
//Output : clk_1MHz


module frequency_scaler (
    input clk_50MHz,
    output reg clk_1MHz
);

initial begin
    clk_1MHz = 1;
end


//5 bit counter
reg [4:0] counter = 5'b00000;

//logic
always @(posedge clk_50MHz)
	begin
		counter <= counter + 5'b00001;
		if(counter == 5'b11001) begin
			counter <= 5'b00001;  //Reset
			clk_1MHz <= ~clk_1MHz;   //toggle
			end
	end

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE //////////////////

endmodule
