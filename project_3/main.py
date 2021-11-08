import sys
import time

from container import Container


def help_message():
    """
    Функция печатает вспомогательную инструкцию в консоль.
    :return: -
    """
    print('Instruction!\n\n'
          'You can open input file using command:\n'
          '\t-f *input* *output*\n'
          'where *input* and *output* are paths.\n\n'
          'You can create random input file using command:\n'
          '\t-n *size* *files path*\n'
          'where *size* is an amount of items in container, *files path* is path for input and output files.\n\n')


def err_message_1():
    """
    Функция печатает в консоль сообщение об ошибке.
    :return: -
    """
    print('Wrong input arguments!\n')


def err_message_2():
    """
        Функция печатает в консоль сообщение об ошибке.
        :return: -
    """
    print('Wrong command!\n')


def main(argv: list):
    """
    Точка входа.
    :param argv: аргументы командной строки.
    :return: -
    """
    start_time = time.time()
    help_message()
    if len(argv) != 4:
        err_message_1()
        return

    print('Start!\n')
    if argv[1] == '-f':
        try:
            input_file = open(argv[2], 'r')
            output_file = open(argv[3], 'w')
        except:
            err_message_1()
            return
        container = Container.in_from_file(input_file)
        if container:
            print('Container is created from input file!\n')
        container.out(output_file)
        container.straight_selection()
        output_file.write('\nSorted container :\n')
        container.out(output_file)
        input_file.close()
        output_file.close()
    elif argv[1] == '-n':
        try:
            amount = int(argv[2])
            input_g_file = open(argv[3] + '_generated', 'w')
            output_g_file = open(argv[3] + '_generated_output', 'w')
        except:
            err_message_1()
            return
        container = Container.in_rnd(amount)
        if not container:
            return
        container.out_generated(input_g_file)
        container.out(output_g_file)
        container.straight_selection()
        output_g_file.write('\nSorted container :\n')
        container.out(output_g_file)
        input_g_file.close()
        output_g_file.close()
    else:
        err_message_2()
        return

    print('Stop!\n')
    print(f"Program running time = {(time.time() - start_time) * 1000} ms")


if __name__ == '__main__':
    main(sys.argv)
