module Score(input logic Clk, Reset,
								 increase,
				 output logic [15:0] out); 
				 
				 
		logic [15:0] curr_score;
		logic [15:0] next_score; 
		
		
		always_ff @(posedge Clk)
		begin
			if(Reset)
				curr_score <=15'h0000;
			else 
				curr_score <= next_score;
			
			out <= next_score;
		end 
		
		always_comb 
		begin
			next_score = curr_score; 
			
			if(increase)
			begin
				next_score = curr_score + 8'h1; 
			end
			
		end
endmodule 
