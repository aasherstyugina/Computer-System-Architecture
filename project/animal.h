#ifndef PROJECT_ANIMAL_H
#define PROJECT_ANIMAL_H

//------------------------------------------------------------------------------
// animal.h - содержит описание обобщающего животного.
//------------------------------------------------------------------------------

#include "beast.h"
#include "fish.h"
#include "bird.h"

#include "string.h"

//------------------------------------------------------------------------------
// Структура, обобщающая всех имеющихся животных.
struct animal {
    // Общие для всех альтернативные переменные.
    char* name;
    int weight;
    // Значения ключей для каждого вида животных.
    enum key { BEAST, FISH, BIRD } k;
    // Используемые альтернативы. Используем простейшую реализацию.
    union {
        beast bst;
        fish fsh;
        bird brd;
    };
};

// Ввод обобщенного животного.
int In(animal* anim, FILE* input);

// Случайный ввод обобщенного животного.
void InRnd(animal* anim);

// Вывод обобщенной животного.
void Out(const animal* anim, FILE* output);

// Получение рандомного имени для животного.
const char* RandName(int index);

// Подсчет частного от деления суммы кодов символов названия на вес.
double CountQuotient(char* name, int weight);

#endif //PROJECT_ANIMAL_H
