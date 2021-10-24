//------------------------------------------------------------------------------
// main.cpp - содержит главную функцию, 
// обеспечивающую простое тестирование
//------------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include "animal.h"

#include "container.h"

void helpMessage(){
    printf("Instruction!\n\n"
           "You can open input file using command:\n"
           "\t-f *input* *output*\n"
           "where *input* and *output* are paths.\n\n"
           "You can create random input file using command:\n"
           "\t-n *size* *files path*\n"
           "where *size* is an amount of items in container, *files path* is path for input and output files.\n\n");
}

void errMessage1() {
    printf("Wrong input arguments!\n");
}

void errMessage2() {
    printf("Wrong command!\n");
}

//------------------------------------------------------------------------------
int main(int argc, char* argv[]) {
    srand(static_cast<unsigned int>(time(0)));
    time_t begin_t, end_t;
    begin_t = clock();
    helpMessage();
    if (argc != 4) {
        errMessage1();
        return 1;
    }

    printf("Start!\n");
    container c;
    if (!strcmp(argv[1], "-f")) {
        FILE* input = fopen(argv[2],"r");
        int error = c.In(input);
        fclose(input);
        if (error != 0) {
            printf("Couldn't open input file.\n");
        } else {
            FILE* output = fopen(argv[3],"w");
            c.Out(output);
            // Сортировка контейнера.
            fprintf(output,"\nSorted container : \n");
            c.StraightSelection();
            c.Out(output);
            fclose(output);
        }
    }
    else if (!strcmp(argv[1], "-n")) {
        int size = atoi(argv[2]);
        FILE *input_g = fopen(strcat(argv[3],"_generated"), "w");
        FILE *output_g = fopen(strcat(argv[3],"_output"), "w");
        // Заполнение контейнера случайными животными.
        c.InRnd(size, input_g);
        c.Out(output_g);
        // Сортировка контейнера.
        fprintf(output_g,"\nSorted container : \n");
        c.StraightSelection();
        c.Out(output_g);
        fclose(output_g);
    }
    else {
        errMessage2();
        return 1;
    }

    printf("Stop!\n");
    end_t = clock();
    printf("Program running time = %f\n", difftime(end_t, begin_t) / CLOCKS_PER_SEC);
    return 0;
}