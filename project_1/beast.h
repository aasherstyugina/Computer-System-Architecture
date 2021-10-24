#ifndef PROJECT_BEAST_H
#define PROJECT_BEAST_H

//------------------------------------------------------------------------------
// beast.h - содержит описание зверя.
//------------------------------------------------------------------------------

#include <stdio.h>
#include "rnd.h"

//------------------------------------------------------------------------------
// Структура зверя с уникальным параметром - тип.
struct beast {
    enum type { PREDATOR, HERBIVORE, INSECTIVOROUS } t;
};

// Ввод параметров зверя из файла.
int In(beast* bst, FILE* input);

// Случайный ввод параметров зверя.
void InRnd(beast* bst);

// Получение названия зверя.
const char * GetName(beast::type index);

#endif //PROJECT_BEAST_H
