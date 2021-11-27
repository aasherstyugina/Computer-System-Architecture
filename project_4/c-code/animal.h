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

// Ввод параметров обобщенного животного из файла.
int In(animal* anim, FILE* input) {
    char n[1001];
    int input_info = fscanf(input, "%s\n", n);
    if (input_info != 1) {
        printf("Wrong animal name!\n");
        return 1;
    }
    int w;
    input_info = fscanf(input, "%d\n", &w);
    if (input_info != 1) {
        printf("Wrong animal weight!");
        return 1;
    }
    anim->name = (char*)malloc(1001);
    strcpy(anim->name, n);
    anim->weight = w;
    int i = -1;
    fscanf(input, "%d\n", &i);
    switch (i) {
        case 0:
            anim->k = animal::BEAST;
            return In(&anim->bst, input);
        case 1:
            anim->k = animal::FISH;
            return In(&anim->fsh, input);
        case 2:
            anim->k = animal::BIRD;
            return In(&anim->brd, input);
        default:
            return 1;
    }
}

// Случайный ввод обобщенного животного.
void InRnd(animal* anim) {
    anim->name = (char*)malloc(1001);
    strcpy(anim->name,RandName());
    anim->weight = Rand(1,5000);
    int i = Rand(0,3);
    switch (i) {
        case 0:
            anim->k = animal::BEAST;
            InRnd(&anim->bst);
            break;
        case 1:
            anim->k = animal::FISH;
            InRnd(&anim->fsh);
            break;
        case 2:
            anim->k = animal::BIRD;
            InRnd(&anim->brd);
            break;
    }
}

float CountQuotient(char* name, int weight) {
    int sum = 0;
    for (int i = 0; i < sizeof(name); i++) {
        sum += name[i];
    }
    float result = (sum+0.0) / weight;
    return result;    
}

//------------------------------------------------------------------------------
// Вывод параметров текущего животного в поток.
void Out(const animal* anim, FILE* output) {
    switch (anim->k) {
        case animal::BEAST:
            fprintf(output, "It is a beast: name = %s, weight = %d, type = %s, function result = %f.\n",
                    anim->name, anim->weight, GetName(anim->bst.t), CountQuotient(anim->name, anim->weight));
            break;
        case animal::FISH:
            fprintf(output, "It is a fish: name = %s, weight = %d, area = %s, function result = %f.\n",
                    anim->name, anim->weight, GetName(anim->fsh.ar), CountQuotient(anim->name, anim->weight));
            break;
        case animal::BIRD:
            fprintf(output, "It is a bird: name = %s, weight = %d, migration = %s, function result = %f.\n",
                    anim->name, anim->weight, GetName(anim->brd.migration), CountQuotient(anim->name, anim->weight));
            break;
        default:
            printf("Incorrect animal type!\n");
    }
}

#endif //PROJECT_ANIMAL_H
