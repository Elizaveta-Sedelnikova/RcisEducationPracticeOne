
import 'dart:io';
import 'dart:math';
import 'package:up_1_2/up_1_2.dart' as up_1_2;
const int month = 12;
const int day = 30;
var temperatyre = List.generate(month, (i) => List.filled(day, 0, growable: false));
List<int> middleTemperatyre = List.filled(12, 0);
Map<String, List<int>> temperatura = {};
var midtemp = {};
void main( ) {
  int task = 0;
  try {
    stdout.write('Введите номер задания: ');
    task = int.parse(stdin.readLineSync()!);
  } catch(e) {
    print('Вы ввели некоректные данные\n или');
  }

  switch(task){
    case 1:
    List<int> nums100 = List.filled(100, 0);
    int a = 100;
    for (int i = 0; i < nums100.length; i++ ){
      nums100[i] = a;
      a -= 3;
    }
    print('Масиив чисел: ');
    for (int i = 0; i < nums100.length; i++){
      stdout.write(nums100[i]);
      stdout.write(' ');
    }
    print('\n');
    break;

    case 2:

    List<int> oddNums = List.filled(50, 0);
    int a = 1;

    for (int i = 0; i < oddNums.length; i++){
      oddNums[i] = a;
      a += 2;
    }

    print('Массив нечетных чисел: ');
    for (int i = 0; i < oddNums.length; i++){
      stdout.write(oddNums[i]);
      stdout.write(' ');
    }
    stdout.writeln('\n');
    break;

    case 3: 
    try{
      final int n;
      stdout.write('Введите размер квадратной матрицы: ');
      n = int.parse(stdin.readLineSync()!);
      int m = n;
      var twoMatrix = List.generate(n, (i) => List.filled(m, 0, growable: false));
      for (int i = 0; i < 1; i++){
        for (int j = 0; j < n; j++){
          twoMatrix[i][j] = 1;
        }
      }
      for (int i = 0; i < n; i++){
        for (int j = 0; j < 1; j++){
          twoMatrix[i][j] = 1;
        }
      }

      for (int i = 1; i < twoMatrix.length; i++){
        for (int j = 1; j < twoMatrix.length; j++){
          twoMatrix[i][j] = twoMatrix[i-1][j] + twoMatrix[i][j-1];
        }
      }

      print('Полученный массив: ');
      for (int i = 0; i < twoMatrix.length; i++){
        for (int j = 0; j < twoMatrix.length; j++){
          stdout.write('${twoMatrix[i][j]} ');
        }
        stdout.writeln('\n');
      }
    } catch(e) {
      print('Вы ввели некоректные данные, запустите программу и попробуйте ещё раз');
    }
    break;

    case 4:
    final random = Random( );
    for (int i = 0; i < temperatyre.length; i++){
      stdout.write('Температура в ${i+1} месяце: ');
      for(int j = 0; j < temperatyre.length; j++){
        if (i < 2 || i > 9){
          temperatyre[i][j] = (random.nextInt(25)+ -25);
        }
        else if(i == 2 || i == 3 || i == 4 || i == 8 || i == 9){
          temperatyre[i][j] = (random.nextInt(15)+ -10);
        }
        else{
          temperatyre[i][j] = (random.nextInt(30));
        }
        stdout.write('${temperatyre[i][j]} ');
      }
      stdout.writeln('\n');
    }

    fTemperatyre(temperatyre);
    int t = 0;
    for (int i = 0; i < middleTemperatyre.length - 1; i++){
      for (int j = 0; j < middleTemperatyre.length - i - 1; j++){
        if (middleTemperatyre[j + 1] < middleTemperatyre[j]){
          t = middleTemperatyre[j + 1];
          middleTemperatyre[j + 1] = middleTemperatyre[j];
          middleTemperatyre[j] = t;
        }
      }
    }

    print('Средние температуры за год: ');
    for (int i = 0; i < middleTemperatyre.length; i++){
      stdout.write('${middleTemperatyre[i]} ');
    }
    print('\n');
    break;

    case 5:

    final random = Random();

    Map temperatura = {
    "Январь": List.generate(30, (_) => random.nextInt(30) * -1),
    "Февраль": List.generate(30, (_) => random.nextInt(30) * -1),
    "Март": List.generate(30, (_) => random.nextInt(30) * -1),
    "Апрель": List.generate(30, (_) => random.nextInt(17)),
    "Май": List.generate(30, (_) => random.nextInt(17)),
    "Июнь": List.generate(30, (_) => random.nextInt(30)),
    "Июль": List.generate(30, (_) => random.nextInt(30)),
    "Август": List.generate(30, (_) => random.nextInt(30)),
    "Сентябрь": List.generate(30, (_) => random.nextInt(15) + 3),
    "Октябрь": List.generate(30, (_) => random.nextInt(15) + 3),
    "Ноябрь": List.generate(30, (_) => random.nextInt(30) * -1),
   "Декабрь": List.generate(30, (_) => random.nextInt(30) * -1)
   }; 

   print('Погода за год: ');
   for (var item in temperatura.entries) {
    print('${item.key}: ${item.value}');
   }

   print(' ');

   print('СРЕДНИЕ ТЕМПЕРАТУРЫ: ');
   fMIddleTempYear(temperatura);
   break;

   default: 
   print('такого задания не существует, попробуйте ещё раз');
  }
}

List<int> fTemperatyre(var tempertyre){
int sum = 0;
int middletemp = 0;
  for (int i = 0; i < month; i++){
    for (int j = 0; j < day; j++){
      int b = temperatyre[i][j];
      sum += b;
    }
    middletemp = sum ~/ 30;
    middleTemperatyre[i] = middletemp;
    sum = 0;
  }
return middleTemperatyre;
}

Map fMIddleTempYear (temperatura) {
Map<String, int> middleTemp = {
"Январь": 0,
"Февраль": 0,
"Март": 0,
"Апрель": 0,
"Май": 0,
"Июнь": 0,
"Июль": 0,
"Август": 0,
"Сентябрь": 0,
"Октябрь": 0,
"Ноябрь": 0,
"Декабрь": 0
};

for (var key in middleTemp.keys) {
double summa1 = 0;
for (int i = 0; i < 30; ++i) {
summa1 += temperatura[key]![i];
}
middleTemp[key] = summa1 ~/ 30;
}
for (var value1 in middleTemp.entries) {
print ("${value1.key} - ${value1.value}");
}
return middleTemp;
}




