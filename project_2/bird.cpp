//------------------------------------------------------------------------------
// bird.cpp - содержит функции обработки птицы.
//------------------------------------------------------------------------------

#include "bird.h"

//------------------------------------------------------------------------------
// Конструктор объекта.
bird::bird(char n[1001], int w, int index): animal(n, w) {
    if(index == 0){
        migration = false;
    } else {
        migration = true;
    }
}

// Вывод параметров объекта в файл - переопределенный метод.
void bird::Out(FILE *output) {
    fprintf(output, "It is a bird: name = %s, weight = %d, migration = %s, function result = %f.\n",
            GetName(), GetWeight(), GetMigration(), CountQuotient());
}

// Вывод сгенерированных параметров в входной файл - переопределенный метод.
void bird::OutGenerated(FILE *input_g) {
    fprintf(input_g, "%s\n%d\n2\n%d\n",
            GetName(), GetWeight(), migration, CountQuotient());
}

// Получение значений приватных полей.
char *bird::GetMigration() {
    char* bird_migration[] = {"FALSE", "TRUE"};
    if(migration){
        return bird_migration[1];
    } else {
        return  bird_migration[0];
    }
}