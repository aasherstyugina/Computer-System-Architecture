#ifndef PROJECT_RND_H
#define PROJECT_RND_H

#include "stdlib.h"
#include "string.h"

//------------------------------------------------------------------------------
// rnd.h - содержит генератор случайных чисел и имён.
//------------------------------------------------------------------------------

static int Rand(int min, int max) {
    return rand() % max + min;
}

static char* RandName(){
    int length = Rand(1,15);
    char* name = new char[length];
    char* alphabet = "abcdefghijklmnopqrstuvwxyz";
    for(int i = 0; i < length; i++){
        name[i]=alphabet[Rand(0,26)];
    }
    return name;
}

#endif //PROJECT_RND_H
