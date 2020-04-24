module Map (input Clk, input[10:0] pos, //positions from pacman sprite
											  pos2,
											  pos3,
											  pos4,
											  pos5,
											  pos6,
											  pos7,
											  pos8,
											  pos9,
											  pos10,
											  pos11,
											  pos12,
											  pos13,
											  pos14,
											  pos15,
											  pos16,
											  pacman_pos,
							 output[3:0]  adj_walls,
											  
							 output       is_wall, //control signal for color mapper 
							 
											  is_wall2,//walls around pacman
											  is_wall3,
											  is_wall4,
											  is_wall5,
											  is_wall6,
											  is_wall7,
											  is_wall8,
											  is_wall9,
											  is_wall10,
											  is_wall11,
											  is_wall12,
											  is_wall13,
											  is_wall14,
											  is_wall15,
											  is_wall16,
											  is_wall17 ); 

logic[4:0] mapIndex[0:1199]; 
initial begin
		  $readmemb("sprites/maze_5bit.txt", mapIndex); 
end	

always_ff @(posedge Clk)
        begin
            is_wall  <= mapIndex[pos][0];   //get wall info from text file for each of pacmans 16 locations
				is_wall2 <=  mapIndex[pos2 ][0];
				is_wall3 <=  mapIndex[pos3 ][0];
				is_wall4 <=  mapIndex[pos4 ][0];
				is_wall5 <=  mapIndex[pos5 ][0];
				is_wall6 <=  mapIndex[pos6 ][0];
				is_wall7 <=  mapIndex[pos7 ][0];
				is_wall8 <=  mapIndex[pos8 ][0];
				is_wall9 <=  mapIndex[pos9 ][0];
				is_wall10 <= mapIndex[pos10][0];
				is_wall11 <= mapIndex[pos11][0];
				is_wall12 <= mapIndex[pos12][0];
				is_wall13 <= mapIndex[pos13][0];
				is_wall14 <= mapIndex[pos14][0];
				is_wall15 <= mapIndex[pos15][0];
				is_wall16 <= mapIndex[pos16][0];
				is_wall17 <= mapIndex[pos17][0];
		  end
						 