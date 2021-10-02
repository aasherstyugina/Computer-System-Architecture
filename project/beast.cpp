//------------------------------------------------------------------------------
// beast.cpp - содержит функции обработки зверя.
//------------------------------------------------------------------------------

#include "beast.h"

//------------------------------------------------------------------------------
// Ввод параметров зверя из потока.
int In(beast* bst, FILE* input) {
    int i = -1;
    fscanf(input, "%d\n", &i);
    switch (i) {
        case 0:
            bst->t = beast::PREDATOR;
            return 0;
        case 1:
            bst->t = beast::HERBIVORE;
            return 0;
        case 2:
            bst->t = beast::INSECTIVOROUS;
            return 0;
        default:
            return 1;
    }
}

// Случайный ввод параметров зверя.
void InRnd(beast* bst) {
    int i = Rand(0,3);
    switch (i) {
        case 0:
            bst->t = beast::PREDATOR;
            break;
        case 1:
            bst->t = beast::HERBIVORE;
            break;
        case 2:
            bst->t = beast::INSECTIVOROUS;
            break;
    }
}

const char* GetName(beast::type index) {
    char* beast_types[] = {"PREDATOR", "HERBIVORE", "INSECTIVOROUS"};
    return  beast_types[index];
}
