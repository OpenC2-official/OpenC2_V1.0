import legalization.macro_legalize as macro_legalize
import legalization.greedy_legalize as greedy_legalize
import legalization.abacus_legalize as abacus_legalize
import legalization.legality_check as legality_check
import torch
from visualization import viz
import copy
import json

def legalization(area, cells, bin_size, std_cell_lib, result_path):
    
    pos_x = []
    pos_y = []
    size_x = []
    size_y = []
    labels = []

    i = 0
    for key, value in cells.items():
        pos_x.append(value[1][0])
        pos_y.append(value[1][1])
        size_x.append(std_cell_lib[value[0]][0])
        size_y.append(std_cell_lib[value[0]][1])
        labels.append(key)
        i += 1


    num_nodes = len(cells)
    print("num_nodes = ", num_nodes)


    # 初始化节点的初始位置和当前位置，每个节点有x和y两个坐标
    # 这里我们用具体的数值来初始化，例如：
    pos = torch.tensor(pos_x + pos_y, dtype=torch.float32)


    # 初始化节点的尺寸，每个节点有宽度和高度
    node_size_x = torch.tensor(size_x, dtype=torch.float32)
    node_size_y = torch.tensor(size_y, dtype=torch.float32)


    # 初始化节点权重
    # node_weights = torch.tensor(size_x, dtype=torch.float32)
    node_weights = torch.ones(num_nodes)


    # 假设没有区域限制，所以 flat_region_boxes, flat_region_boxes_start, 和 node2fence_region_map 为空
    flat_region_boxes = torch.empty((0, 4), dtype=torch.float32)  # 通常区域框是[x, y, width, height]
    flat_region_boxes_start = torch.empty(0, dtype=torch.int32)  # 区域起始索引
    node2fence_region_map = torch.empty(num_nodes, dtype=torch.int32)  # 节点到区域的映射


    # 布局边界
    xl, yl = area[0][0], area[0][1]  # 布局的左下角坐标
    xh, yh = area[0][0]+area[1][0], area[0][1]+area[1][1]  # 布局的右上角坐标
    print(xl, yl, xh, yh)


    # 站点宽度和行高
    site_width = 0.19
    row_height = 1.26

    # bin
    num_bins_x = 1  # 42
    num_bins_y = 1  # 14


    # 假设所有节点都是可移动的
    num_movable_nodes = num_nodes

    # 假设没有终端NIs和填充节点
    num_terminal_NIs = 0
    num_filler_nodes = 0

    # 创建MacroLegalize类的实例
    macro_legalizer = macro_legalize.MacroLegalize(
    node_size_x=node_size_x,
    node_size_y=node_size_y,
    node_weights=node_weights,
    flat_region_boxes=flat_region_boxes,
    flat_region_boxes_start=flat_region_boxes_start,
    node2fence_region_map=node2fence_region_map,
    xl=xl,
    yl=yl,
    xh=xh,
    yh=yh,
    site_width=site_width,
    row_height=row_height,
    num_bins_x=num_bins_x,
    num_bins_y=num_bins_y,
    num_movable_nodes=num_movable_nodes,
    num_terminal_NIs=num_terminal_NIs,
    num_filler_nodes=num_filler_nodes
    )

    # 创建GreedyLegalize类的实例
    greedy_legalizer = greedy_legalize.GreedyLegalize(
    node_size_x=node_size_x,
    node_size_y=node_size_y,
    node_weights=node_weights,
    flat_region_boxes=flat_region_boxes,
    flat_region_boxes_start=flat_region_boxes_start,
    node2fence_region_map=node2fence_region_map,
    xl=xl,
    yl=yl,
    xh=xh,
    yh=yh,
    site_width=site_width,
    row_height=row_height,
    num_bins_x=num_bins_x,
    num_bins_y=num_bins_y,
    num_movable_nodes=num_movable_nodes,
    num_terminal_NIs=num_terminal_NIs,
    num_filler_nodes=num_filler_nodes
    )

    # 创建AbacusLegalize类的实例
    abacus_legalizer = abacus_legalize.AbacusLegalize(
    node_size_x=node_size_x,
    node_size_y=node_size_y,
    node_weights=node_weights,
    flat_region_boxes=flat_region_boxes,
    flat_region_boxes_start=flat_region_boxes_start,
    node2fence_region_map=node2fence_region_map,
    xl=xl,
    yl=yl,
    xh=xh,
    yh=yh,
    site_width=site_width,
    row_height=row_height,
    num_bins_x=num_bins_x,
    num_bins_y=num_bins_y,
    num_movable_nodes=num_movable_nodes,
    num_terminal_NIs=num_terminal_NIs,
    num_filler_nodes=num_filler_nodes
    )

    legality = legality_check.LegalityCheck(
    node_size_x=node_size_x,
    node_size_y=node_size_y,
    flat_region_boxes=flat_region_boxes,
    flat_region_boxes_start=flat_region_boxes_start,
    node2fence_region_map=node2fence_region_map,
    xl=xl,
    yl=yl,
    xh=xh,
    yh=yh,
    site_width=site_width,
    row_height=row_height,
    scale_factor=1,
    num_terminals=0,
    num_movable_nodes=num_movable_nodes,
    )

    # print(pos)
    
    # # 调用MacroLegalize实例进行合法化
    # macro_legalized_pos = macro_legalizer(pos, pos)
    # # print(macro_legalized_pos)
    # save_path = result_path + f'/macro_legalization.png'
    # text = 'macro_legalization'
    # macro_coordinates = []
    # for i in range(num_nodes):
    #     macro_coordinates.append([macro_legalized_pos[i], macro_legalized_pos[i+num_nodes]])
    # viz(macro_coordinates, size_x, size_y, area, bin_size, labels, text, save_path)

    # 调用GreedyLegalize实例进行合法化
    greedy_legalized_pos = greedy_legalizer(pos, pos)
    # legal = legality(greedy_legalized_pos)
    # if not legal: 
    #     print("legality check failed in greedy legalization, ")
    #     print("return illegal results after greedy legalization.")  
    # print(greedy_legalized_pos)


    save_path = result_path + f'/greedy_legalization.png'
    text = 'greedy_legalization'
    greedy_coordinates = []
    greedy_cells = {key: (value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]) 
                    for key, value in cells.items()}
    i = 0
    for key, value in greedy_cells.items():
        value[1][0] = float(greedy_legalized_pos[i])
        value[1][1] = float(greedy_legalized_pos[i+num_nodes])
        greedy_coordinates.append([float(greedy_legalized_pos[i]), float(greedy_legalized_pos[i+num_nodes])])
        i += 1
    # save placed cells
    with open(result_path + '/cells_greedy_legalization.json', 'w') as f:
        f.write(json.dumps(greedy_cells))
    # visulization
    viz(greedy_coordinates, size_x, size_y, area, bin_size, labels, text, save_path)


    # # 调用AbacusLegalize实例进行合法化
    abacus_legalized_pos = abacus_legalizer(pos, greedy_legalized_pos)
    # # legal = legality(abacus_legalized_pos)
    # # if not legal: 
    # #     print("legality check failed in abacus legalization, ")
    # #     print("return illegal results after greedy legalization.")  
    # # print(abacus_legalized_pos)

    save_path = result_path + f'/abacus_legalization.png'
    text = 'abacus_legalization'
    abacus_coordinates = []
    abacus_cells = {key: (value[0], [round(value[1][0]/site_width)*site_width, round(value[1][1]/row_height)*row_height]) 
                    for key, value in cells.items()} 
    i = 0
    for key, value in abacus_cells.items():
        value[1][0] = float(abacus_legalized_pos[i])
        value[1][1] = float(abacus_legalized_pos[i+num_nodes])
        abacus_coordinates.append([float(abacus_legalized_pos[i]), float(abacus_legalized_pos[i+num_nodes])])
        i += 1
    # save placed cells 
    with open(result_path + '/cells_abacus_legalization.json', 'w') as f:
        f.write(json.dumps(abacus_cells))
    # visulization
    viz(abacus_coordinates, size_x, size_y, area, bin_size, labels, text, save_path)

    return [greedy_cells, abacus_cells]

