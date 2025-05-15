from initialization import init
from optimization import momentum
from wirelength import gradient_wirelength
from wirelength import wirelength
from density import gradient_potential_penalty
from density import calc_overflow_ratio
from density import calc_density_mat
from visualization import density_map
from visualization import viz
import math
import copy
import numpy as np
from legalization.legalize import legalization
import json
import os


def place_sram_with_rw(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                       site_width, row_height, result_path, potential_type, dens): 
    ###### sram_with_rw
    result_path_sram_with_rw = result_path + '/sram_with_rw'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'sram_{num_row}x{weight_bit_width}_with_rw'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    [cells, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                               weight_bit_width, input_bit_width, std_cell_lib, 
                                               dens, module_type = "sram_with_rw") 
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # print wirelength
    print("wirelength of sram with rw = ", wirelength(nets, cells, pins, gamma))
    # make dir
    if not os.path.exists(result_path_sram_with_rw):
        os.makedirs(result_path_sram_with_rw)
    # save placed cells
    cells_dump = {}
    for key, value in cells.items(): 
        cells_dump[key] = [value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]]
    with open(result_path_sram_with_rw + '/cells.json', 'w') as f:
        f.write(json.dumps(cells_dump))
    # save nets
    with open(result_path_sram_with_rw + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_sram_with_rw + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_sram_with_rw + '/area.json', 'w') as f:
        f.write(json.dumps(area))   
    # viz
    save_path = result_path_sram_with_rw + f'/placement.png'
    text = 'placement'
    coordinates = []
    widths = []
    heights = []
    labels = []
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)


def place_adder_tree(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                     site_width, row_height, result_path, potential_type, dens): 
    ###### parameter
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    ###### adder_tree
    result_path_adder_tree = result_path + '/adder_tree'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'adder_tree_{weight_bit_width}bit_to_{psum_bit_width}bit'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    [cells, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                               weight_bit_width, input_bit_width, std_cell_lib, 
                                               dens, module_type = "adder_tree") 
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # print wirelength
    print("wirelength of adder tree = ", wirelength(nets, cells, pins, gamma))
    # make dir
    if not os.path.exists(result_path_adder_tree):
        os.makedirs(result_path_adder_tree)
    # save placed cells
    cells_dump = {}
    for key, value in cells.items(): 
        cells_dump[key] = [value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]]
    with open(result_path_adder_tree + '/cells.json', 'w') as f:
        f.write(json.dumps(cells_dump))
    # save nets
    with open(result_path_adder_tree + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_adder_tree + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_adder_tree + '/area.json', 'w') as f:
        f.write(json.dumps(area))   
    # viz
    save_path = result_path_adder_tree + f'/placement.png'
    text = 'placement'
    coordinates = []
    widths = []
    heights = []
    labels = []
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)



def place_accumulator(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                      site_width, row_height, result_path, potential_type, dens): 
    ###### parameter
    log_num_row = int(math.log(num_row, 2))
    psum_bit_width = weight_bit_width + log_num_row
    column_psum_bit_width = psum_bit_width + input_bit_width
    ###### accumulator
    result_path_accumulator = result_path + '/accumulator'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'accumulator_{psum_bit_width}bit_to_{column_psum_bit_width}bit'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    # init
    [cells_init, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                                    weight_bit_width, input_bit_width, std_cell_lib, 
                                                    dens, module_type = "accumulator")
    # # save area
    # area[1][0] = round(area[1][0]/site_width)*site_width
    # area[1][1] = round(area[1][1]/row_height)*row_height
    # with open(result_path_accumulator + '/area.json', 'w') as f:
    #     f.write(json.dumps(area))
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # init lambda_0
    gradient_wirelength(nets, cells_init, pins, gamma)
    sum_gradient_wirelength = sum(abs(value[2][0]) for value in cells_init.values()) + sum(abs(value[2][1]) for value in cells_init.values())
    for value in cells_init.values():
        value[2][0] = 0
        value[2][1] = 0
    # gradient_potential_penalty
    gradient_potential_penalty(bins, bin_size, cells_init, std_cell_lib, potential_type, dens, lam = 1, pre_placed = 0)
    sum_gradient_potential_penalty = sum(abs(value[2][0]) for value in cells_init.values()) + sum(abs(value[2][1]) for value in cells_init.values())
    for value in cells_init.values():
        value[2][0] = 0
        value[2][1] = 0
    # lambda
    lam = sum_gradient_wirelength / sum_gradient_potential_penalty * 4
    ## iteration for lambda
    overflow_ratio = 1
    i = 0
    while overflow_ratio > 0.05 and i < 5: 
        cells = copy.deepcopy(cells_init)
        print(f"lambda_{i} = ", lam)
        result_path_lambda = result_path_accumulator + f'/lambda_{i}'
        momentum(area, cells, nets, pins, bin_size, bins, std_cell_lib, potential_type, dens, gamma, lam, result_path_lambda)
        overflow_ratio = calc_overflow_ratio(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
        print(f"overflow_ratio_{i} = ", overflow_ratio)
        [density_mat_norm, coef_mat] = calc_density_mat(bins, bin_size, cells, std_cell_lib, potential_type)
        bin_density_vector = np.sum(density_mat_norm, axis=1)
        density_map_path = result_path_lambda + '/density_map.png'
        density_map(area, bin_size, bins, bin_density_vector, density_map_path)
        lam = lam*2
        i += 1
    # save nets
    with open(result_path_accumulator + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_accumulator + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_accumulator + '/area.json', 'w') as f:
        f.write(json.dumps(area))
    # print wirelength
    print("wirelength after global placement = ", wirelength(nets, cells, pins, gamma)) 
    # legalization
    [greedy_cells, abacus_cells] = legalization(area, cells, bin_size, std_cell_lib, result_path_accumulator)
    # print wirelength
    print("wirelength after greedy legalization = ", wirelength(nets, greedy_cells, pins, gamma)) 
    print("wirelength after abacus legalization = ", wirelength(nets, abacus_cells, pins, gamma))


def place_decoder(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                  site_width, row_height, result_path, potential_type, dens): 
    ###### parameter
    log_num_row = int(math.log(num_row, 2))
    ###### decoder
    result_path_decoder = result_path + '/decoder'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'decoder_{log_num_row}_to_{num_row}'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    [cells, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                               weight_bit_width, input_bit_width, std_cell_lib, 
                                               dens, module_type = "decoder") 
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # print wirelength
    print("wirelength of decoder = ", wirelength(nets, cells, pins, gamma))
    # make dir
    if not os.path.exists(result_path_decoder):
        os.makedirs(result_path_decoder)
    # save placed cells
    cells_dump = {}
    for key, value in cells.items(): 
        cells_dump[key] = [value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]]
    with open(result_path_decoder + '/cells.json', 'w') as f:
        f.write(json.dumps(cells_dump))
    # save nets
    with open(result_path_decoder + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_decoder + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_decoder + '/area.json', 'w') as f:
        f.write(json.dumps(area))
    # viz
    save_path = result_path_decoder + f'/placement.png'
    text = 'placement'
    coordinates = []
    widths = []
    heights = []
    labels = []
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)


def place_driver(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                 site_width, row_height, result_path, potential_type, dens): 
    ###### driver
    result_path_driver = result_path + '/driver'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'driver_{num_row}x{num_col}'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    [cells, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                               weight_bit_width, input_bit_width, std_cell_lib, 
                                               dens, module_type = "driver") 
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # print wirelength
    print("wirelength of driver = ", wirelength(nets, cells, pins, gamma))
    # make dir
    if not os.path.exists(result_path_driver):
        os.makedirs(result_path_driver)
    # save placed cells
    cells_dump = {}
    for key, value in cells.items(): 
        cells_dump[key] = [value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]]
    with open(result_path_driver + '/cells.json', 'w') as f:
        f.write(json.dumps(cells_dump))
    # save nets
    with open(result_path_driver + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_driver + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_driver + '/area.json', 'w') as f:
        f.write(json.dumps(area))   
    # viz
    save_path = result_path_driver + f'/placement.png'
    text = 'placement'
    coordinates = []
    widths = []
    heights = []
    labels = []
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)


def place_driver_b(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                   site_width, row_height, result_path, potential_type, dens): 
    ###### driver_b
    result_path_driver_b = result_path + '/driver_b'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'driver_b_{num_row}x{num_col}'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    [cells, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                               weight_bit_width, input_bit_width, std_cell_lib, 
                                               dens, module_type = "driver_b") 
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # # print wirelength
    print("wirelength of driver_b = ", wirelength(nets, cells, pins, gamma))
    # make dir
    if not os.path.exists(result_path_driver_b):
        os.makedirs(result_path_driver_b)
    # save placed cells
    cells_dump = {}
    for key, value in cells.items(): 
        cells_dump[key] = [value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]]
    with open(result_path_driver_b + '/cells.json', 'w') as f:
        f.write(json.dumps(cells_dump))
    # save nets
    with open(result_path_driver_b + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_driver_b + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_driver_b + '/area.json', 'w') as f:
        f.write(json.dumps(area))   
    # viz
    save_path = result_path_driver_b + f'/placement.png'
    text = 'placement'
    coordinates = []
    widths = []
    heights = []
    labels = []
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)


def place_control(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                  site_width, row_height, result_path, potential_type, dens): 
    ###### control unit
    result_path_control = result_path + '/control'
    for key, value in std_cell_lib.items(): 
        std_cell_lib[key] = [value[0], value[1], 0]
    top_module_name = f'control_for_{input_bit_width}bit_input'
    verilog_file = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/frontend/verilog_file/sub_modules/flatten/'+ top_module_name + '_flatten.v'
    # init
    [cells_init, nets, pins, area, bin_size, bins] = init(verilog_file, top_module_name, num_row, num_col, 
                                                    weight_bit_width, input_bit_width, std_cell_lib, 
                                                    dens, module_type = 'control')
    # # save area
    # area[1][0] = round(area[1][0]/site_width)*site_width
    # area[1][1] = round(area[1][1]/row_height)*row_height
    # with open(result_path_control + '/area.json', 'w') as f:
    #     f.write(json.dumps(area))   
    # gamma for wirelength smooth
    gamma = 0.01 * math.sqrt(area[1][0]*area[1][1])
    # init lambda_0
    gradient_wirelength(nets, cells_init, pins, gamma)
    sum_gradient_wirelength = sum(abs(value[2][0]) for value in cells_init.values()) + sum(abs(value[2][1]) for value in cells_init.values())
    for value in cells_init.values():
        value[2][0] = 0
        value[2][1] = 0
    # gradient_potential_penalty
    gradient_potential_penalty(bins, bin_size, cells_init, std_cell_lib, potential_type, dens, lam = 1, pre_placed = 0)
    sum_gradient_potential_penalty = sum(abs(value[2][0]) for value in cells_init.values()) + sum(abs(value[2][1]) for value in cells_init.values())
    for value in cells_init.values():
        value[2][0] = 0
        value[2][1] = 0
    # lambda
    lam = sum_gradient_wirelength / sum_gradient_potential_penalty * 2
    ## iteration for lambda
    overflow_ratio = 1
    i = 0
    while overflow_ratio > 0.05 and i < 5: 
        cells = copy.deepcopy(cells_init)
        print(f"lambda_{i} = ", lam)
        result_path_lambda = result_path_control + f'/lambda_{i}'
        momentum(area, cells, nets, pins, bin_size, bins, std_cell_lib, potential_type, dens, gamma, lam, result_path_lambda)
        overflow_ratio = calc_overflow_ratio(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
        print(f"overflow_ratio_{i} = ", overflow_ratio)
        [density_mat_norm, coef_mat] = calc_density_mat(bins, bin_size, cells, std_cell_lib, potential_type)
        bin_density_vector = np.sum(density_mat_norm, axis=1)
        density_map_path = result_path_lambda + '/density_map.png'
        density_map(area, bin_size, bins, bin_density_vector, density_map_path)
        lam = lam*2
        i += 1
    # save nets
    with open(result_path_control + '/nets.json', 'w') as f:
        f.write(json.dumps(nets))
    # save pins
    with open(result_path_control + '/pins.json', 'w') as f:
        f.write(json.dumps(pins))
    # save area
    area[1][0] = round(area[1][0]/site_width)*site_width
    area[1][1] = round(area[1][1]/row_height)*row_height
    with open(result_path_control + '/area.json', 'w') as f:
        f.write(json.dumps(area)) 
    # print wirelength
    print("wirelength after global placement = ", wirelength(nets, cells, pins, gamma)) 
    # legalization
    [greedy_cells, abacus_cells] = legalization(area, cells, bin_size, std_cell_lib, result_path_control)
    # print wirelength
    print("wirelength after greedy legalization = ", wirelength(nets, greedy_cells, pins, gamma)) 
    print("wirelength after abacus legalization = ", wirelength(nets, abacus_cells, pins, gamma))
    

def place_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                     site_width, row_height, result_path, potential_type, dens, place_mode = 'all'): 
    if place_mode == 'all':
        place_sram_with_rw(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                           site_width, row_height, result_path, potential_type, dens)
        place_adder_tree(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                         site_width, row_height, result_path, potential_type, dens)
        place_decoder(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                      site_width, row_height, result_path, potential_type, dens)
        place_driver(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                     site_width, row_height, result_path, potential_type, dens)
        place_driver_b(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                       site_width, row_height, result_path, potential_type, dens)
        place_accumulator(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                          site_width, row_height, result_path, potential_type, dens)
        place_control(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                      site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'sram_with_rw':
        place_sram_with_rw(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                           site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'adder_tree':
        place_adder_tree(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                         site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'decoder':
        place_decoder(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                      site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'driver':
        place_driver(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                     site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'driver_b':
        place_driver_b(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                       site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'accumulator':
        place_accumulator(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                          site_width, row_height, result_path, potential_type, dens)
    elif place_mode == 'control':
        place_control(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                      site_width, row_height, result_path, potential_type, dens)


# dcim parameters
num_row = 2**6
num_col = 2**6
weight_bit_width = 4
input_bit_width = 4

# std_cell_lib
inverter = ['inverter', 0.38, 1.26, 0]  # 0.38
nand2 = ['nand2', 0.57, 1.26, 0]  # 0.57
nor2 = ['nor2', 0.57, 1.26, 0]  # 0.57
xor2 = ['xor2', 1.33, 1.26, 0]  # 1.33
mux_2_1 = ['mux_2_1', 1.71, 1.26, 0]  # 1.71
dcim_bitcell = ['dcim_bitcell', 1.52, 1.26, 0]  # 1.58
sram_rw = ['sram_rw', 1.52, 6.3, 0]  # 1.58
half_adder = ['half_adder', 2.09, 1.26, 0]  # area = 2.6334  # 2.09
full_adder = ['full_adder', 3.04, 1.26, 0]  # area = 3.8304  ## adder_28T  # 3.04
adder_sign_extension = ['adder_sign_extension', 2.66, 1.26, 0]  # area = 3.3516  # 2.66
dff = ['dff', 4.94, 1.26, 0]  # 5.01
filler = ['filler', 0.19, 1.26, 0]
tiel = ['tiel', 0.38, 1.26, 0]
tieh = ['tieh', 0.38, 1.26, 0]
buffer = ['buffer', 0.57, 1.26, 0]

std_cell_lists = [inverter, nand2, nor2, xor2, mux_2_1, dcim_bitcell, sram_rw, half_adder, full_adder, adder_sign_extension, dff, filler, tiel, tieh, buffer]
zip(*std_cell_lists)
std_cell_lib = {name: (width, height, num) for name, width, height, num in std_cell_lists}

# layout parameters
site_width = 0.19
row_height = 1.26

result_path = f'results/dcim_macro_{num_row}x{num_col}_for_{weight_bit_width}bitx{input_bit_width}bit/backend/sub_modules/placed_def_file'

potential_type = 'bell'

dens = 0.8

place_mode = 'control'

place_dcim_macro(num_row, num_col, weight_bit_width, input_bit_width, std_cell_lib, 
                 site_width, row_height, result_path, potential_type, dens, place_mode)
