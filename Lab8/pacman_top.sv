module pacman_top( input CLOCK_50, OTG_INT,
					input        [3:0]  KEY,  
				   inout  wire  [15:0] OTG_DATA,
					output logic [6:0]  HEX0, HEX1, HEX2, 
					output logic [7:0]  VGA_R, VGA_G, VGA_B,       
					output logic [1:0]  OTG_ADDR,         
					output logic [12:0] DRAM_ADDR,    
					inout  wire  [31:0] DRAM_DQ,      
					output logic [1:0]  DRAM_BA,     
					output logic [3:0]  DRAM_DQM,     
					output logic        DRAM_RAS_N, DRAM_CAS_N, DRAM_CKE,  DRAM_WE_N, DRAM_CS_N, DRAM_CLK, VGA_CLK, VGA_SYNC_N, 
											  VGA_BLANK_N, VGA_VS, VGA_HS, OTG_CS_N, OTG_RD_N, OTG_WR_N, OTG_RST_N 
				 );
				 
logic Reset_h, Clk;
logic is_pac, is_pellet; 
logic [7:0] keycode;
logic [1:0] hpi_addr;
logic [15:0] hpi_data_in, hpi_data_out;
logic hpi_r, hpi_w, hpi_cs, hpi_reset;
logic [9:0] DrawX, DrawY;
logic [3:0] adj_walls;
logic [9:0] pac_x, pac_y;
//logic [3:0] adj_wallsg;
logic [3:0] adj_walls_vga;

logic[15:0] score; 
	 
assign Clk = CLOCK_50;
 always_ff @ (posedge Clk) 
        begin
            Reset_h <= ~(KEY[0]);
				if(score == 12'h342)begin	                                          
							Reset_h <= 1;
				end
        end
		 
logic is_wall,	

		is_wall1,
      is_wall2 ,
      is_wall3 ,
      is_wall4 ,
      is_wall5 ,
      is_wall6 ,
      is_wall7 ,
      is_wall8 ,
      is_wall9 ,
      is_wall10,
      is_wall11,
      is_wall12,
      is_wall13,
      is_wall14,
      is_wall15,
      is_wall16;
logic [10:0] pos1,
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
             pos16;

  hpi_io_intf hpi_io_inst(
        .Clk(Clk),
        .Reset(Reset_h),
        .from_sw_address(hpi_addr),
        .from_sw_data_in(hpi_data_in),
        .from_sw_data_out(hpi_data_out),
        .from_sw_r(hpi_r),
        .from_sw_w(hpi_w),
        .from_sw_cs(hpi_cs),
        .from_sw_reset(hpi_reset),
        .OTG_DATA(OTG_DATA),    
        .OTG_ADDR(OTG_ADDR),    
        .OTG_RD_N(OTG_RD_N),    
        .OTG_WR_N(OTG_WR_N),    
        .OTG_CS_N(OTG_CS_N),
        .OTG_RST_N(OTG_RST_N)
    );
VGA_controller vga_controller_instance(.Clk(Clk), .Reset(Reset_h), .*);
	 
vga_clk vga_clk_instance(.inclk0(Clk), .c0(VGA_CLK));

color_mapper color_map(.is_wall(is_wall), .is_pac(is_pac), .VGA_R(VGA_R), .VGA_B(VGA_B), .VGA_G(VGA_G), .is_pellet(is_pellet));

Pacman pacman_mod(.Clk(Clk), .Reset(Reset_h), .frame_clk(VGA_VS), .keycode(keycode), .DrawX(DrawX), .DrawY(DrawY), .is_pac(is_pac), .adj_walls(adj_walls),
						
						.wall1(is_wall1),
                  .wall2(is_wall2),
                  .wall3(is_wall3),
                  .wall4(is_wall4),
                  .wall5(is_wall5),
                  .wall6(is_wall6),
                  .wall7(is_wall7),
                  .wall8(is_wall8),
                  .wall9(is_wall9),
                  .wall10(is_wall10),
                  .wall11(is_wall11),
                  .wall12(is_wall12),
                  .wall13(is_wall13),
                  .wall14(is_wall14),
                  .wall15(is_wall15),
                  .wall16(is_wall16),
						
						.pos1(pos1),
						.pos2(pos2),
						.pos3(pos3),
						.pos4(pos4),
						.pos5(pos5),
						.pos6(pos6),
						.pos7(pos7),
						.pos8(pos8),
						.pos9(pos9),
						.pos10(pos10),
                  .pos11(pos11),
                  .pos12(pos12),
                  .pos13(pos13),
                  .pos14(pos14),
                  .pos15(pos15),
                  .pos16(pos16));
						
lab7_soc nios_system(
                             .clk_clk(Clk),         
                             .reset_reset_n(1'b1),    // Never reset NIOS
                             .sdram_wire_addr(DRAM_ADDR), 
                             .sdram_wire_ba(DRAM_BA),   
                             .sdram_wire_cas_n(DRAM_CAS_N),
                             .sdram_wire_cke(DRAM_CKE),  
                             .sdram_wire_cs_n(DRAM_CS_N), 
                             .sdram_wire_dq(DRAM_DQ),   
                             .sdram_wire_dqm(DRAM_DQM),  
                             .sdram_wire_ras_n(DRAM_RAS_N),
                             .sdram_wire_we_n(DRAM_WE_N), 
                             .sdram_clk_clk(DRAM_CLK),
                             .keycode_export(keycode),  
                             .otg_hpi_address_export(hpi_addr),
                             .otg_hpi_data_in_port(hpi_data_in),
                             .otg_hpi_data_out_port(hpi_data_out),
                             .otg_hpi_cs_export(hpi_cs),
                             .otg_hpi_r_export(hpi_r),
                             .otg_hpi_w_export(hpi_w),
                             .otg_hpi_reset_export(hpi_reset)
    );
						
						
Map maze(.Clk(Clk), .pacman_pos(((pac_x+7)>>4)+(((pac_y+7)>>4)*40)), .pos((DrawX>>4) + ((DrawY>>4)*40)),
				
			.is_wall(is_wall), .adj_walls(adj_walls), .adj_walls_vga(adj_walls_vga), .adj_wallsg(adj_wallsg),
			
			.pos2(pos1),
         .pos3(pos2),
         .pos4(pos3),
         .pos5(pos4),
         .pos6(pos5),
         .pos7(pos6),
         .pos8(pos7),
         .pos9(pos8),
         .pos10(pos9),
         .pos11(pos10),
         .pos12(pos11),
         .pos13(pos12),
         .pos14(pos13),
         .pos15(pos14),
         .pos16(pos15),
			.pos17(pos16),
			
			.is_wall2(is_wall1), 
		   .is_wall3(is_wall2), 
		   .is_wall4(is_wall3), 
		   .is_wall5(is_wall4), 
		   .is_wall6(is_wall5), 
		   .is_wall7(is_wall6), 
		   .is_wall8(is_wall7), 
		   .is_wall9(is_wall8), 
		   .is_wall10(is_wall9),
		   .is_wall11(is_wall10),
		   .is_wall12(is_wall11),
		   .is_wall13(is_wall12),
		   .is_wall14(is_wall13),
		   .is_wall15(is_wall14),
		   .is_wall16(is_wall15),
		   .is_wall17(is_wall16));


			
Score score_inst(.Clk(Clk), .Reset(Reset_h), .increase(seen_pellet), .out(score)); 
			 
			 
			 
pellet pellet_inst(.Clk(Clk), .Reset(Reset_h), .position((DrawX >> 4) + ((DrawY >> 4) * 40)), .pacman_position(((pac_x + 7) >> 4) + (((pac_y + 7) >> 4) * 40)), .is_pellet(is_pellet), .seen_pellet(seen_pellet));	

HexDriver hex_inst_1 (score[3:0], HEX0);
		HexDriver hex_inst_2 (score[7:4], HEX1);
		HexDriver hex_inst_3 (score[11:8], HEX2);


endmodule 		 