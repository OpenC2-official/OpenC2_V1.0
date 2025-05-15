import numpy as np


def bell(distance, cell, bin): 
    a = 4 / (cell + bin*2) / (cell + bin*4)
    b = 2 / bin / (cell + bin*4)
    if distance < 0: 
        return "Error: distance < 0."
    elif 0 <= distance < cell/2 + bin:
        return 1 - a * (distance**2)
    elif cell/2 + bin <= distance < cell/2 + bin*2:
        return b * (distance - cell/2 - bin*2)**2
    else: 
        return float(0)


def gradient_bell(distance, cell, bin): 
    a = 4 / (cell + bin*2) / (cell + bin*4)
    b = 2 / bin / (cell + bin*4)
    if distance < 0: 
        return "Error: distance < 0."
    elif 0 <= distance < cell/2 + bin:
        return - 2 * a * distance
    elif cell/2 + bin <= distance < cell/2 + bin*2:
        return 2 * b * (distance - cell/2 - bin*2)
    else: 
        return float(0)


def sigmoid_base(x, alpha = 0.5): 
    t = alpha * x
    if t < -0.5: 
        return float(0)
    elif -0.5 <= t < 0:
        return 2*(t+0.5)**2
    elif 0 <= t < 0.5:
        return 1-2*(t-0.5)**2
    else: 
        return float(1)


def gradient_sigmoid_base(x, alpha = 0.5):
    t = alpha * x
    if -0.5 <= t < 0:
        return 4*alpha*(x+0.5)
    elif 0 <= t < 0.5:
        return -4*alpha*(x-0.5)
    else: 
        return float(0)
  

def sigmoid(distance, cell, bin):
    if cell < bin: 
        return sigmoid_base(bin/2+distance)*sigmoid_base(bin/2-distance)*cell
    else: 
        return sigmoid_base(cell/2+distance)*sigmoid_base(cell/2-distance)*bin


# def gradient_sigmoid(distance, cell, bin):
#     if cell < bin: 
#         return cell * (gradient_sigmoid_base(bin/2+distance)*sigmoid_base(bin/2-distance) - sigmoid_base(bin/2+distance)*gradient_sigmoid_base(bin/2-distance))
#     else: 
#         return bin * (gradient_sigmoid_base(cell/2+distance)*sigmoid_base(cell/2-distance) - sigmoid_base(cell/2+distance)*gradient_sigmoid_base(cell/2-distance))


def gradient_sigmoid(distance, cell, bin):
    if cell < bin: 
        return cell * (gradient_sigmoid_base(bin/2-distance))
    else: 
        return bin * (gradient_sigmoid_base(cell/2-distance))


def expected_potential_bin(density, bin_size, pre_placed = 0):
    return density * (bin_size[0] * bin_size[1] - pre_placed)


def calc_density_mat(bins, bin_size, cells, std_cell_lib, potential_type):
    if potential_type == 'bell':
        density = np.vectorize(bell)
    elif potential_type == 'sigmoid':
        density = np.vectorize(sigmoid)
    else: 
        print("Error: Unexpected potential type of potential function.")
    # matrix size
    num_row_mat = len(bins)
    num_col_mat = len(cells)
    # distance x/y matrix
    cell_center_x = [(value[1][0] + std_cell_lib[value[0]][0]/2) for value in cells.values()]
    cell_center_y = [(value[1][1] + std_cell_lib[value[0]][1]/2) for value in cells.values()]
    bin_center_x = [(bin[0] + bin_size[0]/2) for bin in bins]
    bin_center_y = [(bin[1] + bin_size[1]/2) for bin in bins]
    distance_mat_x = np.abs(np.tile(cell_center_x, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_x, (-1, 1)), (1, num_col_mat)))
    distance_mat_y = np.abs(np.tile(cell_center_y, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_y, (-1, 1)), (1, num_col_mat)))
    # cell width/height matrix
    cell_width = [std_cell_lib[value[0]][0] for value in cells.values()]
    cell_height = [std_cell_lib[value[0]][1] for value in cells.values()]
    cell_width_mat = np.tile(cell_width, (num_row_mat, 1))
    cell_height_mat = np.tile(cell_height, (num_row_mat, 1))
    # bin width/height matrix
    bin_width_mat = np.full((num_row_mat, num_col_mat), bin_size[0])
    bin_height_mat = np.full((num_row_mat, num_col_mat), bin_size[1])
    # calculate density matrix
    density_mat_x = density(distance_mat_x, cell_width_mat, bin_width_mat)
    density_mat_y = density(distance_mat_y, cell_height_mat, bin_height_mat)
    density_mat = density_mat_x * density_mat_y
    # coefficient matrix
    cell_area = np.array(cell_width) * np.array(cell_height)
    cell_density_vector = np.sum(density_mat, axis=0)
    coef_vector = cell_area / cell_density_vector
    coef_mat = np.tile(coef_vector, (num_row_mat, 1))

    # normalize density matrix
    density_mat_norm = density_mat * coef_mat
    return [density_mat_norm, coef_mat]


def potential_penalty(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0):
    # density of bins
    [density_mat_norm, coef_mat] = calc_density_mat(bins, bin_size, cells, std_cell_lib, potential_type)
    bin_density_vector = np.sum(density_mat_norm, axis=1)
    # potential penalty
    potential_penalty = np.sum(np.square(bin_density_vector - expected_potential_bin(dens, bin_size, pre_placed)))
    return potential_penalty


def gradient_potential_penalty(bins, bin_size, cells, std_cell_lib, potential_type, dens, lam, pre_placed = 0):
    if potential_type == 'bell':
        density = np.vectorize(bell)
        gradient_density = np.vectorize(gradient_bell)
    elif potential_type == 'sigmoid':
        density = np.vectorize(sigmoid)
        gradient_density = np.vectorize(gradient_sigmoid)
    else: 
        print("Error: Unexpected potential type of potential function.")
    # matrix size
    num_row_mat = len(bins)
    num_col_mat = len(cells)
    # distance x/y matrix
    cell_center_x = [(value[1][0] + std_cell_lib[value[0]][0]/2) for value in cells.values()]
    cell_center_y = [(value[1][1] + std_cell_lib[value[0]][1]/2) for value in cells.values()]
    bin_center_x = [(bin[0] + bin_size[0]/2) for bin in bins]
    bin_center_y = [(bin[1] + bin_size[1]/2) for bin in bins]
    distance_mat_x = np.abs(np.tile(cell_center_x, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_x, (-1, 1)), (1, num_col_mat)))
    distance_mat_y = np.abs(np.tile(cell_center_y, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_y, (-1, 1)), (1, num_col_mat)))
    # cell width/height matrix
    cell_width = [std_cell_lib[value[0]][0] for value in cells.values()]
    cell_height = [std_cell_lib[value[0]][1] for value in cells.values()]
    cell_width_mat = np.tile(cell_width, (num_row_mat, 1))
    cell_height_mat = np.tile(cell_height, (num_row_mat, 1))
    # bin width/height matrix
    bin_width_mat = np.full((num_row_mat, num_col_mat), bin_size[0])
    bin_height_mat = np.full((num_row_mat, num_col_mat), bin_size[1])
    # calculate density matrix
    density_mat_x = density(distance_mat_x, cell_width_mat, bin_width_mat).astype(float)
    density_mat_y = density(distance_mat_y, cell_height_mat, bin_height_mat).astype(float)
    density_mat = density_mat_x * density_mat_y
    # # calculate gradient matrix
    gradient_density_mat_x = gradient_density(distance_mat_x, cell_width_mat, bin_width_mat)
    gradient_density_mat_y = gradient_density(distance_mat_y, cell_height_mat, bin_height_mat)
    # coefficient matrix
    cell_area = np.array(cell_width) * np.array(cell_height)
    cell_density_vector = np.sum(density_mat, axis=0)
    coef_vector = cell_area / cell_density_vector
    coef_mat = np.tile(coef_vector, (num_row_mat, 1))

    # normalize density matrix
    density_mat_norm = coef_mat * density_mat 
    # calculate gradient density matrix
    gradient_density_mat_x = coef_mat * gradient_density(distance_mat_x, cell_width_mat, bin_width_mat) * density(distance_mat_y, cell_height_mat, bin_height_mat)
    gradient_density_mat_y = coef_mat * density(distance_mat_x, cell_width_mat, bin_width_mat) * gradient_density(distance_mat_y, cell_height_mat, bin_height_mat)
    
    # calculate gradient potential penalty vector
    bin_density_vector = np.sum(density_mat_norm, axis=1)
    outer_gradient_mat = np.tile(2 * np.reshape((bin_density_vector - expected_potential_bin(dens, bin_size, pre_placed)), (-1, 1)), (1, num_col_mat))
    gradient_distance_mat_x = np.where((np.tile(cell_center_x, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_x, (-1, 1)), (1, num_col_mat))) > 0, 1, -1)
    gradient_distance_mat_y = np.where((np.tile(cell_center_y, (num_row_mat, 1)) - np.tile(np.reshape(bin_center_y, (-1, 1)), (1, num_col_mat))) > 0, 1, -1)
    gradient_potential_penalty_vector_x = np.sum(outer_gradient_mat * gradient_density_mat_x * gradient_distance_mat_x, axis=0)
    gradient_potential_penalty_vector_y = np.sum(outer_gradient_mat * gradient_density_mat_y * gradient_distance_mat_y, axis=0)
    # update cell gradient
    for key, gradient_x, gradient_y in zip(cells.keys(), gradient_potential_penalty_vector_x, gradient_potential_penalty_vector_y):
        cells[key][2][0] += lam * gradient_x
        cells[key][2][1] += lam * gradient_y
    return [gradient_potential_penalty_vector_x, gradient_potential_penalty_vector_y]


def calc_overflow_ratio(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0):
    # overflow area
    [density_mat_norm, coef_mat] = calc_density_mat(bins, bin_size, cells, std_cell_lib, potential_type)
    bin_density_vector = np.sum(density_mat_norm, axis=1)
    overflow_vector = bin_density_vector - expected_potential_bin(dens, bin_size, pre_placed)
    positive_mask = np.where(overflow_vector > 0, 1, 0)
    overflow_area = np.sum(overflow_vector * positive_mask)
    # ttl movable area
    ttl_movable_area = 0
    ttl_movable_area = sum([value[0]*value[1]*value[2] for value in std_cell_lib.values()])
    # overflow ratio
    overflow_ratio = overflow_area / ttl_movable_area
    return overflow_ratio
