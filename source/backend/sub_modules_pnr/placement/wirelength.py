import numpy as np


def lse(x):
    # input: vector
    # output: float
    max_value = np.max(x)
    exp_sum = np.sum(np.exp(x - max_value))
    lse = np.log(exp_sum) + max_value
    return lse


def softmax(x):
    # input: vector
    # output: vector
    x = np.array(x)
    max_value = np.max(x)
    x -= max_value
    exp_x = np.exp(x)
    exp_sum = np.sum(exp_x)
    softmax = exp_x / exp_sum
    return softmax


def wirelength_net(net, cells, pins, gamma): 
    wirelength_net = 0
    pins_x = []
    pins_x_negative = []
    pins_y = []
    pins_y_negative = []
    for i in range(len(net)-1):
        if len(net[i+1]) == 3:    # for cell
            pins_x.append(cells[net[i+1][0]][1][0]/gamma)
            pins_x_negative.append(-cells[net[i+1][0]][1][0]/gamma)
            pins_y.append(cells[net[i+1][0]][1][1]/gamma)
            pins_y_negative.append(-cells[net[i+1][0]][1][1]/gamma)
        else:    # for pin 
            pins_x.append(pins[net[i+1][0]][1][0]/gamma)
            pins_x_negative.append(-pins[net[i+1][0]][1][0]/gamma)
            pins_y.append(pins[net[i+1][0]][1][1]/gamma)
            pins_y_negative.append(-pins[net[i+1][0]][1][1]/gamma)
    wirelength_net += gamma * (lse(pins_x) + lse(pins_x_negative) + lse(pins_y) + lse(pins_y_negative))
    return wirelength_net


def wirelength(nets, cells, pins, gamma): 
    wirelength = 0
    for net in nets: 
        wirelength += wirelength_net(net, cells, pins, gamma)
    return wirelength


def gradient_wirelength_net(net, cells, pins, gamma): 
    pins_x = []
    pins_x_negative = []
    pins_y = []
    pins_y_negative = []
    for i in range(len(net)-1):
        if len(net[i+1]) == 3:    # for cell
            pins_x.append(cells[net[i+1][0]][1][0]/gamma)
            pins_x_negative.append(-cells[net[i+1][0]][1][0]/gamma)
            pins_y.append(cells[net[i+1][0]][1][1]/gamma)
            pins_y_negative.append(-cells[net[i+1][0]][1][1]/gamma)
        else:    # for pin
            pins_x.append(pins[net[i+1][0]][1][0]/gamma)
            pins_x_negative.append(-pins[net[i+1][0]][1][0]/gamma)
            pins_y.append(pins[net[i+1][0]][1][1]/gamma)
            pins_y_negative.append(-pins[net[i+1][0]][1][1]/gamma)
    gradient_wirelength_net_x = softmax(pins_x)/gamma - softmax(pins_x_negative)/gamma
    gradient_wirelength_net_y = softmax(pins_y)/gamma - softmax(pins_y_negative)/gamma
    return [gradient_wirelength_net_x, gradient_wirelength_net_y]


def gradient_wirelength(nets, cells, pins, gamma): 
    for net in nets: 
        [gradient_wirelength_net_x, gradient_wirelength_net_y] = gradient_wirelength_net(net, cells, pins, gamma)
        for i in range(len(net)-1):
            if len(net[i+1]) == 3:    # for cell, only cells need to save the gradient, pins are fixed
                cells[net[i+1][0]][2][0] += gradient_wirelength_net_x[i]
                cells[net[i+1][0]][2][1] += gradient_wirelength_net_y[i]