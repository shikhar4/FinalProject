module pellet (input Clk, Reset,
					input[10:0] position, pacman_position,
					output logic is_pellet, seen_pellet); 
					
					
					
		 logic seen_pellet_next, place_pellet; 
		 logic pellets[0:1199]; 
		 
		 initial begin
			$readmemb("sprites/food_1bit.txt", pellets);
		 end
		 
		 
		 
		 always_ff @(posedge Clk) 
		 begin
			if(Reset)
			begin
				$readmemb("sprites/food_1bit.txt", pellets); 
				seen_pellet <= 1'b0; 
			end
			else
			begin
				pellets[pacman_position] <= place_pellet; 
				seen_pellet <= seen_pellet_next; 
			end
			
			is_pellet <= pellets[position]; 
		end 
		
		
		
	
		always_comb 
		begin
			if(seen_pellet) 
			begin
				place_pellet = 1'b0; 
				seen_pellet_next = 1'b0; 
			end
			else
			begin
				place_pellet = pellets[pacman_position]; 
				if(pellets[pacman_position] == 0)
				begin
					seen_pellet_next = 1'b0;
				end
				else
				begin
					seen_pellet_next = 1'b1;
				end
			end
		end

endmodule
		