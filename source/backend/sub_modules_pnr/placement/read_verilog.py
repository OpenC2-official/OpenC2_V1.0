import os
from net_group import combine_lists
from net_group import find_group


def clean_verilog(verilog_file):
    with open(verilog_file, 'r') as file:
        lines = file.readlines()
    previous_line = ''
    processed_lines = ''
    for line in lines: 
        if line.strip().startswith('(') or line.strip().startswith('/*') :
            line = ''
        elif line.strip().startswith('.'):
            if previous_line:
                previous_line = previous_line.rstrip()
        processed_lines += previous_line.replace("[", "<").replace("]", ">")
        previous_line = line
    # processed_lines += previous_line
    processed_lines += previous_line.replace("[", "<").replace("]", ">")
    path, file_name = os.path.split(verilog_file)
    with open(path + '_cleaned/' + file_name[:-2] + '_cleaned.v', 'w') as file:
        file.write(''.join(processed_lines))


def verilog_symbol(char):
    symbol_list = [' ', '(', ')', ',', ';', '{', '}', '\\', '\n', '\t', '\r']
    if char in symbol_list:
        return 1
    else: 
        return 0


def read_verilog_line(line):
    line_len = len(line)
    token = ""
    tokens = []
    for i in range(line_len):
        c = line[i]
        if verilog_symbol(c): 
            if len(token) > 0: 
                tokens.append(token)
            token = ""
        else: 
            token += c
    if len(token) > 0: 
        tokens.append(token)
    return tokens


def get_modules_in_verilog(verilog_file):
    modules = []
    with open(verilog_file, 'r') as file:
        for line in file:
            tokens = read_verilog_line(line)
            if len(tokens) > 0:
                if tokens[0] == "//":
                    continue
                elif tokens[0] == "endmodule":
                    modules.append(module)
                elif tokens[0] == "module":
                    module = ["", [], [], []]    ## name, pins, nets, cells
                    module[0] = tokens[1]
                    net_groups = []
                elif tokens[0] == "assign":
                    for i in range(len(tokens)//2-1):
                        net_group = [tokens[i+1], tokens[i+len(tokens)//2+1]]
                        net_groups.append(net_group)
                elif tokens[0] in ["input", "output", "inout"]: 
                    module[1].append([tokens[1], tokens[0]])  # pin_name, direction
                elif tokens[0] == "wire": 
                    module[2].append(tokens[1])
                else: 
                    cell = ["", "", [], []]  ## name, type, pins, nets_connected
                    cell[0] = tokens[1]
                    cell[1] = tokens[0]
                    for i in range((len(tokens)-2)//2):
                        cell[2].append(tokens[2*i+2][1:])
                        cell[3].append(tokens[2*i+3])
                    module[3].append(cell)
    net_groups_combined = combine_lists(net_groups)
    return [modules, net_groups_combined]


def get_module_name(module):
    return module[0]


def get_module_pins(module):
    return module[1]


def get_module_nets(module):
    return module[2]


def get_module_cells(module):
    return module[3]


def get_module(module_name, modules):
    for module in modules:
        if module[0] == module_name:
            return module


def get_nets_and_pins(module, net_groups_combined): 
    nets = []
    # [cell_name, cell_type, cell_pin_list, net_connected_list]
    # (else … )
    module_cells = get_module_cells(module)    
    # net list 
    # (wire … )
    module_nets = get_module_nets(module)
    # pin_list
    # (input/output/inout … )
    module_pins = get_module_pins(module)
    # copy id list, for the net which connects more than one pin
    copy_id_list = []
    # for all pins, create the net connects the pin  
    for pin_id in range(len(module_pins)):
        # find if the pin belongs to any net group
        # [net_group, net_name]
        module_net_group = [find_group(module_pins[pin_id][0], net_groups_combined), module_pins[pin_id][0]]
        # if this pin does not belong to any net group，let it form its own group 
        if module_net_group[0] == None: 
            module_net_group = [[module_pins[pin_id][0]], module_pins[pin_id][0]]
        # assume this net (wire) is a new net
        new_net_flag = 1
        # new net?
        for net_id in range(len(nets)): 
            if nets[net_id][0][0] == module_net_group[0]:
                new_net_flag = 0
                # this pin already in one net before, so copy the net for this pin. 
                break
        # new net/not new net
        if new_net_flag == 1:    # for new net, create a new net
            net = []
            net.append(module_net_group)
        else:    # for not new net, just append the net already in the list
            net = nets[net_id]
            # this pin already in one net before, so copy the net for this pin. 
            copy_id_list.append([net_id, pin_id])
        # add the pin to this net
        # [pin_name]
        net.append([module_pins[pin_id][0]])       
        # append the net with the cell it connects
        for module_cell in module_cells:    # all the cells
            i = 0
            for cell_net in module_cell[3]:    # all the net_connected in the cell
                if cell_net == module_pins[pin_id][0]:  
                    # [cell_name, cell_type, cell_pin_name]
                    net.append([module_cell[0], module_cell[1], module_cell[2][i]])
                i += 1
        # for new net, add the new net to the net list
        if new_net_flag == 1: 
            nets.append(net)
        # update pin
        # [pin_name, direction, position, net_connect_name (pin_name)] 
        module_pins[pin_id] = [module_pins[pin_id][0], module_pins[pin_id][1], [0, 0], module_net_group[1]]
    # for all nets (wires)
    for module_net in module_nets: 
        # find the net group which this net (wire) belongs to
        # [net_group, net_name]
        module_net_group = [find_group(module_net, net_groups_combined), module_net]
        # if this net (wire) does not belong to any group，let it form its own group 
        if module_net_group[0] == None: 
            module_net_group = [[module_net], module_net]
        # assume this net (wire) is a new net
        new_net_flag = 1
        # new net?
        for net_id in range(len(nets)): 
            if nets[net_id][0][0] == module_net_group[0]:
                new_net_flag = 0
                break
        # new net/not new net
        if new_net_flag == 1:    # for new net, create a new net
            net = []
            net.append(module_net_group)
        else:    # for not new net, just append the net already in the list 
            net = nets[net_id]
        # append the net with the cell it connects
        for module_cell in module_cells:    # all the cells
            i = 0
            for cell_net in module_cell[3]:    # all the net_connected in the cell
                if cell_net == module_net:  
                    # [cell_name, cell_type, cell_pin_name]
                    net.append([module_cell[0], module_cell[1], module_cell[2][i]])
                i += 1
        # for new net, add the new net to the net list
        if new_net_flag == 1: 
            nets.append(net)
    # add copy net, for the net which connects more than one pin
    for copy_id in copy_id_list:  # copy_id = [net_id, pin_id]
        copy_net = nets[copy_id[0]].copy()
        # copy_net[0][1] = module_pins[copy_id[1]][0]
        copy_net[0] = [copy_net[0][0], module_pins[copy_id[1]][0]]
        nets.append(copy_net)
    # post-processing, rename, 
    # pin_name has the highest priority
    # if no pin, use the net that first appears as name
    nets_rename = []
    for net in nets:
        net_rename = net
        net_rename[0] = net[0][1]
        nets_rename.append(net_rename)
        
    return [nets_rename, module_pins]

