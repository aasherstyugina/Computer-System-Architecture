#include <iostream>
#include "cryptographer.h"

cryptographer::cryptographer(dispatcher* host, std::map<char, int> key) {
    this->key = key;
    this->host = host;
}

int* cryptographer::encrypt(std::string text) {
    int *result = new int[text.length()];
    for(int i = 0; i<text.length(); ++i){
        result[i] = key[text[i]];
    }

    return result;
}

void cryptographer::process() {
    // Проверяем, что в диспетчере остался незашифрованный текст и потоку имеет смысл к нему обращаться.
    while(!host->isDone()){
        std::cout<<"Thread start process...\n";
        int index = 0;
        // Получаем кусочек текста от диспетчера.
        std::string text = host->getTextPart(index);

        if(text != "0"){
            // Шифруем полученный текст.
            int* result = encrypt(text);
            // Записываем результат шифрования в общий массив диспетчера.
            host->addEncryptedPart(result, index, text.length());

            delete[] result;
        }

        std::cout<<"Thread finish process...\n\n";
    }
}
