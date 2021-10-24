#ifndef PROJECT_BIRD_H
#define PROJECT_BIRD_H

//------------------------------------------------------------------------------
// bird.h - содержит описание птицы.
//------------------------------------------------------------------------------

#include "rnd.h"
#include "stdbool.h"
#include "animal.h"

//------------------------------------------------------------------------------
// Класс птицы с уникальным параметром - отношение к перелёту.
class bird: public animal {
private:
    // Отношение к перелёту.
    bool migration;

public:
    // Конструктор объекта.
    bird(char n[1001], int w, int index);
    bird():bird(NULL,0,0){};

    // Вывод параметров объекта в файл - переопределенный метод.
    void Out(FILE* output) override;

    // Вывод сгенерированных параметров в входной файл - переопределенный метод.
    void OutGenerated(FILE* input_g) override;

    // Получение значений приватных полей.
    char* GetMigration();
};

#endif //PROJECT_BIRD_H
