//------------------------------------------------------------------------------
// main.cpp - содержит главную функцию,
// обеспечивающую простое тестирование
//------------------------------------------------------------------------------

#include <iostream>
#include <string>
#include <cstring>
#include <thread>
#include <ctime>
#include <vector>
#include <fstream>
#include <map>

#include "dispatcher.h"
#include "cryptographer.h"

// Глобальная переменная - строка со всеми символами латинского алфавита для генерации входного текста и ключа шифрования.
std::string alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

void helpMessage(){
    std:: cout << "Instruction!\n\n"
           "You can set the number of cryptographers, the length of the processed parts of the text for cryptographer\n"
           "and open input file with text using command:\n"
           "\t*count* *length* *input*\n"
           "where *count* is the number of threads, *length* is count of encrypted symbols for every thread,\n"
           "*input* is path to file with text.\n\n"
           "If you want to generate text, write GENERATE instead of input path.\n\n"
           "Result of multithreading processing will be written in *input*_out file.\n"
           "Result of standard processing will be written in *input*_expected file.\n\n";
}

void errMessage1() {
    printf("Wrong input arguments!\n"
           "The number of threads and the length of the processed parts of the text must be integer value > 0,\n"
           "text must consist of latin characters.\n");
}

void errMessage2() {
    printf("Wrong command!\n");
}

//------------------------------------------------------------------------------
// Сгенерировать входной текст и записать его в файл.
//------------------------------------------------------------------------------
std::string generateText(){
    srand(time(0));
    int length = rand() % 100000;
    std::string text(length, '0');
    for(int i = 0; i<length; ++i){
        text[i] = alphabet[rand() % 52];
    }

    std::ofstream out;
    out.open("../test/generate");
    if (out.is_open()) {
        out << text;
        out.close();
    }

    return  text;
}

//------------------------------------------------------------------------------
// Прочитать текст из файла.
//------------------------------------------------------------------------------
std::string readText(std::string path) {
    std::string text;
    std::ifstream in(path);
    if(in.is_open()){
        std::getline(in, text);
        in.close();
    } else {
        return "0";
    }

    return text;
}

//------------------------------------------------------------------------------
// Создать словарь с парами символ - код, где для каждой строчной и
// заглавной латинской буквы генерируется уникальный код - целое число
// от 0 до 999.
//------------------------------------------------------------------------------
std::map<char, int> makeKey() {
    srand(time(0));
    std::map<char, int> key_forward;
    std::map<char, int> key_backward;
    for(char ch:alphabet){
        int code;
        do{
            code = rand() % 1000;
        } while(key_backward.contains(code));
        key_forward.insert(std::make_pair(ch,code));
        key_backward.insert(std::make_pair(code, ch));
    }

    return key_forward;
}

//------------------------------------------------------------------------------
// Записать ожидаемый результат шифрования в файл без использования потоков,
// чтобы после сравнить его с результатом многопоточного шифрования.
//------------------------------------------------------------------------------
void printExpected(std::string path, std::string text, std::map<char,int> key){
    int *result = new int[text.length()];
    for(int i = 0; i<text.length(); ++i){
        result[i] = key[text[i]];
    }

    std::ofstream out;
    out.open(path);
    if (out.is_open()) {
        for (int i = 0; i<text.length(); ++i){
            out << result[i] << " ";
        }
        out.close();
    }
}

int main(int argc, char* argv[]) {
    srand(static_cast<unsigned int>(time(0)));
    time_t begin_t, end_t;
    begin_t = clock();
    helpMessage();
    if (argc != 4) {
        errMessage2();
        return 1;
    }

    std:: cout<<"Start!\n\n";

    // Получение и проверка входных данных.
    int count_of_threads = atoi(argv[1]);
    int length = atoi(argv[2]);
    std::string text;
    std::string path_out;
    std::string path_expected;
    std::string generate = "GENERATE";
    if(argv[3] == generate){
        text = generateText();
        path_out = "../test/generate_out";
        path_expected = "../test/generate_expected";
    } else {
        text = readText(argv[3]);
        path_out = strcat(argv[3],"_out");
        path_expected = strcat(argv[3], "_expected");
    }
    if(count_of_threads <= 0 || length <= 0 || text == "0") {
        errMessage1();
        return 1;
    }
    std::map<char, int> key = makeKey();

    // Создание диспетчера и запуск потоков-шифровальщиков.
    dispatcher* disp = new dispatcher(text, length);

    std::vector<std::thread> cryptographers_threads;
    cryptographers_threads.reserve(count_of_threads);
    std::vector<cryptographer> cryptographers_instances;
    cryptographers_instances.reserve(count_of_threads);

    for(int i = 0; i<count_of_threads; ++i){
        cryptographers_instances.emplace_back(disp, key);
        cryptographers_threads.emplace_back(&cryptographer::process, cryptographers_instances[i]);
    }

    // Останавливаем работу шифровальщиков.
    for(int i = 0; i<count_of_threads; ++i){
        cryptographers_threads[i].join();
    }

    // Записываем результат многопоточного шифрования в файл.
    disp->printResult(path_out);

    std:: cout<<"Stop!\n";
    end_t = clock();
    std::cout<<"Program running time = " << difftime(end_t, begin_t) * 1000 / CLOCKS_PER_SEC << " ms.";

    // Записываем ожидаемый результат шифрования (без использования многопоточности).
    printExpected(path_expected, text, key);
    // Сравниваем ожидаемое и полученное шифрование.
    if(readText(path_out) == readText(path_expected)){
        std::cout<<"\n\nMultithreading encryption equals to standard encryption.\n";
    } else{
        std::cout<<"\n\nMultithreading encryption does not equals to standard encryption.\n";
    }

    return 0;
}
