# Tile Stacking Problem
A stable tower of height n is a tower consisting of exactly n tiles of unit height stacked vertically in such a way, that no bigger tile is placed on a smaller tile. 

We have infinite number of tiles of sizes 1, 2, …, m. The task is calculate the number of different stable tower of height n that can be built from these tiles, with a restriction that you can use at most k tiles of each size in the tower.

Note: Two tower of height n are different if and only if there exists a height h (1 <= h <= n), such that the towers have tiles of different sizes at height h.

Examples:



Input : n = 3, m = 3, k = 1.
Output : 1
Possible sequences: { 1, 2, 3}. 
Hence answer is 1.

Input : n = 3, m = 3, k = 2.
Output : 7
{1, 1, 2}, {1, 1, 3}, {1, 2, 2},
{1, 2, 3}, {1, 3, 3}, {2, 2, 3}, 
{2, 3, 3}.


# Noted
- n, m, k : 4 bits.
## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/Salem22/TileStackingProblem.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd TileStackingProblem
    $ code .
    ```
    Click on the toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if n = 3, m =3, k = 2, then y = 7:

    ```sh
    $ vsim work.tb
    ```
