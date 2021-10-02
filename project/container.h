#ifndef PROJECT_CONTAINER_H
#define PROJECT_CONTAINER_H

//------------------------------------------------------------------------------
// container.h - содержит тип данных,
// представляющий простейший контейнер.
//------------------------------------------------------------------------------

#include "animal.h"

//------------------------------------------------------------------------------
// Простейший контейнер на основе одномерного массива.
struct container {
    static const int max_len = 10000; // максимальная длина
    int len; // текущая длина
    animal* cont[max_len];
};

// Инициализация контейнера.
container* Init();

// Очистка контейнера от элементов (освобождение памяти).
void Clear(container* c);

// Ввод содержимого контейнера из указанного потока.
int In(container* c, FILE* input);

// Случайный ввод содержимого контейнера.
int InRnd(container* c, int size, FILE* input_g);

// Вывод содержимого контейнера в указанный поток.
void Out(const container* c, FILE* output);

// Прямая сортировка выбором по убыванию.
void StraightSelection(container* c);

#endif //PROJECT_CONTAINER_H
