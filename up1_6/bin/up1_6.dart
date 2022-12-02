import 'dart:io';
import 'dart:math';

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
      File words = File('numsTask1.txt');
      dynamic values = (words.readAsStringSync());
      List<String> str = values.split(" ");
      int c = 0;
      for (int i = 0; i < str.length; ++i) {
        c = str[i].length % 2;
        if (c == 1) {
          stdout.writeln(str[i]);
        }
      }
      break;

    case 2:
    File words = File('numsTask2.txt');
    dynamic values = (words.readAsStringSync());
    List<String> str = values.split("\n");
    for (int i = 0; i < str.length; ++i)
    {
      stdout.write('${str[i]} ');
    }
    break;

    case 3:
     int num = 0;
     stdout.write('Введите число: ');
     try {
       num = int.parse(stdin.readLineSync()!);
     } catch(e) {
       print('Вы ввели некорректные данные, попробуйте запустить программу и ввести число');
       break;
     }
     int ost = 0;
     int ost10 = 0;

     ost = num % 2;
     ost10 = num % 10;

     if (ost == 0 && ost10 == 0)
     {
       print('Число $num четное и кратное 10');
     }
     if (ost == 0 && ost10 != 0)
     {
       print('Число $num четное и не кратное 10');
     }
     if (ost == 1 && ost10 != 0)
     {
       print('Число $num не четное и не кратное 10');
     }
    break;

    case 4:
      int a = 0, num = 0, ost = 0, sum = 0;
      List<int> nums = [];
      stdout.write('Введите положительное число a: ');
      try {
        a = int.parse(stdin.readLineSync()!);
      } catch(e) {
        print('Вы ввели некорреткное a');
        break;
      }

      if (a < 0) {
        stdout.write('Вы ввели отрицательное a, введите пожалуйста положительное число');
        a = int.parse(stdin.readLineSync()!);
      }

      while (num >= 0)
      {
        print("Введите положительные числа. Чтобы закончить, введите отрицательное число: ");
        num = int.parse(stdin.readLineSync()!);
        if (num < 0) {
          break;
        }
        nums.add(num);
      }
      print('Введенные числа: $nums');

      for (int i = 0; i < nums.length; i++)
      {
        ost = nums[i] % a;
        if (ost == 0)
        {
          sum += nums[i];
        }
      }
      print('Число a: $a');
      print('Сумма введенных чисел, делящихся на число a нацело: $sum');
      break;

    case 5:
    int n = 0, m = 0;
    try {
    stdout.write('Введите количество строк в матрице: ');
    n = int.parse(stdin.readLineSync()!);
    stdout.write('Введите количество столбцов в матрице: ');
    m = int.parse(stdin.readLineSync()!);
    }catch(e) {
      print('Вы ввели некорректные данные, запустите программу снова и попробуйте ещё раз');
      break;
    }
    var a = List.generate(n, (i) => List.filled(m, 0, growable: true));

    for (int i = 0; i < a.length; i++)
    {
      for (int j = 0; j < a.length; j++)
      {
        int random = (Random().nextInt(2));
        a[i][j] = random;
      }
    }

    int sum = 0;
    for (int i = 0; i < n; i++ )
    {
      sum = 0;
      for (int j = 0; j < m; j++)
      {
        sum += a[i][j];
      }
      if (sum % 2 == 0)
      {
        a[i].add(0);
      }
      if (sum % 2 == 1)
      {
        a[i].add(1);
      }
    }


    for (int i = 0; i < n; i++){
      for (int j = 0; j < m + 1; j++){
        stdout.write('${a[i][j]} ');
      }
      stdout.writeln('\n');
    }
    break;


    case 6:
      List<double> nums = List.filled(Random().nextInt(10), 0);
      List<double> posNums = [];
      List<double> negNums = [];

      for (int i = 0; i < nums.length; ++i)
      {
        double rand = (Random().nextDouble() * 100) - 50;
        nums[i] = rand;
      }
      print('Полученный массив: $nums');
      for (int i = 0; i < nums.length; ++i)
      {
        if (nums[i] > 0)
        {
          posNums.add(nums[i]);
        }
        else if (nums[i] < 0)
        {
          negNums.add(nums[i]);
        }
      }
      print('Положительные элементы массива: $posNums');
      print('Отрицательные элементы массива: $negNums');
      break;

    default:
      print('такого задания не существует');
  }
}



