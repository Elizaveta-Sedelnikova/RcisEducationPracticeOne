import 'package:hyita/hyita.dart' as hyita;
import 'dart:io';
import 'dart:math';
void main( ) {
File input = File('input.txt');
File output = File('output.txt');

int numberOfTicket = 0;
stdout.write('Введите количество лотерейных билетов: ');
try {
numberOfTicket = int.parse(stdin.readLineSync()!);
if (numberOfTicket < 1 || numberOfTicket > 1000) {
  print('Количество билетов может быть от 1 до 1000');
}
} catch(e) {
  print('Неверные входные данные, попробуйте ещё раз');
}

final random = (Random());
List<int> randomNums = List.filled(10, 0);

for (int i = 0; i < randomNums.length; i++) {
  randomNums[i] = (random.nextInt(32)+ 1);
}
var inputOp = input.openWrite(mode: FileMode.write);
inputOp.write('Счастилвый билет: ');
inputOp.writeAll(randomNums, ' ');
inputOp.writeln('\nКоличество лотырейных билетов: $numberOfTicket');

List<int> randomNumsForTiket = List.filled(10, 0);
int temp = 0;
var outputOP = output.openWrite(mode: FileMode.write);
inputOp.writeln('Лотерейные билеты: ');
for (int i = 0; i < numberOfTicket; i++){
  for (int j = 0; j < randomNumsForTiket.length; j++){
    if (j <= 5){
      randomNumsForTiket[j] = (random.nextInt(32)+ 1);
    }
    if (j == 5) {
      for (int k = 0; k < 6; k++){
      inputOp.write('${randomNumsForTiket[k]} ');
      }
      inputOp.writeln('');
    }
    if (j > 6){
      randomNumsForTiket[j] = 0;
    }
    if (randomNums[j] == randomNumsForTiket[j - (j - 1)]){
      if (j == 9){
        outputOP.writeln('Lucky');
      }
    }
    else {
      if (temp >= 3) {
        if (j == 9){
          outputOP.writeln('Lucky');
          temp = 0;
        }
      }
      if (temp < 3) {
         if (j == 9){
          outputOP.writeln('Unlucky');
        }
      }
      continue;
    }
  }
}
}
