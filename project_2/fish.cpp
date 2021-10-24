//------------------------------------------------------------------------------
// beast.cpp - содержит функции обработки рыбы.
//------------------------------------------------------------------------------

#include "fish.h"

//------------------------------------------------------------------------------
// Конструктор объекта.
fish::fish(char n[1001], int w, int index): animal(n, w) {
    switch (index) {
        case 0:
            ar = fish::RIVER;
            break;
        case 1:
            ar = fish::SEA;
            break;
        case 2:
            ar = fish::LAKE;
            break;
    }
}

// Вывод параметров объекта в файл - переопределенный метод.
void fish::Out(FILE *output) {
    fprintf(output, "It is a fish: name = %s, weight = %d, area = %s, function result = %f.\n",
            GetName(), GetWeight(), GetArea(), CountQuotient());
}

// Вывод сгенерированных параметров в входной файл - переопределенный метод.
void fish::OutGenerated(FILE *input_g) {
    fprintf(input_g, "%s\n%d\n1\n%d\n",
            GetName(), GetWeight(), ar);
}

// Получение значений приватных полей.
char *fish::GetArea() {
    char* fish_area[] = { "RIVER", "SEA", "LAKE" };
    return  fish_area[ar];
}