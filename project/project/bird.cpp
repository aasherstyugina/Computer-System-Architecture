//------------------------------------------------------------------------------
// bird.cpp - содержит функции обработки птицы.
//------------------------------------------------------------------------------

#include "bird.h"

//------------------------------------------------------------------------------
// Ввод параметров птицы из потока.
int In(bird* brd, FILE* input) {
    int i = -1;
    fscanf(input, "%d\n", &i);
    switch (i) {
        case 0:
            brd->migration = false;
            return 0;
        case 1:
            brd->migration = true;
            return 0;
        default:
            return 1;
    }
}

// Случайный ввод параметров птицы.
void InRnd(bird* brd) {
    int i = Rand(0,2);
    switch (i) {
        case 0:
            brd->migration = false;
            break;
        case 1:
            brd->migration = true;
            break;
    }
}

const char* GetName(int index) {
    char* bird_migration[] = { "FALSE", "TRUE" };
    return  bird_migration[index];
}
