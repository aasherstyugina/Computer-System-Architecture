#ifndef AVS_CRYPTOGRAPHER_H
#define AVS_CRYPTOGRAPHER_H

//------------------------------------------------------------------------------
// Класс, описывающий поведение потока-шифровальщика.
//------------------------------------------------------------------------------

#include <string>
#include <map>
#include "dispatcher.h"

class cryptographer {
public:
    // Конструктор.
    cryptographer(dispatcher* host, std::map<char, int> key);

    // Функция, которая выполняется потоком.
    void process();

private:
    // Ключ для шифрования.
    std::map<char, int> key;

    // Указатель на диспетчер, у всех потоков он один и тот же в данной реализации.
    dispatcher* host;

    // Шифрование выданного кусочка текста.
    int* encrypt(std::string text);
};


#endif //AVS_CRYPTOGRAPHER_H
