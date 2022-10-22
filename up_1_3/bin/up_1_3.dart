import 'package:up_1_3/up_1_3.dart' as up_1_3;
import 'dart:io';

void main( ) {
int task = 0;
try{
stdout.write('Введите номер задания: ');
task = int.parse(stdin.readLineSync()!);
} catch(e){
  stdout.write('Введено неверное значение или ');
}
switch(task){
  case 2:
  try{
  File f = File('task2.txt'); 
  dynamic values = (f.readAsStringSync());
  List<String> stringHeight = values.split(",");
  List<int> height = stringHeight.map(int.parse).toList();

  for (int i = 0; i < height.length; i++){
    int ost = height[i] % 2;
    if (ost == 0){
      height.removeAt(i);
    }
  }

  f.writeAsStringSync('');
  f.writeAsStringSync(height.join(" " ));
  print(f.readAsLinesSync());
  } catch(r) {
    print('Все чётные числа из файла уже удалены');
  }
  break;

  case 3: 
  File f = File('task3.txt');
  dynamic values = (f.readAsStringSync());
  List<String> stringHeight = values.split(",");
  List<int> height = stringHeight.map(int.parse).toList();

  int l = 0;
  int r = height.length - 1;
  int volume = 0;

  while (l != r) {
  int distance = (l - r).abs();
  int space;
  if (height[l] < height[r]) {
  space = height[l] * distance;
  l++;
  } else {
  space = height[r] * distance;
  r--;
  }

  if (space > volume) {
  volume = space;
  }
  }
  stdout.write('Объём наибльшего контейнера $volume');
  stdout.writeln();
  break;

  default:
  stdout.write('такого задания не существует, попробуйте ещё раз...');
  stdout.writeln();
  }
}

