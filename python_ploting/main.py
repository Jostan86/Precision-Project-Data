import pandas
import matplotlib.pyplot as plt
import numpy as np
# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    data = pandas.read_excel("C:/Users/josta/OneDrive/Documents/_Documents/College/Grad school/Masters Project/Nitrogen Plots/python_ploting/Tree_data_2.xlsx")
    ax = plt.hist(data.N_2021, bins=34, range=(1.6, 3.0))

    for bar in ax[2]:
        # get x midpoint of bar
        x = bar.get_x() + 0.5 * bar.get_width()

        # set bar color based on x
        if x < 2.0:
            bar.set_color('orange')
        elif x > 2.4:
            bar.set_color('red')
        else:
            bar.set_color('green')

    print(name)

    # ax.xlim([1.7, 3.1])
    # ax.ylim([0, 25])
    plt.show()



# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
