import matplotlib.pyplot as plt
import numpy as np
import os


def plot_and_save(file_name: str) -> None:
    """
    This function reads an XRD data file, plots the data, and saves the plot as a PNG image.

    Parameters:
    file_name (str): The name of the XRD data file. The file should be a text file with two columns:
                     the first column represents the 2θ angle, and the second column represents the intensity.

    Returns:
    None
    """
    data = np.loadtxt(file_name)

    x = data[:, 0]
    y = data[:, 1]

    plt.plot(x, y)

    plt.title(f"XRD of {file_name}")
    plt.xlabel("2θ (°)")
    plt.xlim(5, 40)
    plt.ylabel("Intensity (arbitrary units)")

    folder_path = "/home/jakob/ETH/Bachelor thesis/code/XRD_Analysis/Zeolites/graphs/"  # Specify your folder path

    plt.savefig(folder_path + file_name.replace(".xy", ".png"))
    plt.close()


def plot_all_files():
    plt.figure()

    for file_name in os.listdir("."):
        if file_name.endswith(".xy"):
            data = np.loadtxt(file_name)
            x = data[:, 0]
            y = data[:, 1]
            plt.plot(x, y, label=file_name)

    plt.title("XRD of all files")
    plt.xlabel("2θ (°)")
    plt.ylabel("Intensity (arbitrary units)")
    plt.legend()
    plt.savefig("combined_plot.png")
    plt.close()


def main():
    for file_name in os.listdir("."):
        if file_name.endswith(".xy"):
            plot_and_save(file_name)

    # plot_all_files()


if __name__ == "__main__":
    main()
