#ifndef AVS_DISPATCHER_H
#define AVS_DISPATCHER_H

//------------------------------------------------------------------------------
// Класс, описывающий диспетчера.
//------------------------------------------------------------------------------

#include <string>
#include <mutex>

class dispatcher {
public:
    // Конструктор объекта.
    dispatcher(std::string text, int length);

    // Выдача кусочка текста для шифрования отдельным потоком.
    std::string getTextPart(int& index);

    // Проверка, остался ли незашифрованный текст.
    bool isDone();

    // Запись результата шифрования отдельного потока в общий массив.
    void addEncryptedPart(const int* part_result, int index, int part_length);

    // Запись результата многопоточного шифрования в файл.
    void printResult(std::string path);

private:
    // Счетчик кусков текста.
    int counter;

    // Длина каждого куска текста.
    int length;

    // Весь текст.
    std::string text;

    // Мьютекс для блокировки доступа к методам, работающим с общими данными,
    // доступ к которым должен иметь только один процесс.
    std::mutex locker;

    // Массив, хранящий результаты шифрования всего текста.
    int* result;
};


#endif //AVS_DISPATCHER_H
