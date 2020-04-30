//-------------------------------------------------------------------------
//    Color_Mapper.sv                                                    --
//    Stephen Kempf                                                      --
//    3-1-06                                                             --
//                                                                       --
//    Modified by David Kesler  07-16-2008                               --
//    Translated by Joe Meng    07-07-2013                               --
//    Modified by Po-Han Huang  10-06-2017                               --
//                                                                       --
//    Fall 2017 Distribution                                             --
//                                                                       --
//    For use with ECE 385 Lab 8                                         --
//    University of Illinois ECE Department                              --
//-------------------------------------------------------------------------

// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input              is_pac,
							  input 					is_wall,
							  input					is_pellet,
							  //input 					is_Ghost,
                       input        [9:0] DrawX, DrawY,
							  //input			[9:0] pac_X, pac_Y,
							  input 			[9:0] Ghost_X, Ghost_Y,
							  
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
    
    logic [7:0] Red, Green, Blue;
    
    // Output colors to VGA
    assign VGA_R = Red;
    assign VGA_G = Green;
    assign VGA_B = Blue;
    

    always_comb
    begin
		Red = 8'h00; 
		Green = 8'h00;
		Blue = 8'h00;
        if (is_pac == 1'b1) 
        begin
            // Light yellow 2
            Red = 8'hff;
            Green = 8'hff;
            Blue = 8'h99;
        end
		  
		  if (is_pellet) 
		  begin
				// magenta
				if (DrawX[3:0] > 5 && DrawX[3:0] < 10 && DrawY[3:0] > 5 && DrawY[3:0] < 10) begin
					Red = 8'hff;
					Green = 8'h00;
					Blue = 8'hff;
				end	
			end
		  
//		  if (is_Ghost)
//		  begin
//				// Orangish shade 
//				Red = 8'hea;
//				Green = 8'h82;
//				Blue = 8'h00;
//		  end
		  
		  if (is_wall)
		  begin
				// Blue
				Red = 8'h00; 
				Green = 8'h00;
				Blue = 8'hff;
		  end
				
		  
				
				
	end		

    
endmodule
