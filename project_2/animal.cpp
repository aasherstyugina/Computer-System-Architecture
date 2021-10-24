//------------------------------------------------------------------------------
// animal.cpp - содержит процедуры связанные с обработкой обобщенного животного
// и создания произвольного животного.
//------------------------------------------------------------------------------

#include "animal.h"
#include "beast.h"
#include "fish.h"
#include "bird.h"

//------------------------------------------------------------------------------
// Конструктор объекта.
animal::animal(char n[1001], int w) {
    name = (char*)malloc(1001);
    strcpy(name, n);
    weight = w;
}

// Ввод параметров объекта из файла.
animal* animal::In(FILE *input) {
        char n[1001];
        int input_info = fscanf(input, "%s\n", n);
        if (input_info != 1) {
            printf("Wrong animal name!\n");
            return NULL;
        }

        int w;
        input_info = fscanf(input, "%d\n", &w);
        if (input_info != 1) {
            printf("Wrong animal weight!\n");
            return NULL;
        }

        int i = -1;
        fscanf(input, "%d\n", &i);
        int index = -1;
        fscanf(input, "%d\n", &index);
        switch (i) {
            case BEAST:{
                return new beast(n,w,index);
            }
            case FISH:{
                return new fish(n,w,index);
            }
            case BIRD:{
                return new bird(n,w,index);
            }
            default:{
                printf("Wrong animal type!\n");
                return NULL;
            }
        }
}

// Генерация объекта.
animal* animal::InRnd() {
    char* n = RandName();
    int w = Rand(1,5000);
    int i = Rand(0,3);
    switch (i) {
        case 0:{
            int index = Rand(0,3);
            return new beast(n,w,index);
        }
        case 1:{
            int index = Rand(0,3);
            return new fish(n,w,index);
        }
        case 2:{
            int index = Rand(0,2);
            return new bird(n,w,index);
        }
    }
}

// Подсчет значения функции для дальнейшей сортировки.
double animal::CountQuotient() {
    int sum = 0;
    for (int i = 0; i < sizeof(name); i++) {
        sum += name[i];
    }
    double result = (sum+0.0) / weight;
    return result;
}