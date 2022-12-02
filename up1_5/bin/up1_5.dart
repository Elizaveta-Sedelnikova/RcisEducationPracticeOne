import 'package:up1_5/up1_5.dart' as up1_5;
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
      File f = File('numsTask1.txt');
      dynamic values = (f.readAsStringSync());
      List<String> stringHeight = values.split(" ");
      List<int> nums = stringHeight.map(int.parse).toList();
      print(nums);

      int min = nums[0];
      int c = 0;
      for (int i = 0; i < nums.length; ++i)
      {
        if (nums[i] < min)
        {
          min = nums[i];
          c = i;
        }
      }
      int mult = 1;
      for (int i = 0; i < nums.length; ++i)
      {
        if (i > c)
        {
          mult *= nums[i];
        }
      }

      print('Миниамльный элемент: $min');
      print('Произведение элементов массива после минимального элемента: $mult');
    break;


    case 2:
    try {
      File task2 = File('numsTask2.txt');
      dynamic values = (task2.readAsStringSync());
      List<String> stringHeight = values.split(";");
      List<double> nums = stringHeight.map(double.parse).toList();
      print('Последовательность чисел $nums');

      for (int i = 0; i < nums.length; i++)
      {
        for (int j = 0; j < nums.length - 1; j++)
        {
          if (nums[j] > nums[j + 1])
          {
            double a = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = a;
          }
        }
      }
      print('Отсортированная последовательность чисел, записанная в файл $nums');

      var inTask2 = task2.openWrite(mode: FileMode.write);
      inTask2.write(nums);
    } catch(e) {
      print('Числа уже отсортированны');
    }
    break;

    case 3:
    File f = File('numsTask3.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringHeight = values.split(" ");
    List<int> nums = stringHeight.map(int.parse).toList();
    print(nums);
    int min = nums[0];
    int c = 0;
    for (int i = 0; i < nums.length; ++i)
    {
      if (nums[i] < min)
      {
        min = nums[i];
        c = i;
      }
    }
    int sum = 0;
    for (int i = 0; i < c; ++i)
    {
      sum += nums[i];
    }
    print('Миниамльный элемент: $min');
    print('Среднее арифметическое элементов расположенных до минимального: ${sum / c}');
    break;

    case 4:
    File f = File('numsTask4.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringHeight = values.split(" ");
    List<int> nums = stringHeight.map(int.parse).toList();
    print(nums);

    int max = nums[0];

    for (int i = 0; i < nums.length; ++i) {
      if (nums[i] > max) {
        max = nums[i];
      }
    }
    print('Максимальный элемент: $max');

    int target = max - 1;
    int count = 0;
    for (int i = 0; i < nums.length - 1; ++i)
    {
      for (int j = i + 1; j < nums.length; ++j)
      {
        if (target == nums[j] + nums[i])
        {
          print('${nums[j]} + ${nums[i]} = $target');
          count++;
        }
      }
    }

    if (count == 0)
    {
      print('Суммы элементов равной $target не существует');
    }
    break;

    case 5:
    File f = File('numsTask5.txt');
    dynamic values = (f.readAsStringSync());
    List<String> stringHeight = values.split(" ");
    List<int> nums = stringHeight.map(int.parse).toList();
    print(nums);

    int min = nums[0];
    int max = nums[0];
    int iMin = 0, iMax = 0, count = 0;
    for (int i = 0; i < nums.length; ++i)
    {
      if (nums[i] < min)
      {
        min = nums[i];
        iMin = i;
      }
      if (nums[i] > max)
      {
        max = nums[i];
        iMax = i;
      }
    }
    int sum = 0;
    for (int i = 0; i < nums.length; ++i)
    {
      if (i > iMin && i < iMax)
      {
        sum += nums[i];
        count++;
      }
      else if (i > iMax && i < iMin)
      {
        sum += nums[i];
        count++;
      }
    }

    print('Минимальный элемент: $min');
    print('Максимальный элемент: $max');
    if (count > 0)
    {
    print('Среднее арифметическое элементов расположенных между минимальным и максимальным : ${sum / count}');
    }
    if (count == 0)
    {
      print('Между минимальным и максимальным нет других элементов');
    }
      break;

    default:
      print('такого задания не существует');
  }
}