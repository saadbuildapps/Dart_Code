// import 'dart:io';

// int range = 0;
// List<int> common = List.filled(range, 0);

// List<int> number = [];
// void main() {
//   print('Enter  the range');
//   range = int.parse(stdin.readLineSync()!);

//   for (int i = 0; i < range; i++) {
//     print('Enter the Numbers at index $i ');
//     int num = int.parse(stdin.readLineSync()!);
//     common[i] = num;
//   }

//   List<int> a = [];

//   print('List Numbers Are : ');
//   common.forEach((num) {
//     a = common;
//   });
//   print(a);
// }

// void main() {
//   List<int> num = [1, 2, 3, 4, 5, 6,  7,8,9,10];
//   for (int i = 0; i < num.length; i++) {
//     if (num[i] % 2 == 0) {
//       print(num[i]);
//     } else {
//       continue;
//     }
//   }
// }

void main() {
  List<int> common = [1, 2, 3, , 5, 5, 5, 7, 8, 9, 10, 11, 1, 2, 3, 10];
  List<int> freq = List.filled(100, 0);

  for (int i = 0; i < common.length; i++) {
    freq[common[i]]++;    0 = 1  , 1 = 2 ,  2  = 3 , 3 = 5 , 4 = 5 , 5 = 5 
    freq[1] = 1 
    freq[2] =  1 
    freq[3] = 1
    freq[5] = 1 ;  
    freq[5] =2 

    freq[5] = 3 

  }

  for (int i = 0; i < freq.length; i++) {
    if (freq[i] > 1) {
      print(i);
    }
  }

  // check the common nnumbers in List
}
