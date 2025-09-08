void main() {
  for (int i = 0; i <= 10;) {
    i++;
    print(i);
  }

  print('Second Loop');
  for (int i = 0; i <= 10; i++) {
    print(i);
  }

  print('While Loop');
  int i = 0;
  while (i < 10) {
    print('saad + $i');
    i++;
  }
  print('Do While Loop');

  int a = 0;
  do {
    print('Jeux   1');
    a++;
  } while (a < 10);

  List<String> names = ['saad', 'Nadeem', 'ali'];
  print('For Each Loop');

  names.forEach((name) {
    print('Helo   ' + name);
  });


  //! forEach with Set

  Set<int> numbers = {1, 2, 3};

  numbers.forEach((num) {
    print('Number: $num');
  });
//! forEach with Map

  Map<String, int> marks = {
    'Math': 90,
    'Science': 85,
    'English': 80,
  };

  marks.forEach((subject, mark) {
    print('$subject: $mark');
  });
}

