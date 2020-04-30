module Pacman(input Clk, Reset, frame_clk,
				  input [7:0] keycode,
				  input [9:0] DrawX, DrawY,
				  input wall1,
						  wall2,
						  wall3,
						  wall4,
						  wall5,
						  wall6,
						  wall7,
						  wall8,
						  wall9,
						  wall10,
						  wall11,
						  wall12,
						  wall13,
						  wall14,
						  wall15,
						  wall16,
				 output[10:0] pos1,
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
				output[9:0] pac_x,pac_y,
				input [3:0] adj_walls,
				output logic is_pac);
				
				
logic frame_clk_delayed, frame_clk_rising_edge;
    always_ff @ (posedge Clk) begin
        frame_clk_delayed <= frame_clk;
        frame_clk_rising_edge <= (frame_clk == 1'b1) && (frame_clk_delayed == 1'b0);
    end
	 
logic[9:0] pac_x_in, pac_y_in; 
parameter [9:0] pac_size = 10'd3; 
logic[7:0] W = 8'h1A; 
logic[7:0] A = 8'h04; 
logic[7:0] S = 8'h16; 
logic[7:0] D = 8'h07;
logic[255:0] pacman_sprite;

always_ff @ (posedge Clk)
    begin
        if (Reset)
            begin
                    pac_x <= 10'd304;
                    pac_y <= 10'd288;
            end
        else
            begin
                    pac_x <= pac_x_in;
                    pac_y <= pac_y_in;
            end
end	 
	 
always_comb
begin
	pac_x_in = pac_x;
	pac_y_in = pac_y;
	if (frame_clk_rising_edge)
   begin
	
			if(keycode == A)
			begin
				if (!wall1 && !wall2 && !wall3 && !wall4 && !wall5 && !wall6 && !wall7 && !wall8 && !wall9 && !wall10 && !wall11 && !wall12 && !wall13 && !wall14)
                begin
                    pac_x_in = pac_x-1;
                end
		  end
		  
		  if(keycode == D)
			begin
				if (!wall1 && !wall2 && !wall3 && !wall4 && !wall5 && !wall6 && !wall7 && !wall8 && !wall9 && !wall10 && !wall11 && !wall12 && !wall13 && !wall14)
                begin
                    pac_x_in = pac_x+1;
                end
		  end
		  
		  
		  if(keycode == W)
		  begin
				if (!wall1 && !wall2 && !wall3 && !wall4 && !wall5 && !wall6 && !wall7 && !wall8 && !wall9 && !wall10 && !wall11 && !wall12 && !wall13 && !wall14)
                begin
                    pac_y_in = pac_y-1;
                end
		  end
		  
		  if(keycode == S)
			begin
				if (!wall1 && !wall2 && !wall3 && !wall4 && !wall5 && !wall6 && !wall7 && !wall8 && !wall9 && !wall10 && !wall11 && !wall12 && !wall13 && !wall14)
                begin
                    pac_y_in = pac_y+1;
                end
		  end
		   
	 end 
end 

always_comb
	begin
	if(keycode == A)
	begin
		pos1  = ((pac_x - 1) >> 4) + (((pac_y + 1 ) >> 4) * 40);
		pos2  = ((pac_x - 1) >> 4) + (((pac_y + 2 ) >> 4) * 40);
		pos3  = ((pac_x - 1) >> 4) + (((pac_y + 3 ) >> 4) * 40);
		pos4  = ((pac_x - 1) >> 4) + (((pac_y + 4 ) >> 4) * 40);
		pos5  = ((pac_x - 1) >> 4) + (((pac_y + 5 ) >> 4) * 40);
		pos6  = ((pac_x - 1) >> 4) + (((pac_y + 6 ) >> 4) * 40);
		pos7  = ((pac_x - 1) >> 4) + (((pac_y + 7 ) >> 4) * 40);
		pos8  = ((pac_x - 1) >> 4) + (((pac_y + 8 ) >> 4) * 40);
		pos9 =  ((pac_x - 1) >> 4) + (((pac_y + 9 ) >> 4) * 40);
		pos10 = ((pac_x - 1) >> 4) + (((pac_y + 10) >> 4) * 40);
		pos11 = ((pac_x - 1) >> 4) + (((pac_y + 11) >> 4) * 40);
		pos12 = ((pac_x - 1) >> 4) + (((pac_y + 12) >> 4) * 40);
		pos13 = ((pac_x - 1) >> 4) + (((pac_y + 13) >> 4) * 40);
		pos14 = ((pac_x - 1) >> 4) + (((pac_y + 14) >> 4) * 40);
	end
	else if(keycode == W)
	begin
		pos1  = ((pac_x + 1 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos2  = ((pac_x + 2 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos3  = ((pac_x + 3 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos4  = ((pac_x + 4 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos5  = ((pac_x + 5 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos6  = ((pac_x + 6 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos7  = ((pac_x + 7 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos8  = ((pac_x + 8 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos9 =  ((pac_x + 9 ) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos10 = ((pac_x + 10) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos11 = ((pac_x + 11) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos12 = ((pac_x + 12) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos13 = ((pac_x + 13) >> 4) + (((pac_y - 1) >> 4) * 40);
		pos14 = ((pac_x + 14) >> 4) + (((pac_y - 1) >> 4) * 40);
	end
	else if(keycode== S)
	begin
		pos1  = ((pac_x + 1 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos2  = ((pac_x + 2 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos3  = ((pac_x + 3 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos4  = ((pac_x + 4 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos5  = ((pac_x + 5 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos6  = ((pac_x + 6 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos7  = ((pac_x + 7 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos8  = ((pac_x + 8 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos9  = ((pac_x + 9 ) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos10 = ((pac_x + 10) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos11 = ((pac_x + 11) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos12 = ((pac_x + 12) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos13 = ((pac_x + 13) >> 4) + (((pac_y + 16) >> 4) * 40);
		pos14 = ((pac_x + 14) >> 4) + (((pac_y + 16) >> 4) * 40);
	end
	
	else if(keycode==D)
	begin
		pos1  = ((pac_x + 16) >> 4) + (((pac_y + 1 ) >> 4) * 40);
		pos2  = ((pac_x + 16) >> 4) + (((pac_y + 2 ) >> 4) * 40);
		pos3  = ((pac_x + 16) >> 4) + (((pac_y + 3 ) >> 4) * 40);
		pos4  = ((pac_x + 16) >> 4) + (((pac_y + 4 ) >> 4) * 40);
		pos5  = ((pac_x + 16) >> 4) + (((pac_y + 5 ) >> 4) * 40);
		pos6  = ((pac_x + 16) >> 4) + (((pac_y + 6 ) >> 4) * 40);
		pos7  = ((pac_x + 16) >> 4) + (((pac_y + 7 ) >> 4) * 40);
		pos8  = ((pac_x + 16) >> 4) + (((pac_y + 8 ) >> 4) * 40);
		pos9  = ((pac_x + 16) >> 4) + (((pac_y + 9 ) >> 4) * 40);
		pos10 = ((pac_x + 16) >> 4) + (((pac_y + 10) >> 4) * 40);
		pos11 = ((pac_x + 16) >> 4) + (((pac_y + 11) >> 4) * 40);
		pos12 = ((pac_x + 16) >> 4) + (((pac_y + 12) >> 4) * 40);
		pos13 = ((pac_x + 16) >> 4) + (((pac_y + 13) >> 4) * 40);
		pos14 = ((pac_x + 16) >> 4) + (((pac_y + 14) >> 4) * 40);
	end
	
	else
	begin
		pos1 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos2 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos3 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos4 = (pac_x >> 4) + (((pac_y) >> 4) * 40); 
		pos5 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos6 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos7 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos8 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos9 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos10 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos11 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos12 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos13 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
		pos14 = (pac_x >> 4) + (((pac_y) >> 4) * 40);
	end
							
end
		  
assign pacman_sprite = {
		16'b0001111001111000,
		16'b0000111001110000,
		16'b0000111001110000,
		16'b0000111001110000,
		16'b1100111111110011,
		16'b1100111111110011,
		16'b1100111111110011,
		16'b1100111111110011,
		16'b1100111111110011,
		16'b1100111111110011,
		16'b1111111001111111,
		16'b1111110000111111,
		16'b0111110000111110,
		16'b0011111001111100,
		16'b0000111111110000,
		16'b0000111111110000,
	 };
		  
		  
int DistX, DistY, Size;
    assign DistX = DrawX - pac_x;
    assign DistY = DrawY - pac_y;
    assign Size = pac_size;
    always_comb 
        begin
				is_pac = 1'b0;
				if (DistX >= 0 && DistX < 16)
					if (DistY >= 0 && DistY < 16)
						is_pac = pacman_sprite[DistX + 16*(DistY)];
                			
        end
endmodule	 