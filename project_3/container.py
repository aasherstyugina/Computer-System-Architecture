from animals import Animal

MAX_LENGTH = 10000


class Container:
    """
    Класс, описывающий контейнер.
    """
    animals: list

    def __init__(self):
        """
        Конструктор объекта.
        """
        self.animals = list()

    def __str__(self):
        """
        Строковое представление информации об объекте.
        :return: строка с информацией.
        """
        return f'Container contains {len(self.animals)} elements.\n '

    @staticmethod
    def in_from_file(input_file):
        """
        Статический метод ввода информации об объекте из файла.
        :param input_file: входной файл.
        :return: объект, созданный по указанным в файле параметрам.
        """
        container = Container()
        input_str = input_file.readline()
        try:
            amount = int(input_str)
            if amount < 0 or amount > 10000:
                print(f'Amount of items in container must be < {MAX_LENGTH} and > 0.\n')
                return None
            for i in range(amount):
                if not container.add(Animal.in_from_file(input_file)):
                    break
            return container
        except ValueError:
            print('Couldn\'t read container from file!\n')
            return None

    def add(self, animal) -> bool:
        """
        Метод добавления животного в контейнер.
        :param animal: добавляемое животное.
        :return: истина, если добавление прошло успешно, иначе ложь.
        """
        if len(self.animals) < MAX_LENGTH:
            self.animals.append(animal)
            return True
        else:
            print('Container is full.\n')
            return False

    @staticmethod
    def in_rnd(amount):
        """
        Статический метод генерации рандомного контейнера.
        :param amount: размер контейнера.
        :return: в случае корректности заданного размера возвращается сгенерированный контейнер, иначе None.
        """
        container = Container()
        if amount < 0 or amount > 10000:
            print(f'Amount of items in container must be < {MAX_LENGTH} and > 0.\n')
            return None
        for i in range(amount):
            container.add(Animal.in_rnd())
        return container

    def out(self, output_file):
        """
        Вывод информации о контейнере в файл.
        :param output_file: выходной файл.
        :return: -
        """
        output_file.write(str(self))
        for i in range(0, len(self.animals)):
            output_file.write(f'{i} : ' + str(self.animals[i]))

    def out_generated(self, input_g_file):
        """
        Вывод сгенерированных параметров для создания контейнера в файл.
        :param input_g_file: входной файл.
        :return: -
        """
        input_g_file.write(str(len(self.animals)) + "\n")
        for animal in self.animals:
            animal.out_generated(input_g_file)

    def straight_selection(self):
        """
        Метод сортировки выбором объектов по заданному параметру сравнения (по возрастанию).
        :return: -
        """
        for i in range(0, len(self.animals) - 1):
            current = self.animals[i]
            max_index = i
            for j in range(i + 1, len(self.animals)):
                if self.animals[j].count_quotient() > self.animals[i].count_quotient():
                    self.animals[i] = self.animals[j]
                    max_index = j
            self.animals[max_index] = current
