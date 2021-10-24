//------------------------------------------------------------------------------
// beast.cpp - содержит функции обработки рыбы.
//------------------------------------------------------------------------------

#include "fish.h"

//------------------------------------------------------------------------------
// Ввод параметров рыбы из потока.
int In(fish* fsh, FILE* input) {
    int i = -1;
    fscanf(input, "%d\n", &i);
    switch (i) {
        case 0:
            fsh->ar = fish::RIVER;
            return 0;
        case 1:
            fsh->ar = fish::SEA;
            return 0;
        case 2:
            fsh->ar = fish::LAKE;
            return 0;
        default:
            return 1;
    }
}

// Случайный ввод параметров рыбы.
void InRnd(fish* fsh) {
    int i = Rand(0,3);
    switch (i) {
        case 0:
            fsh->ar = fish::RIVER;
            break;
        case 1:
            fsh->ar = fish::SEA;
            break;
        case 2:
            fsh->ar = fish::LAKE;
            break;
    }
}

const char* GetName(fish::area index) {
    char* fish_area[] = { "RIVER", "SEA", "LAKE" };
    return  fish_area[index];
}
