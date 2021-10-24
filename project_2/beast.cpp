//------------------------------------------------------------------------------
// beast.cpp - содержит функции обработки зверя.
//------------------------------------------------------------------------------

#include "beast.h"

//------------------------------------------------------------------------------
// Конструктор объекта.
beast::beast(char n[1001], int w, int index): animal(n, w) {
    switch (index) {
        case 0:
            t = beast::PREDATOR;
            break;
        case 1:
            t = beast::HERBIVORE;
            break;
        case 2:
            t = beast::INSECTIVOROUS;
            break;
    }
}

// Вывод параметров объекта в файл - переопределенный метод.
void beast::Out(FILE *output) {
    fprintf(output, "It is a beast: name = %s, weight = %d, type = %s, function result = %f.\n",
            GetName(), GetWeight(), GetType(), CountQuotient());
}

// Вывод сгенерированных параметров в входной файл - переопределенный метод.
void beast::OutGenerated(FILE *input_g) {
    fprintf(input_g, "%s\n%d\n0\n%d\n",
            GetName(), GetWeight(), t);
}

// Получение значений приватных полей.
char *beast::GetType() {
    char* beast_types[] = {"PREDATOR", "HERBIVORE", "INSECTIVOROUS"};
    return  beast_types[t];
}