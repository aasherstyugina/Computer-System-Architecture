#ifndef PROJECT_FISH_H
#define PROJECT_FISH_H

//------------------------------------------------------------------------------
// fish.h - содержит описание рыбы.
//------------------------------------------------------------------------------

#include <stdio.h>
#include "rnd.h"
#include "animal.h"

//------------------------------------------------------------------------------
// Класс рыбы с уникальным параметром - место обитания.
class fish: public animal{
private:
    // Место обитания.
    enum area { RIVER, SEA, LAKE } ar;

public:
    // Конструктор объекта.
    fish(char n[1001], int w, int index);
    fish():fish(NULL,0,0){};

    // Вывод параметров объекта в файл - переопределенный метод.
    void Out(FILE* output) override;

    // Вывод сгенерированных параметров в входной файл - переопределенный метод.
    void OutGenerated(FILE* input_g) override;

    // Получение значений приватных полей.
    char* GetArea();
};

#endif //PROJECT_FISH_H
