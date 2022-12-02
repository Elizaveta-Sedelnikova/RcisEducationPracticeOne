import 'dart:io';

void main() {
  int task = 0;
  try {
    stdout.write('Введите номер задания: ');
    task = int.parse(stdin.readLineSync()!);
  } catch(e) {
    print('Введены некорректные данные, запустите программу и попробуйте ещё раз или');
  }
  switch(task) {
    case 1:
    int n = 0;
    int mult = 1;
    try {
      try {
      stdout.write('Введите n: ');
      n = int.parse(stdin.readLineSync()!);
      } catch(e) {
        stdout.write('Вы ввели некорректное n, попробуйте ещё раз: ');
        n = int.parse(stdin.readLineSync()!);
      } } catch(a) {
      stdout.write('Вы сново ввели некорректное n и теперь ничего не работает, запустите программу по новой ');
      break;
    }

    if (n < 0)
    {
      stdout.write('Вы ввели отрицательное n, попробуйте ещё раз: ');
      n = int.parse(stdin.readLineSync()!);
    }

    if (n < 3 && n > -1) {
      mult = 0;
    }
    else
    {
      for (int i = 3; i <= n; i += 3)
      {
        mult *= i;
      }
    }
    print('Произведение чисел кратных трем и не превышающие число $n = $mult');
    break;

    case 2:
    File numsF = File('numsTask2.txt');
    dynamic values = (numsF.readAsStringSync());
    List<String> stringHeight = values.split(";");
    List<double> nums = stringHeight.map(double.parse).toList();
    print('Все числа из фалйла $nums');
    List<double> newNums = [];

    for (int i = 0; i < nums.length; i++)
    {
      if (nums[i] == 0)
      {
        break;
      }
      newNums.add(nums[i]);
    }
    print('Все числа из фалйла до нуля $newNums');
    double sum = 0;
    for (int i = 0; i < newNums.length; i++)
    {
      if (nums[i] > 0)
      {
        sum += nums[i];
      }
    }

    print('Сумма положительных элементов: $sum');
    break;

    case 3:
    File numsF = File('numsTask3.txt');
    dynamic values = (numsF.readAsStringSync());
    List<String> stringHeight = values.split(",");
    List<int> nums = stringHeight.map(int.parse).toList();
    print('Все числа из фалйла $nums');
    List<int> newNums = [];

    for (int i = 0; i < nums.length; i++)
    {
      if (nums[i] == 0)
      {
        break;
      }
      newNums.add(nums[i]);
    }
    print('Все числа из фалйла до нуля $newNums');

    int min = newNums[0];
    int max = newNums[0];
    for (int i = 0; i < newNums.length; i++){
      if (min > newNums[i])
      {
        min = newNums[i];
      }
      if (max < newNums[i])
      {
        max = newNums[i];
      }
    }
    print('Максимальный элемент: $max');
    print('Миниальный элемент: $min');
    print('Отношение минимального к максимальному: ${min/max}');
    print('Отношение макимального к минимальному: ${max/min}');
    break;

    case 4:
     File numsF = File('numsTask4.txt');
     dynamic values = (numsF.readAsStringSync());
     List<String> stringHeight = values.split(" ");
     List<int> nums = stringHeight.map(int.parse).toList();
     print(nums);
     int q = 0;
     for (int i = 0; i < nums.length - 1; i++)
     {
       if (nums[i] == nums[i + 1])
       {
         q++;
       }
     }
     print('Количесвто одинаковых рядом стоящих чисел: $q');
    break;

    case 5:
      double a = 0, b = 0;
      try {
        try {
          stdout.write('Введите a: ');
          a = double.parse(stdin.readLineSync()!);
        } catch(e) {
          stdout.write('Вы ввели некорректное a, попробуйте ещё раз: ');
          a = double.parse(stdin.readLineSync()!);
        }
        try {
          stdout.write('Введите b: ');
          b = double.parse(stdin.readLineSync()!);
        } catch(e) {
          stdout.write('Вы ввели некорректное b, попробуйте ещё раз: ');
          b = double.parse(stdin.readLineSync()!);
        } } catch(e) {
        print('Вы ввели некорректное a или b');
        break;
      }

      if (a >= -1 && a <= 3 && b >= -2 && b <= 4) {
        print('Точка принадлежит области');
      }
      else {
        print('Точка не принадлежит области');
      }
    break;

    case 6:
      double x = 0, y = 0;
      try {
      stdout.write('Введите x:');
      x = double.parse(stdin.readLineSync()!);
      stdout.write('Введите y:');
      y = double.parse(stdin.readLineSync()!);
      } catch(e) {
        print('Вы ввели некорректное x или y, запустите программу и попробуйте снова');
        break;
      }

      double a = (-2 - x) * (2 - (-3)) - (0 - (-2)) * (-3 - y);
      double b = (0 - x) * (-3 - 2) - (2 - 0) * (2 - y);
      double c = (2 - x) * (-3 - (-3)) - (-2 - 2) * (-3 - y);

      if ((a >= 0 && b >= 0 && c >= 0) || (a <= 0 && b <= 0 && c <= 0))
      {
        print("Точка ($x; $y) принадлежит треугольнику");
      }
      else
      {
        print("Точка ($x; $y) не принадлежит треугольнике");
      }
      break;

    default:
      print('такого задания не существует');
  }
}