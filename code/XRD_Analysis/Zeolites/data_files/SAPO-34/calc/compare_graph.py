import matplotlib.pyplot as plt
import numpy as np
import os


def plot_xy_files():
    # List all .xy files in the current directory
    xy_files = [f for f in os.listdir(".") if f.endswith(".xy")]

    # Create subplots
    fig, axs = plt.subplots(nrows=len(xy_files), ncols=1, sharex=True, figsize=(8, 8))

    # Ensure axs is always a list, even if there's only one subplot
    if len(xy_files) == 1:
        axs = [axs]

    # Define the desired y-axis limits
    y_min, y_max = 0, 20000

    # Plot each .xy file on a different axis
    for i, file_name in enumerate(xy_files):
        data = np.loadtxt(file_name)
        x = data[:, 0]
        y = data[:, 1]

        axs[i].plot(x, y, label=file_name)
        axs[i].legend()
        axs[i].set_ylabel(f"Intensity {i+1}")
        axs[i].set_ylim(y_min, y_max)
        axs[i].axvline(
            x=9.5, color="red", linestyle="--", linewidth=1
        )  # Add vertical line
        axs[i].axvline(
            x=12.8, color="black", linestyle="--", linewidth=1
        )  # Add vertical line
        axs[i].axvline(
            x=16, color="blue", linestyle="--", linewidth=1
        )  # Add vertical line
        axs[i].axvline(
            x=20.5, color="green", linestyle="--", linewidth=1
        )  # Add vertical line
        axs[i].axvline(
            x=25.7, color="green", linestyle="--", linewidth=1
        )  # Add vertical line
        axs[i].axvline(
            x=30.5, color="violet", linestyle="--", linewidth=1
        )  # Add vertical line

    # Set the x-axis label for the last subplot
    axs[-1].set_xlabel("2θ (°)")

    # Show the plot
    plt.xlim(5, 40)
    plt.tight_layout()
    plt.savefig("SAPO-34_calc_combined.png")


if __name__ == "__main__":
    plot_xy_files()
