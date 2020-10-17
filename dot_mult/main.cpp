#include <iostream>
#include <cstdlib>
#include <vector>
#include <array>

#define WIDTH  4
#define HEIGTH 4

template <class T>
void print_array (std::array<std::array<T, HEIGTH>, WIDTH> &c)
{
    for (auto i = 0; i < HEIGTH; i++) {
        for (auto j = 0; j < WIDTH; j++) {
            std::cout << "[" << i  << "]" << "[" << j  <<"] = " << c[i][j] << " ";
        }
        std::cout << '\n';
    }
    std::cout << '\n';
}

template <typename T>
void print_vector (std::vector<T> &v)
{
    for (const auto &it: v)
        std::cout << it << " ";
    std::cout << std::endl;
}

int main ()
{
    // Input values to run the matrix multiplication
    std::vector<double> dot {0.0, 3.0, 6.0, 9.0};
    std::array<std::array<double, HEIGTH>, WIDTH> m {{
        {{ 0.0,  2.0,  4.0,  6.0}},
        {{ 8.0, 10.0, 12.0, 14.0}},
        {{16.0, 18.0, 20.0, 22.0}},
        {{24.0, 26.0, 28.0, 30.0}}
    }};

    // Storing the result
    double val {};
    std::vector<double> result {};

    // To show the actual values
    std::cout << "*** Vector:  ***\n";
    print_vector<double> (dot);

    // This for the matrix
    std::cout << "** Matrix: ***\n";
    print_array<double> (m);
    // Execute the computation
    for (auto i = 0; i < HEIGTH; i++) {
        val = 0;
        for (auto j = 0; j < WIDTH; j++) {
	    val += m[i][j] * dot[j];
        }
        result.push_back(val);
    }
    std::cout << "Results = ";
    print_vector (result);
    std::cout << '\n';

    return EXIT_SUCCESS;
}
