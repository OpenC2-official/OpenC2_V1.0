import os
import shutil
import sys
import numpy as np
from wirelength import gradient_wirelength
from wirelength import wirelength
from density import gradient_potential_penalty
from density import potential_penalty
from density import calc_overflow_ratio
from visualization import viz
from visualization import generate_gif

def momentum(area, cells, nets, pins, bin_size, bins, std_cell_lib, potential_type, dens, gamma, lam, result_path, 
             pre_placed=0, step_0=4, alpha=0.01, beta=0.9, max_iter=50, tol=0.01):
    # boundary
    left_boundary = area[0][0]
    right_boundary = area[0][0] + area[1][0]
    upper_boundary = area[0][1] + area[1][1]
    lower_boundary = area[0][1]
    if not os.path.exists(result_path):
        os.makedirs(result_path)
    # open the output file
    sys.stdout = open(result_path + '/placement.txt', 'w')
    # visualization
    coordinates = []
    widths = []
    heights = []
    labels = []
    if not os.path.exists(result_path + '/images'):
        os.makedirs(result_path + '/images')
    image_paths = []
    # visualization_0
    for key, value in cells.items():
        coordinates.append(value[1])
        widths.append(std_cell_lib[value[0]][0])
        heights.append(std_cell_lib[value[0]][1])
        labels.append(key)
    
    # print result
    text = 'initialization: '
    print(text)
    wire_length = wirelength(nets, cells, pins, gamma)
    print("wirelength_0 = ", wire_length)
    objective = wire_length + lam * potential_penalty(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
    print("objective_0 = ", objective)
    overflow_ratio = calc_overflow_ratio(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
    print(f"overflow_ratio_0 = ", overflow_ratio, '\n')

    # visualization
    save_path = result_path + '/images/iteration_0.png'
    viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)
    image_paths.append(save_path)
    

    # iteration
    for i in range(max_iter):

        gradient_wirelength(nets, cells, pins, gamma)
        gradient_potential_penalty(bins, bin_size, cells, std_cell_lib, potential_type, dens, lam, pre_placed)
                    
        grad = []
        for key, value in cells.items():
            # gradient vector
            grad.append(value[2][0])
            grad.append(value[2][1])
        if i == 0:
            beta = np.dot(np.transpose(grad), np.array(grad))
        else:
            beta = np.dot(np.transpose(grad), np.array(grad) - np.array(grad_previous)) / np.dot(np.transpose(grad_previous), grad_previous)
        grad_previous = grad

        momentum = []
        for key, value in cells.items():
            # update momentum
            value[3][0] = beta * value[3][0] - value[2][0]
            value[3][1] = beta * value[3][1] - value[2][1]
            # momentum vector
            momentum.append(value[3][0])
            momentum.append(value[3][1])
        step = step_0/np.linalg.norm(momentum)

        ## 没用，弃用
        # momentum_x = []
        # momentum_y = []
        # for key, value in cells.items():
        #     # update momentum
        #     value[3][0] = beta * value[3][0] - value[2][0]
        #     value[3][1] = beta * value[3][1] - value[2][1]
        #     # momentum vector
        #     momentum_x.append(value[3][0])
        #     momentum_y.append(value[3][1])
        # step_x = step_0/np.linalg.norm(momentum_x)
        # step_y = step_0/np.linalg.norm(momentum_y)

        for key, value in cells.items():
            # update position
            value[1][0] = max(left_boundary, min(right_boundary - std_cell_lib[value[0]][0], value[1][0] + step*value[3][0]))
            value[1][1] = max(lower_boundary, min(upper_boundary - std_cell_lib[value[0]][1], value[1][1] + step*value[3][1]))
            # visualization
            coordinates.append(value[1])
            widths.append(std_cell_lib[value[0]][0])
            heights.append(std_cell_lib[value[0]][1])
            labels.append(key)
            # clear gradient
            value[2][0] = 0
            value[2][1] = 0

        objective_previous = objective

        # print result
        text = f'iteration {i}: '
        print(text)
        wire_length = wirelength(nets, cells, pins, gamma)
        print("wirelength_0 = ", wire_length)
        objective = wire_length + lam * potential_penalty(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
        print("objective_0 = ", objective)
        overflow_ratio = calc_overflow_ratio(bins, bin_size, cells, std_cell_lib, potential_type, dens, pre_placed = 0)
        print(f"overflow_ratio_{i} = ", overflow_ratio, '\n')

        # visualization
        save_path = result_path + f'/images/iteration_{i+1}.png'
        viz(coordinates, widths, heights, area, bin_size, labels, text, save_path)
        image_paths.append(save_path)

        # stop iteration
        if i > 1 and objective > objective_previous: 
            break

    # generate gif
    generate_gif(image_paths, result_path + '/placement' + '.gif', duration=200)
    # save the first image
    first_image_path = image_paths[0]
    new_image_path = os.path.join(result_path, os.path.basename(first_image_path))
    shutil.move(first_image_path, new_image_path)
    # save the last image
    last_image_path = image_paths[-1]
    new_image_path = os.path.join(result_path, os.path.basename(last_image_path))
    shutil.move(last_image_path, new_image_path)
    # delete all the images
    shutil.rmtree(result_path + '/images')
    # close the output file
    sys.stdout.close()
    sys.stdout = sys.__stdout__