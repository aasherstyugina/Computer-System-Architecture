//------------------------------------------------------------------------------
// container.cpp - содержит функции обработки контейнера.
//------------------------------------------------------------------------------

#include "container.h"
#include "stdlib.h"
#include "stdio.h"

//------------------------------------------------------------------------------
// Инициализация контейнера.
container* Init() {
    container* c = (container*) malloc(sizeof(container));
    c->len = 0;
    for(int i = 0; i < c->max_len; i++){
        c->cont[i]=NULL;
    }
    return c;
}

//------------------------------------------------------------------------------
// Очистка контейнера от элементов (освобождение памяти).
void Clear(container* c) {
    for (int i = 0; i < c->len; i++) {
        delete c->cont[i];
    }
    c->len = 0;
}

//------------------------------------------------------------------------------
// Добавить элемент в контейнер.
void AddItem(container* c, animal* anim) {
    if (c->cont[c->len] == NULL) {
        c->cont[c->len] = (animal*) malloc(sizeof(anim));
        c->cont[c->len]->name = (char*) malloc(1001);
    }
    c->cont[c->len]->k = anim->k;
    c->cont[c->len]->weight = anim->weight;
    strcpy(c->cont[c->len]->name, anim->name);
    c->cont[c->len]->bst = anim->bst;
    c->cont[c->len]->brd = anim->brd;
    c->cont[c->len]->fsh = anim->fsh;
    c->len++;
}

//------------------------------------------------------------------------------
// Ввод содержимого контейнера из указанного потока.
int In(container* c, FILE* input) {
    int amount;
    int input_amount = fscanf(input,"%ld\n", &amount);
    if (input_amount != 1) {
        printf("Wrong format!\n");
        return 1;
    }
    if (amount < 0 || amount > c->max_len){
        printf("Amount of items in container must be < %ld and > 0.\n", sizeof(container));
        return 1;
    }
    for(int i = 0; i < amount; i++){
        animal anim{};
        int input_item = In(&anim, input);
        if (input_item != 0){
            printf("Couldn't create item with index = %d.\n", i);
            return 1;
        }
        if (c->len >= c->max_len) {
            printf("Container is full.");
        }
        else {
            AddItem(c, &anim);
        }
    }
    return 0;
}

//------------------------------------------------------------------------------
// Случайный ввод содержимого контейнера.
int InRnd(container* c, int size, FILE* input_g) {
    if (size <0 || size > c->max_len) {
        printf("Container size must be > 0 and < %d.\n", c->max_len);
        return 1;
    } else {
        fprintf(input_g,"%d\n",size);
    }
    for (int i = 0; i < size; i++) {
        animal anim;
        InRnd(&anim);
        fprintf(input_g,"%s\n%d\n%d\n",anim.name, anim.weight, anim.k);
        switch(anim.k){
            case(0):
                fprintf(input_g, "%d\n",anim.bst.t);
                break;
            case(1):
                fprintf(input_g, "%d\n",anim.fsh.ar);
                break;
            case(2):
                fprintf(input_g, "%d\n",anim.brd.migration);
                break;
        }
        AddItem(c,&anim);
    }
    return 0;
}

//------------------------------------------------------------------------------
// Вывод содержимого контейнера в указанный поток.
void Out(const container* c, FILE* output) {
    fprintf(output,"Container contains %d elements.\n",c->len);
    for (int i = 0; i < c->len; i++) {
        fprintf(output,"%d : ",i);
        Out(c->cont[i], output);
    }
}

void StraightSelection(container* c) {
        for (int i = 0; i < c->len-1; i++) {
        animal* current = c->cont[i];
        int max = i;
        for(int j = i + 1; j < c->len; j++) {
            if(CountQuotient(c->cont[j]->name,c->cont[j]->weight) > CountQuotient(c->cont[i]->name, c->cont[i]->weight)){
                c->cont[i] = c->cont[j];
                max = j;
            }
        }
        c->cont[max] = current;
    }
}