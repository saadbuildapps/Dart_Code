//?  ● Write a Dart program combining loops and Lists to filter odd numbers
import 'dart:io';

int range = 0;

List<int> num = [];

List<int> odd = [];

void main() {
  print('Enter the Range');

  range = int.parse(stdin.readLineSync()!);
  print('Enter the DATA \n');

  for (int i = 0; i <= range; i++) {
    print('Enter data at index $i');
    int input = int.parse(stdin.readLineSync()!);
    num.add(input);
  }
  // print('Odd Numbers are');

  for (int i = 0; i < num.length; i++) {
    if (num[i] % 2 != 0) {
      odd.add(num[i]);
    }
  }
  print('Odd Numbers are $odd');
}
