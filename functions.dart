//! simple function
import 'dart:core';

void printName() {
  print('My name is saad');
}

//! return type function  & parameterized functions
int age(int a, int b) {
  return a + b;
}

//! Optional Parameters function

void showInfo(String name, [int? age]) {
  print('name : ' + name);
  if (age != null) print('age : $age');
}

//! Optional Named Parameters { }

void showDetails({String? name, int? age}) {
  print('Name: $name, Age: $age');
}

//! 6. Arrow Function (=>)
// Used for single-expression functions

int square(int x) => x * x;

//!  Accepts function as argument

void doSomething(Function fun) {
  fun();
}

void sayHi() => print("Hi!");

//!  Returns a function

Function multiplyBy(int x) {
  return (int y) => x * y;
}

//!  🔹 8. Recursive Function
// A function that calls itself — useful for problems like factorial, Fibonacci, etc.
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}


void main() {
  printName();
  int result = age(10, 3);
  print(result);
  showInfo('saad');
  showInfo('saad', 22);
  showDetails(name: 'Ahmed', age: 30);
  showDetails(); // works fine

  //! Anonymous Function (No Name)

  var list = ['a', 'b', 'c'];

  list.forEach((element) {
    print('Value: $element');
  });
  print(square(4)); // 16

  doSomething(sayHi); // Outputs: Hi!

  var times3 = multiplyBy(3);
  print(times3(4));

  print(factorial(5)); // 120
}
