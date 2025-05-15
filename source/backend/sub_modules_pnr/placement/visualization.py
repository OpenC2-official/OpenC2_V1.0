import matplotlib.pyplot as plt
import matplotlib.patches as patches
from PIL import Image
import numpy as np


def viz(coordinates, widths, heights, area, bin_size, labels = None, text = None, save_path = None):
    fig, ax = plt.subplots(dpi = 1000)
    for i in range(len(coordinates)):
        x, y = coordinates[i]
        width = widths[i]
        height = heights[i]
        # rect = patches.Rectangle((x, y), width, height, linewidth=1, edgecolor='purple', facecolor='violet')
        rect = patches.Rectangle((x, y), width, height, linewidth=0.2, edgecolor='purple', facecolor=(1, 0, 1, 0))
        ax.add_patch(rect)
        # if labels:
        #     label = labels[i]
        #     ax.text(x + width / 2, y + height / 2, label, ha='center', va='center', color='black', fontsize=1)
        if text:
            fig.text(0.05, 0.95, text, transform=fig.transFigure, ha='left', va='top', color='black', fontsize=16, weight='bold')
    ax.tick_params(axis='both', labelsize=4, length=1, width=0.5) 
    ax.set_xticks(np.linspace(area[0][0], area[0][0]+area[1][0], int(round(area[1][0]/bin_size[0], 0)+1)))
    ax.set_yticks(np.linspace(area[0][1], area[0][1]+area[1][1], int(round(area[1][1]/bin_size[1], 0)+1)))
    plt.gca().set_aspect('equal', adjustable='box')
    # # grid
    # plt.grid(True, linestyle='dashed')
    if save_path:
        plt.savefig(save_path)
        plt.close()
    else:
        plt.show()


def generate_gif(image_paths, output_path, duration=200):
    images = []
    for image_path in image_paths:
        image = Image.open(image_path)
        images.append(image)
    images[0].save(output_path, save_all=True, append_images=images[1:], optimize=False, duration=duration, loop=0)


def density_map(area, bin_size, bins, vector, save_path = None):
    fig, ax = plt.subplots(dpi = 1000)
    fig, ax = plt.subplots()
    ax.tick_params(axis='both', labelsize=4, length=2, width=1) 
    ax.set_xticks(np.linspace(area[0][0], area[0][0]+area[1][0], int(round(area[1][0]/bin_size[0], 0)+1)))
    ax.set_yticks(np.linspace(area[0][1], area[0][1]+area[1][1], int(round(area[1][1]/bin_size[1], 0)+1)))
    plt.gca().set_aspect('equal', adjustable='box')
    bin_num = [int(round(area[1][0]/bin_size[0], 0)), int(round(area[1][1]/bin_size[1], 0))]
    for i in range(bin_num[0]): 
        for j in range(bin_num[1]): 
            k = i*bin_num[1]+j
            plt.text(bins[k][0]+bin_size[0]/2, bins[k][1]+bin_size[1]/2, str(round(vector[k],2)), ha='center', va='center', fontsize=4)
    plt.grid(True, linestyle='dashed')
    if save_path:
        plt.savefig(save_path) 
        plt.close()
    else:
        plt.show()


