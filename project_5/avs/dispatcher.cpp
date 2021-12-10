#include <fstream>
#include <iostream>

#include "dispatcher.h"

dispatcher::dispatcher(std::string text, int length) {
    this->text = text;
    this->counter = 0;
    this->length = length;
    result = new int[text.length()];
}

// Используем мьютекс, так как необходимо избежать ситуации, где несколько
// потоков одновременно пытаются получить один и тот же кусок текста для
// шифрования. С помощью мьютекса диспетчер будет выдавать кусочки текста
// строго по очереди.
std::string dispatcher::getTextPart(int& index) {
    locker.lock();
    std::string text_part;

    // Дополнительная проверка необходима в том случае, если за последним куском текста
    // выстроилась "очередь" из потоков-шифровальщиков. Тогда первый из них заберет этот
    // текст, а последующие получат "0".
    if(isDone()){
        text_part = "0";
    } else {
        text_part = text.substr(counter*length, length);
        index = counter*length;
        ++counter;
    }
    locker.unlock();

    return text_part;
}

bool dispatcher::isDone() {
    return text.length() <= counter * length;
}

// Использование мьютекса не требуется, так как каждый поток будет записывать результат
// шифрования исключительно в свою часть общего массива. Для этого передается index.
// Таким образом, потоки не претендуют на общие данные.
void dispatcher::addEncryptedPart(const int *part_result, int index, int part_length) {
    for(int i = index; i<index+part_length; ++i){
        result[i] = part_result[i-index];
    }
}

void dispatcher::printResult(std::string path) {
    std::ofstream out;
    out.open(path);
    if (out.is_open()) {
        for (int i = 0; i<text.length(); ++i){
            out << result[i] << " ";
        }
        out.close();
    }
}
