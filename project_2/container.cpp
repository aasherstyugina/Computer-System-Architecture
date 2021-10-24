//------------------------------------------------------------------------------
// container.cpp - содержит функции обработки контейнера.
//------------------------------------------------------------------------------

#include "container.h"
#include "stdio.h"

//------------------------------------------------------------------------------
// Конструктор контейнера.
container::container() {
    animals = new animal*[max_len];
    for (int i = 0; i < max_len; ++i) {
        animals[i] = NULL;
    }
    len = 0;
}

// Ввод содержимого контейнера из указанного файла.
int container::In(FILE *input) {
    int amount;
    int input_amount = fscanf(input,"%ld\n", &amount);

    if (input_amount != 1) {
        printf("Wrong format!\n");
        return 1;
    }

    if (amount < 0 || amount > max_len){
        printf("Amount of items in container must be < %ld and > 0.\n", sizeof(container));
        return 1;
    }

    for(int i = 0; i < amount; ++i){
        animal* anim = animal::In(input);
        if (anim == NULL){
            printf("Couldn't create item with index = %d.\n", i);
            return 1;
        }
        if (len >= max_len) {
            printf("Container is full.\n");
            return 1;
        }
        animals[len] = anim;
        ++len;
    }
    return 0;
}

// Случайный ввод содержимого контейнера.
int container::InRnd(int size, FILE *input_g) {
    if (size <0 || size > max_len) {
        printf("Container size must be > 0 and < %d.\n", max_len);
        return 1;
    } else {
        fprintf(input_g,"%d\n",size);
    }
    for (int i = 0; i < size; ++i) {
        animal* anim = animal::InRnd();
        animals[len] = anim;
        ++len;
        anim->OutGenerated(input_g);
    }
    return 0;
}

// Вывод содержимого контейнера в указанный поток.
void container::Out(FILE *output) {
    fprintf(output,"Container contains %d elements.\n", len);
    for (int i = 0; i < len; ++i) {
        fprintf(output,"%d : ",i);
        animals[i]->Out(output);
    }
}

// Прямая сортировка выбором по убыванию.
void container::StraightSelection() {
        for (int i = 0; i < len-1; ++i) {
        animal* current = animals[i];
        int max = i;
        for(int j = i + 1; j < len; ++j) {
            if(animals[j]->CountQuotient() > animals[i]->CountQuotient()){
                animals[i] = animals[j];
                max = j;
            }
        }
        animals[max] = current;
    }
}

// Деструктор контейнера.
container::~container() {
    for (int i = 0; i < len; ++i) {
        delete animals[i];
    }
    len = 0;
    delete animals;
}