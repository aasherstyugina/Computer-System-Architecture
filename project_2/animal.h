#ifndef PROJECT_ANIMAL_H
#define PROJECT_ANIMAL_H

//------------------------------------------------------------------------------
// animal.h - содержит описание обобщающего объекта животное.
//------------------------------------------------------------------------------

#include <stdio.h>
#include "string.h"

//------------------------------------------------------------------------------
// Класс объекта.
class animal{
private:
    // Общие для всех альтернативные переменные.
    char* name;
    int weight;

public:
    // Конструктор объекта.
    animal(char n[1001], int w);
    animal():animal(NULL,0){};

    // Тип объекта
    enum { BEAST, FISH, BIRD };

    // Ввод параметров объекта из файла.
    static animal* In(FILE* input);

    // Генерация объекта.
    static animal* InRnd();

    // Вывод параметров объекта в файл.
    virtual void Out(FILE* output) = 0;

    // Вывод сгенерированных параметров в входной файл.
    virtual void OutGenerated(FILE* output) = 0;

    // Подсчет значения функции для дальнейшей сортировки.
    double CountQuotient();

    // Получение значений приватных полей.
    char* GetName() { return name; }
    int GetWeight() { return weight; }

    // Деструктор объекта.
    virtual ~animal() = default;
};

#endif //PROJECT_ANIMAL_H
