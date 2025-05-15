##
# @file   abacus_legalize.py
# @author Yibo Lin
# @date   Jun 2018
#

import math
import torch
from torch import nn
from torch.autograd import Function

import legalization.abacus_legalize_cpp as abacus_legalize_cpp


class AbacusLegalizeFunction(Function):
    """ Legalize cells with abacus approach 
    """
    @staticmethod
    def forward(
        init_pos,
        pos,
        node_size_x,
        node_size_y,
        node_weights,
        flat_region_boxes,
        flat_region_boxes_start,
        node2fence_region_map,
        xl,
        yl,
        xh,
        yh,
        site_width,
        row_height,
        num_bins_x,
        num_bins_y,
        num_movable_nodes,
        num_terminal_NIs,
        num_filler_nodes
    ):
        if pos.is_cuda:
            output = abacus_legalize_cpp.forward(
                init_pos.view(init_pos.numel()).cpu(),
                pos.view(pos.numel()).cpu(),
                node_size_x.cpu(),
                node_size_y.cpu(),
                node_weights.cpu(),
                flat_region_boxes.cpu(),
                flat_region_boxes_start.cpu(),
                node2fence_region_map.cpu(),
                xl,
                yl,
                xh,
                yh,
                site_width,
                row_height,
                num_bins_x,
                num_bins_y,
                num_movable_nodes,
                num_terminal_NIs,
                num_filler_nodes
            ).cuda()
        else:
            output = abacus_legalize_cpp.forward(
                init_pos.view(init_pos.numel()),
                pos.view(pos.numel()),
                node_size_x,
                node_size_y,
                node_weights,
                flat_region_boxes,
                flat_region_boxes_start,
                node2fence_region_map,
                xl,
                yl,
                xh,
                yh,
                site_width,
                row_height,
                num_bins_x,
                num_bins_y,
                num_movable_nodes,
                num_terminal_NIs,
                num_filler_nodes
            )
        return output


class AbacusLegalize(object):
    """ Legalize cells with abacus approach 
    """

    def __init__(self, node_size_x, node_size_y, node_weights,
                 flat_region_boxes, flat_region_boxes_start, node2fence_region_map,
                 xl, yl, xh, yh, site_width, row_height, num_bins_x, num_bins_y, num_movable_nodes, num_terminal_NIs, num_filler_nodes):
        super(AbacusLegalize, self).__init__()
        self.node_size_x = node_size_x
        self.node_size_y = node_size_y
        self.node_weights = node_weights
        self.flat_region_boxes = flat_region_boxes
        self.flat_region_boxes_start = flat_region_boxes_start
        self.node2fence_region_map = node2fence_region_map
        self.xl = xl
        self.yl = yl
        self.xh = xh
        self.yh = yh
        self.site_width = site_width
        self.row_height = row_height
        self.num_bins_x = num_bins_x
        self.num_bins_y = num_bins_y
        self.num_movable_nodes = num_movable_nodes
        self.num_terminal_NIs = num_terminal_NIs
        self.num_filler_nodes = num_filler_nodes

    def __call__(self, init_pos, pos):
        """ 
        @param init_pos the reference position for displacement minization
        @param pos current roughly legal position
        """
        return AbacusLegalizeFunction.forward(
            init_pos,
            pos,
            node_size_x=self.node_size_x,
            node_size_y=self.node_size_y,
            node_weights=self.node_weights,
            flat_region_boxes=self.flat_region_boxes,
            flat_region_boxes_start=self.flat_region_boxes_start,
            node2fence_region_map=self.node2fence_region_map,
            xl=self.xl,
            yl=self.yl,
            xh=self.xh,
            yh=self.yh,
            site_width=self.site_width,
            row_height=self.row_height,
            num_bins_x=self.num_bins_x,
            num_bins_y=self.num_bins_y,
            num_movable_nodes=self.num_movable_nodes,
            num_terminal_NIs=self.num_terminal_NIs,
            num_filler_nodes=self.num_filler_nodes,
        )




# import torch

# # 假设有5个节点，每个节点有两个坐标 (x, y)
# num_nodes = 5

# # 初始化节点的初始位置和当前位置，每个节点有x和y两个坐标
# # 这里我们用具体的数值来初始化，例如：
# init_pos = torch.tensor([i for i in range(num_nodes * 2)], dtype=torch.float32)  # 从0到9
# pos = torch.tensor([i for i in range(num_nodes * 2)], dtype=torch.float32)  # 从0开始，每次乘以2

# # 初始化节点的尺寸，每个节点有宽度和高度
# # 假设每个节点的宽度和高度都是1.0
# node_size_x = torch.ones(num_nodes, dtype=torch.float32) * 5
# node_size_y = torch.ones(num_nodes, dtype=torch.float32) * 5

# # 初始化节点权重，这里我们简单地使用1.0作为所有节点的权重
# node_weights = torch.ones(num_nodes, dtype=torch.float32)

# # 假设没有区域限制，所以 flat_region_boxes, flat_region_boxes_start, 和 node2fence_region_map 为空
# flat_region_boxes = torch.empty((0, 4), dtype=torch.float32)  # 通常区域框是[x, y, width, height]
# flat_region_boxes_start = torch.empty(0, dtype=torch.int32)  # 区域起始索引
# node2fence_region_map = torch.empty(num_nodes, dtype=torch.int32)  # 节点到区域的映射

# # 布局边界
# xl, yl = 0, 0  # 布局的左下角坐标
# xh, yh = 10, 10  # 布局的右上角坐标

# # 站点宽度和行高
# site_width = 1.0
# row_height = 1.0

# # 假设我们在水平方向上分为2个bin，垂直方向上分为1个bin
# num_bins_x = 2
# num_bins_y = 1

# # 假设所有节点都是可移动的
# num_movable_nodes = num_nodes

# # 假设没有终端NIs和填充节点
# num_terminal_NIs = 0
# num_filler_nodes = 0

# # 创建AbacusLegalize类的实例
# abacus_legalizer = AbacusLegalize(
#     node_size_x=node_size_x,
#     node_size_y=node_size_y,
#     node_weights=node_weights,
#     flat_region_boxes=flat_region_boxes,
#     flat_region_boxes_start=flat_region_boxes_start,
#     node2fence_region_map=node2fence_region_map,
#     xl=xl,
#     yl=yl,
#     xh=xh,
#     yh=yh,
#     site_width=site_width,
#     row_height=row_height,
#     num_bins_x=num_bins_x,
#     num_bins_y=num_bins_y,
#     num_movable_nodes=num_movable_nodes,
#     num_terminal_NIs=num_terminal_NIs,
#     num_filler_nodes=num_filler_nodes
# )


# print(init_pos, pos)
# # 调用AbacusLegalize实例进行合法化
# legalized_pos = abacus_legalizer(init_pos, pos)
# print(init_pos, pos)
# print(legalized_pos)