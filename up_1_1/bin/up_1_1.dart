import 'package:up_1_1/up_1_1.dart' as up_1_1;
import 'dart:io';
import 'dart:math';

var nums = List<int>.filled(10, 0);
void main( ) {
int task = 0;
try{
stdout.write('Введите номер задания: ');
task = int.parse(stdin.readLineSync()!);
} catch(e) {
  print('Введены некорректные данные, запустите программу и попробуйте ещё раз \n или');
}

switch(task){
  case 1:

  fRandomTask1(); //функция, рандомно заполняющая массив числами от 1 до 10
  print('Массив случайных чисел: ');
  for (int i = 0; i < nums.length; i++){
    stdout.write('${nums[i]} ');
  }
  print('');
  
  int i1 = 0, min = nums[0]; 
  for (int i = 0; i < nums.length; i++){
    if (min > nums[i]){
    min = nums[i];
    i1 = i;
    }
  }
  print('Номер минимального элемента $min: $i1');

  break;

  case 2:
  try{
  List<int> nums = List.generate(1, (int i) => i, growable: true);
  int sum = 0, mult = 1, middle = 0;

  for (int i = 0; i < nums.length; i++){
    stdout.write('Введите число: ');
    int a = int.parse(stdin.readLineSync()!);
    nums.insert(i, a);
    if(a == 0){
      break;
    }
  }

  nums.removeAt(nums.length - 1);// удаляет лишний ноль введенный пользователем

  stdout.write('Полученный массив: ');
  for (int i = 0; i < nums.length - 1; i++){
    stdout.write('${nums[i]} ');
  }
  print(' ');

  for(int i = 0; i < nums.length; i++){
    sum += nums[i];
    if(nums[i] != 0){
     mult *= nums[i];
    }
  }

  print('Сумма введенных чисел: $sum ');
  print('Произведение введенных чисел: $mult');
  print('Среднее значение: ${middle = sum ~/ (nums.length - 1)}');
} catch(e){
  print("Введены не верные входные данные..\nПовторите попытку ");
}
  break;
  
  case 3:
  List<String> elements = [' '];
  
  for(int i = 0; i < elements.length; i++){
    print('Введите новый элемент списка: ');
    String element = stdin.readLineSync()!;
    elements.add(element);
    if(element == ''){
      break;
    }
  }
  
  for (int i = 1; i < elements.length; i++) {
    elements.remove('');
    elements.remove(' ');
  }

  print('Все введенные объекты: ');
  for(int i = 0; i < elements.length; i++){
    stdout.write('[${elements[i]}]');
    stdout.write(' ');
  }
  stdout.writeln();

  int min = elements[0].length;
  String shortelement = ' ';
  for (int i = 0; i < elements.length; i++){
    if(min >= elements[i].length){
      min = elements[i].length;
      shortelement = elements[i];
    }
  }

  int max = elements[0].length;
  String longelement = ' ';
  for (int i = 0; i < elements.length; i++){
    if(max <= elements[i].length){
      max = elements[i].length;
      longelement = elements[i];
    } 
  }

  print('Самый короткий элемент: [$shortelement]');
  print('Самый длинный элемент: [$longelement]');
  break;
  
  case 4:
  try{
  int up = 0;
  int down = 0;
  stdout.write('Введите начало диапазона: ');
  up = int.parse(stdin.readLineSync()!);
  stdout.write('Введите конец диапазона: ');
  down = int.parse(stdin.readLineSync()!);

  fRandomTask4(up, down, nums);
  print('Полученный массив: ');
  for (var n in nums){
    stdout.write('$n ');
  }
  stdout.writeln('\n');
  } catch(e){
    print('Введены не коректные данные, запустите программу по новой');
  }
  
  break;

  case 5:
  stdout.write('Напишите предложение: ');
  String? word = stdin.readLineSync()!;
  List<String> newlist = word.split(' ');
  
  newlist.add(' End');
  newlist.insert(0, 'Start ');
  for (int i = 0; i < newlist.length; i++) {
    newlist.remove('');
    newlist.remove(' ');
  }

  int lenght = newlist.length;
  stdout.write('Ваше предложение:');
  for(int i = 0; i < newlist.length; i++){
    stdout.write(newlist[i]);
    stdout.write(' ');
  }
  print(' ');
  print('Количество слов в предложении: ${lenght - 2} ');
  break;

  default: 
  print('такого задания не существует, попробуйте ещё раз');
  }

}

void fRandomTask1( ){
  for (int i = 0; i < nums.length; i++){
    nums[i] = (Random().nextInt(11));
  }
}

List<int> fRandomTask4 (int up, int down, List<int> nums){
  for(int i = 0; i < nums.length; i++){
    nums[i] = (Random().nextInt(down - up) + up);
  }
  return nums;
}

