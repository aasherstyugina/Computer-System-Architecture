import random
import string
from abc import abstractmethod
from enum import Enum
from random import randint


class Kind(Enum):
    """
    Тип животного.
    """
    BEAST = 0
    FISH = 1
    BIRD = 2


class Area(Enum):
    """
    Место проживания рыбы.
    """
    RIVER = 0
    SEA = 1
    LAKE = 2


class Subtype(Enum):
    """
    Подтип зверя.
    """
    PREDATOR = 0
    HERBIVORE = 1
    INSECTIVOROUS = 2


class Animal:
    """
    Класс, описывающий животное.
    """
    weight: int
    name: str

    def __init__(self, name, weight):
        """
        Конструктор объекта.
        :param name: имя животного.
        :param weight: вес животного.
        """
        self.name = name
        self.weight = weight

    def __str__(self):
        """
        Строковое представление объекта.
        :return: строка с информацией о животном.
        """
        return f"name = {self.name}, weight = {self.weight}"

    @staticmethod
    def in_from_file(input_file):
        """
        Статический метод ввода информации об объекте из файла.
        :param input_file: входной файл.
        :return: объект, созданный с указанными в файле параметрами.
        """
        kind = Kind(int(input_file.readline()))
        if kind == Kind.BEAST:
            return Beast.in_from_file(input_file)
        elif kind == Kind.FISH:
            return Fish.in_from_file(input_file)
        elif kind == Kind.BIRD:
            return Bird.in_from_file(input_file)
        else:
            print('Wrong animal type!\n')
            return None

    @staticmethod
    def in_rnd():
        """
        Генерация рандомного объекта.
        :return: объект, созданный с рандомно сгенерированными параметрами.
        """
        animal_kind = Kind(randint(0, len(Kind) - 1))
        if animal_kind == Kind.BEAST:
            return Beast.in_rnd()
        elif animal_kind == Kind.FISH:
            return Fish.in_rnd()
        elif animal_kind == Kind.BIRD:
            return Bird.in_rnd()
        else:
            return None

    @abstractmethod
    def out_generated(self, input_g_file):
        """
        Абстрактный метод вывода сгенерированных параметров для рандомного объекта во входной файл.
        :param input_g_file: входной файл.
        :return: -
        """
        pass

    @staticmethod
    def rand_name() -> str:
        """
        Статический метод генерации рандомного имени.
        :return: сгенерированная строка.
        """
        length = randint(5, 12)
        letters = string.ascii_lowercase
        name = ''.join(random.choice(letters) for i in range(length))
        return name

    def count_quotient(self) -> float:
        """
        Подсчёт значения функции, используемого как параметр сравнения при сортировке.
        :return: вещественное значение.
        """
        total = 0
        for char in self.name:
            total += ord(char)
        return (total + 0.0) / self.weight


class Fish(Animal):
    """
    Класс, описывающий рыбу. Наследуется от класса животных.
    """
    weight: int
    name: str
    area: Area

    def __init__(self, name, weight, area):
        """
        Конструктор объекта с вызовом канструктора базового класса.
        :param name: имя животного.
        :param weight: вес животного.
        :param area: место обитания рыбы.
        """
        super().__init__(name, weight)
        self.area = area

    def __str__(self):
        """
        Строковое представление объекта с вызовом соответствующего метода базового класса.
        :return: строка с информацией о рыбе.
        """
        return f"It is a fish: {super().__str__()}, area = {self.area.name}, " \
               f"function result = {Animal.count_quotient(self)}.\n "

    @staticmethod
    def in_from_file(input_file):
        """
        Статический метод ввода информации о рыбе из файла.
        :param input_file: входной файл.
        :return: объект, созданный с указанными в файле параметрами.
        """
        name = input_file.readline().rstrip('\n')
        if not name:
            print('Wrong animal name!\n')
            return None
        weight = int(input_file.readline())
        if weight < 0:
            print('Wrong animal weight!\n')
            return None
        area_index = int(input_file.readline())
        if area_index < 0 or area_index > 2:
            print('Wrong fish area!\n')
            return None
        area = Area(area_index)
        return Fish(name, weight, area)

    @staticmethod
    def in_rnd() -> 'Fish':
        """
        Генерация рандомной рыбы.
        :return: объект, созданный с рандомно сгенерированными параметрами.
        """
        weight = randint(1, 5000)
        name = Animal.rand_name()
        area = Area(randint(0, len(Area) - 1))
        return Fish(name, weight, area)

    def out_generated(self, input_g_file):
        """
        Реализация абстрактного метода вывода сгенерированных параметров для рандомного объекта во входной файл.
        :param input_g_file: входной файл.
        :return: -
        """
        input_g_file.write(str(Kind.FISH.value) + "\n")
        input_g_file.write(self.name + "\n")
        input_g_file.write(str(self.weight) + "\n")
        input_g_file.write(str(self.area.value) + "\n")


class Bird(Animal):
    """
    Класс, описывающий птицу. Наследуется от класса животных.
    """
    weight: int
    name: str
    migration: bool

    def __init__(self, name, weight, migration):
        """
        Конструктор объекта с вызовом конструктора базового класса.
        :param name: имя животного.
        :param weight: вес животного.
        :param migration: отношение к перелёту у птицы.
        """
        super().__init__(name, weight)
        self.migration = migration

    def __str__(self):
        """
        Строковое представление объекта с вызовом соответствующего метода базового класса.
        :return: строка с информацией о птице.
        """
        return f"It is a bird: {super().__str__()}, migration = {self.migration}, " \
               f"function result = {Animal.count_quotient(self)}.\n "

    @staticmethod
    def in_from_file(input_file):
        """
        Статический метод ввода информации о птице из файла.
        :param input_file: входной файл.
        :return: объект, созданный с указанными в файле параметрами.
        """
        name = input_file.readline().rstrip('\n')
        if not name:
            print('Wrong animal name!\n')
            return None
        weight = int(input_file.readline())
        if weight < 0:
            print('Wrong animal weight!\n')
            return None
        migration_index = int(input_file.readline())
        if migration_index < 0 or migration_index > 1:
            print('Wrong bird migration!\n')
            return None
        migration = bool(migration_index)
        return Bird(name, weight, migration)

    @staticmethod
    def in_rnd() -> 'Bird':
        """
        Генерация рандомной птицы.
        :return: объект, созданный с рандомно сгенерированными параметрами.
        """
        weight = randint(1, 5000)
        name = Animal.rand_name()
        migration = bool(randint(0, 1))
        return Bird(name, weight, migration)

    def out_generated(self, input_g_file):
        """
        Реализация абстрактного метода вывода сгенерированных параметров для рандомного объекта во входной файл.
        :param input_g_file: входной файл.
        :return: -
        """
        input_g_file.write(str(Kind.BIRD.value) + "\n")
        input_g_file.write(self.name + "\n")
        input_g_file.write(str(self.weight) + "\n")
        input_g_file.write(str(int(self.migration)) + "\n")


class Beast(Animal):
    """
    Класс, описывающий зверя. Наследуется от класса животных.
    """
    weight: int
    name: str
    subtype: Subtype

    def __init__(self, name, weight, subtype):
        """
        Конструктор объекта с вызовом конструктора базового класса.
        :param name: имя животного.
        :param weight: вес животного.
        :param subtype: подтип зверя.
        """
        super().__init__(name, weight)
        self.subtype = subtype

    def __str__(self):
        """
        Строковое представление объекта с вызовом соответствующего метода базового класса.
        :return: строка с информацией о звере.
        """
        return f"It is a beast: {super().__str__()}, type = {self.subtype.name}, " \
               f"function result = {Animal.count_quotient(self)}.\n "

    @staticmethod
    def in_from_file(input_file):
        """
        Статический метод ввода информации о звере из файла.
        :param input_file: входной файл.
        :return: объект, созданный с указанными в файле параметрами.
        """
        name = input_file.readline().rstrip('\n')
        if not name:
            print('Wrong animal name!\n')
            return None
        weight = int(input_file.readline())
        if weight < 0:
            print('Wrong animal weight!\n')
            return None
        subtype_index = int(input_file.readline())
        if subtype_index < 0 or subtype_index > 2:
            print('Wrong beast type!\n')
            return None
        subtype = Subtype(subtype_index)
        return Beast(name, weight, subtype)

    @staticmethod
    def in_rnd() -> 'Beast':
        """
        Генерация рандомного зверя.
        :return: объект, созданный с рандомно сгенерированными параметрами.
        """
        weight = randint(1, 5000)
        name = Animal.rand_name()
        subtype = Subtype(randint(0, len(Subtype) - 1))
        return Beast(name, weight, subtype)

    def out_generated(self, input_g_file):
        """
        Реализация абстрактного метода вывода сгенерированных параметров для рандомного объекта во входной файл.
        :param input_g_file: входной файл.
        :return: -
        """
        input_g_file.write(str(Kind.BEAST.value) + "\n")
        input_g_file.write(self.name + "\n")
        input_g_file.write(str(self.weight) + "\n")
        input_g_file.write(str(self.subtype.value) + "\n")
