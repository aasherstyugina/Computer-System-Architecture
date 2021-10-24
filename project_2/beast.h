#ifndef PROJECT_BEAST_H
#define PROJECT_BEAST_H

//------------------------------------------------------------------------------
// beast.h - содержит описание объекта зверя.
//------------------------------------------------------------------------------

#include <stdio.h>
#include "rnd.h"
#include "animal.h"

//------------------------------------------------------------------------------
// Класс зверя с уникальным параметром - тип.
class beast: public animal{
private:
    // Тип зверя.
    enum type { PREDATOR, HERBIVORE, INSECTIVOROUS } t;

public:
    // Конструктор объекта.
    beast(char n[1001], int w, int index);
    beast():beast(NULL,0,0){};

    // Вывод параметров объекта в файл - переопределенный метод.
    void Out(FILE* output) override;

    // Вывод сгенерированных параметров в входной файл - переопределенный метод.
    void OutGenerated(FILE* input_g) override;

    // Получение значений приватных полей.
    char* GetType();
};

#endif //PROJECT_BEAST_H
