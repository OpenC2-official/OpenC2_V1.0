from read_verilog import clean_verilog
from read_verilog import get_modules_in_verilog
from read_verilog import get_module
from read_verilog import get_nets_and_pins
import math
import random
import numpy as np
import re
import os


def import_verilog(verilog_file, top_module_name):
    # clean flattened verilog file
    clean_verilog(verilog_file)
    path, file_name = os.path.split(verilog_file)  
    verilog_file_cleaned = path + '_cleaned/' + file_name[:-2] + '_cleaned.v'
    # read verilog file
    [modules, net_groups_combined] = get_modules_in_verilog(verilog_file_cleaned)
    top_module = get_module(top_module_name, modules)
    # get cells from verilog file
    cells_v = top_module[3]
    # dictionary of cells to be placed
    cells_list = []
    for cell in cells_v: 
        cells_list.append([cell[0], cell[1], [0, 0], [0, 0], [0, 0]])
    zip(*cells_list)
    cells = {name: (type, position, gradient, momentum) for name, type, position, gradient, momentum in cells_list}
    # get nets and pins_v from verilog file
    [nets, pins_v] = get_nets_and_pins(top_module, net_groups_combined)
    # dictionary of pins to be placed
    pins_list = []
    for pin in pins_v:    # [pin_name, direction, position, net_connect_name] 
        pins_list.append(pin)
    zip(*pins_list)
    pins = {name: (direction, position, net_name) for name, direction, position, net_name in pins_list}
    return [cells, nets, pins]


def calc_area(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, cells, dens, module_type): 
    # parameter
    log_num_row = int(math.log(num_row, 2))
    site_width = 0.19
    row_height = 1.26
    if module_type == 'decoder':  # for decoder
        # calculate cell num
        std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], log_num_row + num_row*log_num_row]
        std_cell_lib['nand2'] = [std_cell_lib['nand2'][0], std_cell_lib['nand2'][1], num_row*log_num_row]
        # calculate area
        width = log_num_row*std_cell_lib['nand2'][0]+(log_num_row+1)*std_cell_lib['inverter'][0]+site_width
        num_std_cell_row = num_row
        height = num_std_cell_row * row_height
    elif module_type == 'driver':  # for driver
        # parameter
        num_stage = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
        size = int(num_col/16)
        num_inv_in_a_row = 0
        # calculate cell num
        for j in range(num_stage): 
            std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], std_cell_lib['inverter'][2]+num_row*size]
            num_inv_in_a_row += size
            size = math.ceil(size/4)
        # calculate area
        width = num_inv_in_a_row * std_cell_lib['inverter'][0]
        num_std_cell_row = num_row
        height = num_std_cell_row * row_height
    elif module_type == 'driver_b':  # for driver_b
        # parameter
        num_stage = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
        size = int(num_col/16)
        num_inv_in_a_row = 0
        # calculate cell num
        for j in range(num_stage): 
            std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], std_cell_lib['inverter'][2]+num_row*size]
            num_inv_in_a_row += size
            size = math.ceil(size/4)
        # calculate area
        width = num_inv_in_a_row * std_cell_lib['inverter'][0] + site_width
        num_std_cell_row = num_row
        height = num_std_cell_row * row_height
    elif module_type == 'sram_with_rw':  # for sram_with_rw
        # calculate cell num
        std_cell_lib['dcim_bitcell'] = [std_cell_lib['dcim_bitcell'][0], std_cell_lib['dcim_bitcell'][1], num_row*weight_bit_width]
        std_cell_lib['sram_rw'] = [std_cell_lib['sram_rw'][0], std_cell_lib['sram_rw'][1], weight_bit_width]
        # calculate area
        width = weight_bit_width * (math.ceil(std_cell_lib['dcim_bitcell'][0]/site_width))*site_width
        num_std_cell_row = num_row + math.ceil(std_cell_lib['sram_rw'][1]/row_height)
        height = num_std_cell_row * row_height
    elif module_type == 'adder_tree':  # for adder_tree
        # calculate cell num
        std_cell_lib['half_adder'] = [std_cell_lib['half_adder'][0], std_cell_lib['half_adder'][1], std_cell_lib['half_adder'][2] + num_row/2 - 1]
        std_cell_lib['adder_sign_extension'] = [std_cell_lib['adder_sign_extension'][0], std_cell_lib['adder_sign_extension'][1], std_cell_lib['adder_sign_extension'][2] + num_row/2 - 1]
        std_cell_lib['full_adder'] = [std_cell_lib['full_adder'][0], std_cell_lib['full_adder'][1], std_cell_lib['full_adder'][2] + weight_bit_width*num_row/2 - (weight_bit_width+log_num_row)]   
        # calculate area
        width = std_cell_lib['half_adder'][0] + weight_bit_width * std_cell_lib['full_adder'][0] + max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
        num_std_cell_row = num_row
        height = num_std_cell_row * row_height + std_cell_lib['sram_rw'][1]
    elif module_type == 'accumulator':  # for accumulator
        # calculate cell num
        std_cell_lib['dff'] = [std_cell_lib['dff'][0], std_cell_lib['dff'][1], 3*weight_bit_width + 3*log_num_row + 2*input_bit_width - 1]
        std_cell_lib['nand2'] = [std_cell_lib['nand2'][0], std_cell_lib['nand2'][1], 3*weight_bit_width + 3*log_num_row + 1]
        std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], weight_bit_width + log_num_row + 2]
        std_cell_lib['full_adder'] = [std_cell_lib['full_adder'][0], std_cell_lib['full_adder'][1], weight_bit_width + log_num_row + input_bit_width]
        std_cell_lib['mux_2_1'] = [std_cell_lib['mux_2_1'][0], std_cell_lib['mux_2_1'][1], 1]
        std_cell_lib['tiel'] = [std_cell_lib['tiel'][0], std_cell_lib['tiel'][1], 1]
        # calculate area
        width = weight_bit_width * math.ceil(std_cell_lib['dcim_bitcell'][0]/site_width) * site_width + std_cell_lib['half_adder'][0] + weight_bit_width * std_cell_lib['full_adder'][0] + max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
        num_std_cell_row = math.ceil(sum([value[0] * value[1] * value[2] for value in std_cell_lib.values()])/dens/width/row_height)
        height = num_std_cell_row * row_height
    elif module_type == 'control':  # for control block
        # calculate height of accumulator
        std_cell_lib['dff'] = [std_cell_lib['dff'][0], std_cell_lib['dff'][1], 3*weight_bit_width + 3*log_num_row + 2*input_bit_width - 1]
        std_cell_lib['nand2'] = [std_cell_lib['nand2'][0], std_cell_lib['nand2'][1], 3*weight_bit_width + 3*log_num_row + 1]
        std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], weight_bit_width + log_num_row + 2]
        std_cell_lib['full_adder'] = [std_cell_lib['full_adder'][0], std_cell_lib['full_adder'][1], weight_bit_width + log_num_row + input_bit_width]
        std_cell_lib['mux_2_1'] = [std_cell_lib['mux_2_1'][0], std_cell_lib['mux_2_1'][1], 1]
        width = weight_bit_width * math.ceil(std_cell_lib['dcim_bitcell'][0]/site_width) * site_width + std_cell_lib['half_adder'][0] + weight_bit_width * std_cell_lib['full_adder'][0] + max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
        num_std_cell_row_accumulator = math.ceil(sum([value[0] * value[1] * value[2] for value in std_cell_lib.values()])/dens/width/row_height)
        height_accumulator = num_std_cell_row_accumulator * row_height
        # calculate cell num
        for value in cells.values():
            std_cell_lib[value[0]] = [std_cell_lib[value[0]][0], std_cell_lib[value[0]][1], std_cell_lib[value[0]][2]+1]
        # calculate area
        # driver for wl
        num_inv_in_driver = 0
        size = int(num_col/16)
        stage_driver = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
        for j in range(stage_driver):
            num_inv_in_driver += size 
            size = math.ceil(size/4)
        # driver for input
        num_inv_in_driver_b = 0
        size = int(num_col/16)
        stage_driver_b = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
        for j in range(stage_driver_b): 
            num_inv_in_driver_b += size 
            size = math.ceil(size/4)
        width = log_num_row * std_cell_lib['nand2'][0] + (log_num_row+1 + num_inv_in_driver + num_inv_in_driver_b) * std_cell_lib['inverter'][0]  + site_width*2
        height = height_accumulator + std_cell_lib['sram_rw'][1]
    else: 
        print("Error: unexpected module type.")
    # calculate area and bin
    area = [[0, 0], [round(width/site_width)*site_width, height]]
    num_cell = sum([value[2] for value in std_cell_lib.values()])
    bin_num = [math.ceil(math.sqrt(num_cell/(height/width))), math.ceil(math.sqrt(num_cell/(width/height)))]
    bin_size = [width/bin_num[0], height/bin_num[1]]
    bins = []
    for i in range(bin_num[0]):
        for j in range(bin_num[1]):
            bins.append([i*bin_size[0], j*bin_size[1]])
    return [area, bin_size, bins]


def init(verilog_file, top_module_name, num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, dens, module_type):
    # initial cells and bins
    [cells, nets, pins] = import_verilog(verilog_file, top_module_name)
    [area, bin_size, bins] = calc_area(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, cells, dens, module_type)
    # parameter
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width

    site_width = 0.19
    row_height = 1.26
    
    # decoder
    if module_type == 'decoder': 
        # init cells
        for key, value in cells.items():
            if key.startswith('inv_for_input'):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - int(nums[0])*row_height
            elif re.match(r'^nand_\d+\.nand2_\d$', key):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0] + std_cell_lib['inverter'][0] + int(nums[-1])*(std_cell_lib['nand2'][0]+std_cell_lib['inverter'][0])
                value[1][1] = area[0][1] + area[1][1] - row_height - int(nums[0])*row_height
            elif re.match(r'^nand_\d+\.inv_\d$', key):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0] + (int(nums[-1])+1)*(std_cell_lib['nand2'][0]+std_cell_lib['inverter'][0])
                value[1][1] = area[0][1] + area[1][1] - row_height - int(nums[0])*row_height
            elif key.startswith('inv_for_output'):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0] + area[1][0] - std_cell_lib['inverter'][0] - site_width
                value[1][1] = area[0][1] + area[1][1] - row_height - int(nums[0])*row_height
        # init pins
        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
        for key, value in pins.items():      
            if key.startswith('out'):      # wl, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width+site_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0] + area[1][0] - layer_width - site_width    # right
                # align with the metal track in horizontal direction
                if row%2 == 0: 
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        # init pins
        layer_name = 'metal3'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0.07]
        for key, value in pins.items():  
            if key.startswith('in'):      # in, placed on the left top
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                if row%2 == 0: 
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - 2*layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        # init pins
        layer_name = 'metal4'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.285, 0.28]
        layer_width = 0.14
        layer_offset = [0.285, 0.21]
        for key, value in pins.items(): 
            if key == 'enable':    # "wl_enable", first left track
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + layer_offset[0] - layer_width/2
                value[1][1] = area[0][1]
    # driver
    elif module_type == 'driver':
        # parameter
        num_stage = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
        size = int(num_col/16)
        size_list_reversed = []
        for j in range(num_stage): 
            size_list_reversed.append(size)
            size = math.ceil(size/4)
        size_list = size_list_reversed[::-1]
        # init cells
        for key, value in cells.items(): 
            nums = re.findall(r'\d+', key)
            if re.match(r'^inv_stage\d+_\d+$', key): 
                stage = int(nums[-2])
                row = int(nums[-1])
                value[1][0] = area[0][0] + sum(size_list[:stage])*std_cell_lib['inverter'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - row*row_height
            elif re.match(r'^inv\d+_stage\d+_\d+\.inv_\d+$', key):
                stage = int(nums[-3])
                row = int(nums[-2])
                value[1][0] = area[0][0] + (sum(size_list[:stage])+int(nums[-1]))*std_cell_lib['inverter'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - row*row_height
        # # calc driver_b_width
        # num_stage = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
        # size = int(num_col/16)
        # num_inv_in_a_row = 0
        # for j in range(num_stage): 
        #     std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], std_cell_lib['inverter'][2]+num_row*size]
        #     num_inv_in_a_row += size
        #     size = math.ceil(size/4)
        # driver_b_width = num_inv_in_a_row * std_cell_lib['inverter'][0]
        # init pins
        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
        for key, value in pins.items(): 
            if key.startswith('in'):      # wl, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0]    # left
                # align with the metal track in horizontal direction
                if row%2 == 0: 
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  
            elif key.startswith('out'):      # wl, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0] + area[1][0] - layer_width     # right
                # align with the metal track in horizontal direction
                if row%2 == 0: 
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  
            # elif key.startswith('out'):      # wl, align with the bitcell
            #     pins[key] = [value[0], value[1], value[2], layer_name, [driver_b_width+layer_width, layer_width]]
            #     nums = re.findall(r'\d+', key)
            #     row = int(nums[0])
            #     value[1][0] = area[0][0] + area[1][0] - layer_width     # right
            #     # align with the metal track in horizontal direction
            #     if row%2 == 0: 
            #         value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            #     else:
            #         value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  

    # driver_b
    elif module_type == 'driver_b':
        # parameter
        num_stage = math.ceil(math.ceil(math.log(num_col/16, 4))/2)*2+1
        size = int(num_col/16)
        size_list_reversed = []
        for j in range(num_stage): 
            size_list_reversed.append(size)
            size = math.ceil(size/4)
        size_list = size_list_reversed[::-1]
        # init cells
        for key, value in cells.items(): 
            nums = re.findall(r'\d+', key)
            if re.match(r'^inv_stage\d+_\d+$', key): 
                stage = int(nums[-2])
                row = int(nums[-1])
                value[1][0] = area[0][0] + sum(size_list[:stage])*std_cell_lib['inverter'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - row*row_height
            elif re.match(r'^inv\d+_stage\d+_\d+\.inv_\d+$', key):
                stage = int(nums[-3])
                row = int(nums[-2])
                value[1][0] = area[0][0] + (sum(size_list[:stage])+int(nums[-1]))*std_cell_lib['inverter'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - row*row_height
        # # calc decoder_width
        # decoder_width = log_num_row*(std_cell_lib['nand2'][0]+std_cell_lib['inverter'][0])
        # # calc driver_width
        # num_stage = math.ceil((math.ceil(math.log(num_col/16, 4))+1)/2)*2
        # size = int(num_col/16)
        # num_inv_in_a_row = 0
        # for j in range(num_stage): 
        #     std_cell_lib['inverter'] = [std_cell_lib['inverter'][0], std_cell_lib['inverter'][1], std_cell_lib['inverter'][2]+num_row*size]
        #     num_inv_in_a_row += size
        #     size = math.ceil(size/4)
        # driver_width = num_inv_in_a_row * std_cell_lib['inverter'][0]
        # init_pins
        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
        for key, value in pins.items(): 
            # if key.startswith('in'):      # in_b, align with the bitcell
            #     pins[key] = [value[0], value[1], value[2], layer_name, [decoder_width+driver_width+layer_width, layer_width]]
            #     nums = re.findall(r'\d+', key)
            #     row = int(nums[0])
            #     value[1][0] = area[0][0] - driver_width - decoder_width    # left
            #     # align with the metal track in horizontal direction
            #     if row%2 == 0:
            #         value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
            #     else:
            #         value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] 
            if key.startswith('in'):      # in_b, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0]   # left
                # align with the metal track in horizontal direction
                if row%2 == 0:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] 
            elif key.startswith('out'):      # in_b, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [site_width+layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0] + area[1][0] - site_width - layer_width     # right
                # align with the metal track in horizontal direction
                if row%2 == 0:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]  


    # sram_with_rw
    elif module_type == 'sram_with_rw':
        # init cells
        for key, value in cells.items():
            if key.startswith(f'sram.bitcell'):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0] + (weight_bit_width-1-int(nums[1]))*math.ceil(std_cell_lib['dcim_bitcell'][0]/site_width)*site_width
                value[1][1] = area[0][1] + area[1][1] - row_height - int(nums[0])*std_cell_lib['dcim_bitcell'][1]
            elif key.startswith(f'sram_rw.rw'):
                nums = re.findall(r'\d+', key)
                value[1][0] = area[0][0] + (weight_bit_width-1-int(nums[0]))*math.ceil(std_cell_lib['sram_rw'][0]/site_width)*site_width
                value[1][1] = area[0][1]
        # init pins
        layer_name = 'metal3'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0.07]
        num_routing_tracks_in_a_row = int((row_height-layer_offset[1])/layer_pitch[1])
        pin_pitch_y = num_routing_tracks_in_a_row//weight_bit_width*layer_pitch[1]

        for key, value in pins.items():  
            if key.startswith('bitcell_out'):      # bitcell_out, evenly placed on the right
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                bit = int(nums[1])
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] - bit*pin_pitch_y
        
        # init pins
        adder_tree_width = std_cell_lib['half_adder'][0] + weight_bit_width * std_cell_lib['full_adder'][0] + max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
        for key, value in pins.items():      
            if key.startswith('wl'):      # wl, placed on the left, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                if row%2 == 0:
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
            elif key.startswith('in_b'):      # in_b, placed on the left, align with the bitcell
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                if row%2 == 0:
                    value[1][1] = area[0][1] + area[1][1] - (row+1)*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
                else:
                    value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key.startswith('pe'):      # pe, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height*3 + layer_offset[1] - layer_width/2 + layer_pitch[1]*5
            elif key.startswith('ysw'):      # ysw, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height*4 + layer_offset[1] - layer_width/2 + layer_pitch[1]*5
            elif key.startswith('ysr'):      # ysr, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height*3 + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key.startswith('spe'):      # spe, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
            elif key.startswith('se'):      # se, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0]+adder_tree_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height*2 + layer_offset[1] - layer_width/2 - layer_pitch[1]*3
            elif key.startswith('din'):      # din
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                col = int(nums[0])
                value[1][0] = area[0][0] + std_cell_lib['sram_rw'][0]*(weight_bit_width-1-col) + layer_offset[0] - layer_width/2 + layer_pitch[0]*2
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height*3 + layer_offset[1] - layer_width/2 + layer_pitch[1]*4
            elif key.startswith('dout'):      # dout
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                col = int(nums[0])
                value[1][0] = area[0][0] + std_cell_lib['sram_rw'][0]*(weight_bit_width-1-col) + layer_offset[0] - layer_width/2 + layer_pitch[0]*4
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + layer_offset[1] - layer_width/2 + layer_pitch[1]*2
    # adder_tree
    elif module_type == 'adder_tree':
        # init cells
        # pyramid
        for key, value in cells.items():
            nums = re.findall(r'\d+', key)
            stage = int(nums[0])-weight_bit_width
            if re.match(r'^adder_\d+bit_\d+.ha_\d+$', key): 
                value[1][0] = area[0][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - (2**stage+int(nums[1])*(2**(stage+1)))*row_height
            elif re.match(r'^adder_\d+bit_\d+.fa_\d+$', key): 
                value[1][0] = area[0][0] + std_cell_lib['half_adder'][0] + (int(nums[-1])-1)*std_cell_lib['full_adder'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - (2**stage+int(nums[1])*(2**(stage+1)))*row_height
            elif re.match(r'^adder_\d+bit.ha_\d+$', key): 
                value[1][0] = area[0][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - (2**stage)*row_height
            elif re.match(r'^adder_\d+bit.fa_\d+$', key): 
                value[1][0] = area[0][0] + std_cell_lib['half_adder'][0] + (int(nums[-1])-1)*std_cell_lib['full_adder'][0]
                value[1][1] = area[0][1] + area[1][1] - row_height - (2**stage)*row_height
        # move the outer cells into the area
        cells_mov = {}
        for key, value in cells.items():
            if value[1][0] > area[0][0] + area[1][0] - max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0]):
                cells_mov[key] = value
        y_mov = [value[1][1] for value in cells_mov.values()]
        y_list = (np.arange(0, num_row/2)*2+5)*row_height
        diff_mat = np.abs(y_list[:, None] - y_mov)
        closest_indices = []
        for col in range(diff_mat.shape[1]):
            min_index = np.argmin(diff_mat[:, col])
            # 如果最小值所在的行索引已经在 closest_indices 中出现过，则继续找第二小的值
            while min_index in closest_indices:
                # 将已经找过的最小值对应的元素设为一个极大值
                diff_mat[min_index, col] = np.inf
                # 再次找出最小值所在的行索引
                min_index = np.argmin(diff_mat[:, col])
            # 将找到的最小值所在的行索引添加到列表中
            closest_indices.append(min_index)
        y_moved = y_list[closest_indices]
        i = 0
        for value in cells_mov.values():
            value[1][0] = area[1][0] - max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
            value[1][1] = y_moved[i]
            i += 1

        # init pins
        layer_name = 'metal3'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0.07]
        num_routing_tracks_in_a_row = int((row_height-layer_offset[1])/layer_pitch[1])
        pin_pitch_y = num_routing_tracks_in_a_row//weight_bit_width*layer_pitch[1]

        for key, value in pins.items():  
            if key.startswith('in'):      # in, evenly placed on the left
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                row = int(nums[0])
                bit = int(nums[1])
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - row*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] - bit*pin_pitch_y

        layer_name = 'metal4'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.285, 0.28]
        layer_width = 0.14
        layer_offset = [0.285, 0.21]

        for key, value in pins.items():
            if key.startswith('out'):      # out, evenly placed on the bottom
                num_routing_tracks_x = int((area[1][0]-layer_pitch[0]-layer_offset[0])/layer_pitch[0])
                pin_pitch_x = int(num_routing_tracks_x/(psum_bit_width+1))*layer_pitch[0]
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width+std_cell_lib['sram_rw'][1]]]
                nums = re.findall(r'\d+', key)
                bit = int(nums[0])
                # align with the metal track in vertical direction
                value[1][0] = area[0][0] + layer_offset[0] - layer_width/2 + (psum_bit_width-bit)*pin_pitch_x
                value[1][1] = area[0][1]
            elif key.startswith('sign_weight'):    # "sign_weight", bottom
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, area[1][1]+layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_pitch[0]
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1] - layer_width

    # accumulator
    elif module_type == 'accumulator':
        for key, value in cells.items():
            value[1][0] = area[0][0] + (area[1][0]-std_cell_lib[value[0]][0])/2 + random.random()
            value[1][1] = area[0][1] + (area[1][1]-std_cell_lib[value[0]][1])/2 + random.random()
        # init pins
        adder_tree_width = std_cell_lib['half_adder'][0] + weight_bit_width * std_cell_lib['full_adder'][0] + max(std_cell_lib['full_adder'][0], std_cell_lib['adder_sign_extension'][0])
        sram_with_rw_width = weight_bit_width * std_cell_lib['dcim_bitcell'][0]
        layer_name = 'metal4'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.285, 0.28]
        layer_width = 0.14
        layer_offset = [0.285, 0.21]
        for key, value in pins.items():
            if key.startswith('in<'):   # '<'是为了排除in_msb
                num_routing_tracks_x = int((adder_tree_width-layer_pitch[0]-layer_offset[0])/layer_pitch[0])
                pin_pitch_x = int(num_routing_tracks_x/(psum_bit_width+1))*layer_pitch[0]
                # pin_name: [direction, position, net_connect_name]
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                bit = int(nums[0])
                # align with the metal track in vertical direction
                value[1][0] = area[0][0] + sram_with_rw_width + layer_offset[0] - layer_width/2 + (psum_bit_width-bit)*pin_pitch_x
                value[1][1] = area[0][1] + area[1][1] - layer_width
            elif key.startswith('out'):      # out, evenly placed on the bottom
                num_routing_tracks_x = int((area[1][0]-layer_offset[0])/layer_pitch[0])
                pin_pitch_x = int(num_routing_tracks_x/(column_psum_bit_width+1))*layer_pitch[0]
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                nums = re.findall(r'\d+', key)
                bit = int(nums[0])
                # align with the metal track in vertical direction
                value[1][0] = area[0][0] + layer_offset[0] - layer_width/2 + (column_psum_bit_width-bit)*pin_pitch_x
                value[1][1] = area[0][1]
            elif key.startswith('sign_weight'):    # "sign_weight", top
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_pitch[0]
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1] + area[1][1] - layer_width
            elif key.startswith('sign_out'):    # "sign_weight", bottom
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_pitch[0]
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1]

        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]

        for key, value in pins.items():     
            if key.startswith('sign_in'):       # 1st row
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key.startswith('in_msb'):      # 1st row
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  
            elif key.startswith('clk_psum'):    # 2nd row
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]  
            elif key.startswith('clk_shift'):   # mid
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + round(area[1][1]/2/row_height)*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key.startswith('clk_out'):     # last row
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key.startswith('rst_b'):       # 2nd row
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1]  - 2*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]

            
    # control
    elif module_type == 'control':
        for key, value in cells.items():
            value[1][0] = area[0][0] + (area[1][0]-std_cell_lib[value[0]][0])/2 + random.random()
            value[1][1] = area[0][1] + (area[1][1]-std_cell_lib[value[0]][1])/2 + random.random()
        
        # init pins
        layer_name = 'metal2'    # metal_name: [direction, pitch, width, offset]
        # pe, ysw, ysr, spe, se, clk, clk_b, rst_b, in_msb, clk_out
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0]
        for key, value in pins.items():     
            if key == 'pe':      # pe, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + row_height*3 + layer_offset[1] - layer_width/2 + layer_pitch[1]*5
            elif key == 'ysw':      # ysw, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + row_height*4 + layer_offset[1] - layer_width/2 + layer_pitch[1]*5
            elif key == 'ysr':      # ysr, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + row_height*3 + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key == 'spe':      # spe, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
            elif key == 'se':      # se, placed on the left, align with the rw circuit
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + row_height*2 + layer_offset[1] - layer_width/2 - layer_pitch[1]*3
                    
            elif key == 'in_msb':      # 1st row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - row_height + layer_offset[1] - layer_width/2 + layer_pitch[1] 
            elif key == 'rst_b':       # 2nd row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - 2*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
            elif key == 'clk_b':   # mid
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + round((area[1][1]-std_cell_lib['sram_rw'][1])/2/row_height)*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key == 'clk_out':     # last row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0] - layer_width
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            
            elif key == 'clk':    # 2nd row, width = area_width
                pins[key] = [value[0], value[1], value[2], layer_name, [area[1][0], layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - row_height + layer_offset[1] - layer_width/2 - layer_pitch[1] 

        # init pins
        layer_name = 'metal3'    # metal_name: [direction, pitch, width, offset]
        # rst, r_w_cim[0], r_w_cim[1], start 
        layer_pitch = [0.19, 0.14]
        layer_width = 0.07
        layer_offset = [0.095, 0.07]
        for key, value in pins.items():     
            if key == 'rst':           # -1 row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] + layer_offset[1] - layer_width/2 + layer_pitch[1]  
            elif key == 'start':       # 1st row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]  
            elif key == 'r_w_cim<0>':  # 3rd row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - 2*row_height + layer_offset[1] - layer_width/2 - layer_pitch[1]
            elif key == 'r_w_cim<1>':  # 3rd row
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0]
                # align with the metal track in horizontal direction
                value[1][1] = area[0][1] + area[1][1] - std_cell_lib['sram_rw'][1] - 3*row_height + layer_offset[1] - layer_width/2 + layer_pitch[1]
        
        # init_pins
        layer_name = 'metal4'    # metal_name: [direction, pitch, width, offset]
        # wl_enable, rd_data_enable, cim_data_enable, busy
        layer_pitch = [0.285, 0.28]
        layer_width = 0.14
        layer_offset = [0.285, 0.21]
        for key, value in pins.items(): 
            if key == 'wl_enable':    # "wl_enable", first left track 
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + layer_offset[0] - layer_width/2
                value[1][1] = area[0][1] + area[1][1] - layer_width
            elif key == 'busy':    # bottom
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0]/4
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1]
            elif key == 'rd_data_enable':    # bottom
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0]/4*2
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1]
            elif key == 'cim_data_enable':    # bottom
                # pin_name: [direction, position, net_connect_name] 
                # -> pin_name: [direction, position, net_connect_name, layer_name, layer_size]
                pins[key] = [value[0], value[1], value[2], layer_name, [layer_width, layer_width]]
                value[1][0] = area[0][0] + area[1][0]/4*3
                # align with the metal track in vertical direction
                value[1][0] = round((value[1][0]-(layer_offset[0]-layer_width/2))/layer_pitch[0])*layer_pitch[0] + (layer_offset[0]-layer_width/2)
                value[1][1] = area[0][1]
            


    
    # other unexpected module type
    else: 
        print("Error: Unexpected module type.")

    # return initialization info
    return [cells, nets, pins, area, bin_size, bins]