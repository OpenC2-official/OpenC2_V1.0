// `timescale 1ns / 1ps

module control #(
	parameter input_bit_width
)(
	input wire clk,  // system clock
	input wire rst,  // system reset (active high)
	input wire [1:0] r_w_cim,  // 00 no operation, 01 read, 10 writre, 11 cim
	input wire start,  // flag for starting read or write

	output reg wl_enable,
	output reg pe,
	output reg ysw,
	output reg ysr,
	output reg spe,
	output reg se, 
	output reg rd_data_enable,  // indicate when read data can be accessed
	output wire clk_b, 
	output reg rst_b,
	output reg in_msb,
	output reg clk_out,
	output reg cim_data_enable, // indicate when CIM data can be accessed
	output wire busy  // indicate when to start the next operation
);
	reg [1:0] rw_state_reg;
	reg	[1:0] r_w_cim_reg;
	reg	[clog2(input_bit_width+3)-1:0] cim_state_reg;
	reg	rw_busy;
	reg	cim_busy;

	assign busy = (rw_busy == 1'b1 || cim_busy == 1'b1);
	assign clk_b = ~ clk;

	always @(*) begin
		cim_busy = (cim_state_reg > ('d0) && cim_state_reg <= (input_bit_width+'d2)) ? 1'b1 : 1'b0;
		case ({rw_state_reg, r_w_cim_reg})
			4'b0101: begin
				wl_enable	= 1'b1;
				pe		= 1'b1;
				ysr		= 1'b0;
				ysw		= 1'b0;
				spe		= 1'b1;
				se		= 1'b0;
				rd_data_enable	= 1'b0;
				rw_busy		= 1'b1;
			end
			4'b1001: begin
				wl_enable	= 1'b0;
				pe		= 1'b1;
				ysr		= 1'b1;
				ysw		= 1'b0;
				spe		= 1'b1;
				se		= 1'b1;
				rd_data_enable	= 1'b1;
				rw_busy		= 1'b1;
			end
			4'b0110, 4'b1010: begin
				wl_enable	= 1'b1;
				pe		= 1'b1;
				ysr		= 1'b1;
				ysw		= 1'b1;
				spe		= 1'b0;
				se		= 1'b0;
				rd_data_enable	= 1'b0;
				rw_busy		= 1'b1;
			end
			// 4'b0000, 4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0111, 4'b1000, 4'b1011, 4'b1100, 4'b1101, 4'b1110, 4'b1111
			default: begin
				wl_enable	= 1'b0;
				pe		= 1'b0;
				ysr		= 1'b0;
				ysw		= 1'b0;
				spe		= 1'b0;
				se		= 1'b0;
				rd_data_enable	= 1'b0;
				rw_busy		= 1'b0;
			end
		endcase
		rst_b = (cim_state_reg == 'd1) ? 1'b0 : 1'b1;
	end

	always @(posedge clk) begin
  		if (rst == 1'b1) begin
			rw_state_reg <= 2'b00;
			r_w_cim_reg <= 2'b00;
			cim_state_reg <= 'd0;
  		end 
		else begin
			case ({busy, start, r_w_cim, r_w_cim_reg})
				6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101, 6'b000110, 6'b000111: begin
					r_w_cim_reg <= r_w_cim_reg;
					rw_state_reg <= 2'b00;
					cim_state_reg <= 'd0;
				end
				6'b001000, 6'b001001, 6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111: begin
					r_w_cim_reg <= r_w_cim_reg;
					rw_state_reg <= 2'b00;
					cim_state_reg <= 'd0;
				end
				6'b010000, 6'b010001, 6'b010010, 6'b010011: begin
					r_w_cim_reg <= r_w_cim_reg;
					rw_state_reg <= 2'b00;
					cim_state_reg <= 'd0;
				end
				6'b010100, 6'b010101, 6'b010110, 6'b010111, 6'b011000, 6'b011001, 6'b011010, 6'b011011: begin
					r_w_cim_reg <= r_w_cim;
					rw_state_reg <= 2'b01;
					cim_state_reg <= 'd0;
				end
				6'b011100, 6'b011101, 6'b011110, 6'b011111: begin
					r_w_cim_reg <= 2'b11;
					rw_state_reg <= 2'b00;
					cim_state_reg <= 'd1;
				end
				6'b100000, 6'b100100, 6'b101000, 6'b101100, 6'b110000, 6'b110100, 6'b111000, 6'b111100: begin
					r_w_cim_reg <= r_w_cim_reg;
					rw_state_reg <= 2'b00;
					cim_state_reg <= 'd0;
				end
				6'b100001, 6'b100101, 6'b101001, 6'b101101, 6'b110001, 6'b110101, 6'b111001, 6'b111101: begin
					r_w_cim_reg <= r_w_cim_reg;
					if (rw_state_reg == 2'b01) begin
						rw_state_reg <= 2'b10;
					end
					else begin
						rw_state_reg <= 2'b00;
					end
					cim_state_reg <= 'd0;
				end
				6'b100010, 6'b100110, 6'b101010, 6'b101110, 6'b110010, 6'b110110, 6'b111010, 6'b111110: begin
					if (rw_state_reg == 2'b01) begin
						rw_state_reg <= 2'b10;
					end
					else begin
						rw_state_reg <= 2'b00;
					end
					r_w_cim_reg <= r_w_cim_reg;
					cim_state_reg <= 'd0;
				end
				6'b100011, 6'b100111, 6'b101011, 6'b101111, 6'b110011, 6'b110111, 6'b111011, 6'b111111: begin
					rw_state_reg <= 2'b00;
					r_w_cim_reg <= r_w_cim_reg;
					if (cim_state_reg < (input_bit_width + 'd2)) begin
						cim_state_reg <= cim_state_reg + 'd1;
					end
					else begin
						cim_state_reg <= 'd0;
					end
				end
			endcase
  		end
	end

	always @(negedge clk) begin
		if (rst == 1'b1) begin
			in_msb <= 1'b0;
			clk_out <= 1'b0;
			cim_data_enable	<= 1'b0;
		end
		else begin
			if (cim_state_reg == 'd2) begin
				in_msb <= 1'b1;
				clk_out <= 1'b0;
				cim_data_enable <= 1'b0;
			end
			else if (cim_state_reg == (input_bit_width+'d2)) begin
				in_msb <= 1'b0;
				clk_out <= 1'b1;
				cim_data_enable <= 1'b1;
			end
			else begin
				in_msb <= 1'b0;
				clk_out <= 1'b0;
				cim_data_enable <= 1'b0;
			end
		end
	end

	function integer clog2(input integer x);
  		integer j;
  		begin
			clog2 = 0;
			for (j = x - 1; j > 0; j = j >> 1) begin
				clog2 = clog2 + 1;
			end
  		end
	endfunction

endmodule