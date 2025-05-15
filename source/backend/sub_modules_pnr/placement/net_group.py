class UnionFind:
    def __init__(self):
        self.parent = {}

    def find(self, x):
        if x not in self.parent:
            self.parent[x] = x
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            self.parent[root_y] = root_x

def combine_lists(pairs):
    uf = UnionFind()
    # 合并有共同元素的对
    for x, y in pairs:
        uf.union(x, y)

    # 创建一个字典来将元素映射到它们的根元素
    element_to_root = {}
    for x, _ in pairs:
        root_x = uf.find(x)
        if root_x not in element_to_root:
            element_to_root[root_x] = []
        element_to_root[root_x].append(x)
    for _, y in pairs:
        root_y = uf.find(y)
        if y not in element_to_root[root_y]:
            element_to_root[root_y].append(y)

    # 获取最终的组合列表
    combined = list(element_to_root.values())
    return combined

def find_group(element, combined_list):
    for group in combined_list:
        if element in group:
            return group
    return None  # 如果元素不在任何组中，则返回 None


# # 测试数据
# pairs = [['a', 'b'], ['c', 'd'], ['e', 'f'], ['g', 'h'], ['i', 'b'], ['d', 'f']]

# # 调用函数
# result = combine_lists(pairs)

# # 打印结果
# print(result)