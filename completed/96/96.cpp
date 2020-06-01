#include <iostream>
#include <fstream>
#include <string>

// std::fstream file("96_data.txt");
// std::string line;
// while (file >> line) {
//     std::cout <<  line << std::endl;   
// }
// file.close();

// int grid1[9][9];

bool possible(int y, int x, int n, int grid[9][9]) {
    // check row
    for (int i = 0; i < 9; i++) {
        if (grid[y][i] == n) { 
            return false;
        }
    }
    // check column
    for (int i = 0; i < 9; i++) {
        if (grid[i][x] == n) { 
            return false;
        }
    }
    // check square
    int cornerX = (x / 3) * 3;
    int cornerY = (y / 3) * 3;
    for (int j = 0; j < 3; j++) {
        for (int i = 0; i < 3; i++) {
            if (grid[cornerY+j][cornerX+i] == n) {
                return false;
            }
        }
    }
    return true;
}

int solve(int grid[9][9]) {
    for (int y = 0; y < 9; y++) {
        for (int x = 0; x < 9; x++) {
            if (grid[y][x] == 0) {
                for (int n = 1; n < 10; n++) {
                    if (possible(y, x, n, grid)) {
                        grid[y][x] = n;
                        solve(grid);
                        grid[y][x] = 0;
                    }
                }
                return 0;
            }
        }
    }
}


int main() {

    int grid[9][9]={{5,3,0,0,7,0,0,0,0},
                    {6,0,0,1,9,5,0,0,0},
                    {0,9,8,0,0,0,0,6,0},
                    {8,0,0,0,6,0,0,0,3},
                    {4,0,0,8,0,3,0,0,1},
                    {7,0,0,0,2,0,0,0,6},
                    {0,6,0,0,0,0,2,8,0},
                    {0,0,0,4,1,9,0,0,5},
                    {0,0,0,0,8,0,0,7,9}};


    // solve(grid);
    int (*ans)[9][9]  = &grid;
    // bool tf = possible(0, 3, 7, grid);

    std::cout << *ans << std::endl;

}