
  //! What is Dart?
/*
    Dart is a client-optimized, general-purpose programming language developed by Google.
    It is widely used to build mobile, web, desktop, and backend applications.
    Most popularly, it is used in the Flutter framework for building cross-platform apps.
*/

//! client-optimized:
/*
    Dart is designed to run fast and efficiently on the user’s device (client side),
    especially for UIs and interactive apps.
*/


//! DATA TYPES --->> 
//! 1. Primitive Data_Type: 

//* Primitive types are the most basic types of data, predefined by the programming language. 
//* They are Immutable, meaning their values cannot be changed once they are set.
//* int: double : bool: String: byte: null:represents the absence of a value : char used in c ++ and java 
 
//!  2. Non-Primitive Data_Types:
/* 
    Non-primitive types (also known as reference types) are more complex types derived from primitive data types.
    They are usually created by the programmer and are not predefined. Non-primitive types store references
    (memory addresses) to the actual data
*/

//! Examples in Dart:
//*  1. List:  2. Set:   3. Map:  4. Custom Classes:   5. Arrays:   6. Objects: 



//!  - - - - - - - - - - - CONST  &  FINAL - - - - - - - - - - - 


//!  1. Inferred_type: 
/* var x = 10;       //* Mutable, type inferred
   Dart automatically guesses the data type based on the value.
 */

//!  2. Explicit Type:
/* 
   var name = 'Ali';       // Type inferred as String
   String city = 'Lahore'; // Explicit type 
   You are manually telling Dart: “This variable is a String.”
   No guessing — the type is clearly written.
//* Example : String  name = 'Saadullah' ; 
*/

//!  3. @Immutable: 
// They are immutable, meaning their values cannot be changed once they are set


//! final Key_Word:
/* 
--> final is immutable once assign can't change the value: 
--> Value is assigned once at runtime
    Cannot be changed after that
    Useful when value is not known in advance, but should never change once set
*/
//!  Example:

// final currentTime = DateTime.now();  // Allowed
// print(currentTime);
// DateTime.now() //* value will be set when app runs

// You can't change it later, but it’s not known at compile-time


//!  What is const?
// Value is known at compile time
// Used for values that are always the same
// More optimized (stored only once in memory)

//! ✅ Example:

// const pi = 3.14;
// const city = 'Lahore';
//* But this is NOT allowed:

// const currentTime = DateTime.now();  // ❌ Error: not a compile-time constant


//! 🧠 Memory Example:

// final name1 = 'Ali';
// final name2 = 'Ali';  // Stored twice in memory

// const name3 = 'Ali';
// const name4 = 'Ali';  // Shared same memory (more efficient)


//! ✅ Example Comparing All

// void main() {
//   final currentYear = DateTime.now().year;  // ✅ Allowed
 // const currentYear = DateTime.now().year; // ❌ Not allowed

//   const pi = 3.14;   // ✅ Allowed
  // final pi = 3.14; // ✅ Also allowed
// }
//!  📝 Summary:
//* Feature	                       final                      const
// 1. Changeable?             	     ❌ No	                  ❌ No
// 2. Set at?	                       Runtime	               Compile-time
// (Supports DateTime,               ✅ Yes	                ❌ No
// API data?) 	
// Best for                          (Dynamic values           Fully fixed values
//                           that don't change)	         



//!  - - - - - - - - - - - - - - -    OOP     - - - - - - - - - - - - - -


//! Encapsulation

Encapsulation means hiding the internal details of a class and only exposing what
is necessary to the outside world.


Encapsulation ka matlab hai ke data ko "lock" kar do aur bahar walon ko sirf zaroori gate
(method) ke zariye access do.
Matlab:
Direct access nahi — sirf control ke zariye.

//!How to achieve Encapsulation in Dart?
* Use _private variables
* Create public getters & setters (functions) to access the

//! Examples : 

class BankAccount {
  double _balance = 0; // 👈 private variable (starts with underscore)

  // public method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  // public method to get balance
  double getBalance() {
    return _balance;
  }
}

void main() {
  var account = BankAccount();

  account.deposit(1000); // ✅ allowed
  print("Balance: ${account.getBalance()}"); // ✅ allowed

  // account._balance = 0; ❌ Not allowed outside class
}


 //! Examp--> 2.

 class Student {
  String _name = "";

  // Getter
  String get name => _name;

  // Setter
  set name(String newName) {
    if (newName.length >= 3) {
      _name = newName;
    }
  }
}

void main() {
  var s = Student();
  s.name = "Ali";           // ✅ via setter
  print(s.name);            // ✅ via getter
} 


//!  What is Polymorphism?
 Polymorphism means: "many forms".
Ek hi method ya function, different behavior show karta hai depending on the object.


//!Urdu-style Explanation:
Polymorphism ka matlab hai:
Ek naam, lekin kaam har jagah mukhtalif.
Jaise:
draw() method Circle mein circle banaye
draw() method Square mein square banaye
Naam same → kaam alag.

//! Example :
class Animal {
  void speak() {
    print("Animal makes a sound");
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print("Dog barks");
  }
}

class Cat extends Animal {
  @override
  void speak() {
    print("Cat meows");
  }
}

void main() {
  Animal a;

  a = Dog();
  a.speak();   // Output: Dog barks

  a = Cat();
  a.speak();   // Output: Cat meows
}


//! ❌ Dart does NOT support method overloading
You cannot do this in Dart:

// ❌ NOT allowed in Dart
void printData(int x) { ... }
void printData(String s) { ... }


//!  What is Abstraction?
Abstraction means hiding unnecessary details and only showing relevant things.

abstract class Animal {
  void makeSound(); // abstract method
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Bark!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

void main() {
  Animal dog = Dog();
  Animal cat = Cat();

  dog.makeSound(); // Bark!
  cat.makeSound(); // Meow!
}


//!  Using implements keyword (Strict abstraction)
abstract class Vehicle {
  void start();
  void stop();
}

class Car implements Vehicle {
  @override
  void start() => print("Car started");

  @override
  void stop() => print("Car stopped");
}


//!  Inheritance :part '


//! Single Inheritance : 

class Animal {
  void eat() => print("Eating");
}

class Dog extends Animal {
  void bark() => print("Barking");
}

//! MultiLevel_Inheritance:

class Animal {
  void eat() => print("Eating");
}

class Dog extends Animal {
  void bark() => print("Barking");
}

class Puppy extends Dog {
  void weep() => print("Weeping");
}


//! Hierarchal Inheritance :part 

class Animal {
  void eat() => print("Eating");
}

class Dog extends Animal {
  void bark() => print("Barking");
}

class Cat extends Animal {
  void meow() => print("Meowing");
}
//! ❌ 4. Multiple Inheritance (Not via extends)
2 parent classes → 1 child class
Dart does NOT allow this directly ,


//! Hybrid Inheritance:part 

class Animal {
  void eat() => print("Eating");
}

mixin Fly {
  void fly() => print("Flying");
}

mixin Swim {
  void swim() => print("Swimming");
}

class Bird extends Animal with Fly, Swim {}

void main() {
  var b = Bird();
  b.eat();
  b.fly();
  b.swim();
}
 

//! Mixin :part 


mixin A {
  void showA() => print("A");
}

mixin B {
  void showB() => print("B");
}

class C with A, B {}

void main() {
  var obj = C();
  obj.showA(); // A
  obj.showB(); // B
}



 //! - - - - - - - - - - - -    CONSTRUCTORS    - - - - - - - - - - - - 

 //! Constructor:part 
 A constructor is a special method that runs automatically when you create an object of a class

//! Default Constructor:
class Person {
  Person() {
    print("Default constructor called");
  }
}

void main() {
  var p = Person(); // auto call
}
//! Parameterized Constctor

class Student {
  String name;
  int age;

  Student(this.name, this.age); // shorthand

  void show() => print("Name: $name, Age: $age");
}

void main() {
  var s = Student("Ali", 20);
  s.show();
}

//! Named COnstructor 

class Teacher {
  String name;
  int age;

  Teacher.named(this.name, this.age); // named constructor

  void show() => print("Teacher: $name, Age: $age");
}

void main() {
  var t = Teacher.named("Sara", 30);
  t.show();
}


//!  Named COnstructor with Optional Parameters
class Book {
  String title;
  String? author;

  Book({required this.title, this.author = "Unknown"});

  void show() => print("Book: $title by $author");
}

void main() {
  var b1 = Book(title: "Dart Guide");
  var b2 = Book(title: "Flutter", author: "Ali");

  b1.show();
  b2.show();
}
//! Required Named Parameters (Dart 2.12+)
class Laptop {
  String brand;
  int price;

  Laptop({required this.brand, required this.price});

  void show() => print("$brand costs $price");
}

void main() {
  var l = Laptop(brand: "HP", price: 70000);
  l.show();
}
//!  Initializer List Constructors  
    ** Set value before constructor body runs **
class Laptop {
  String brand;
  int price;

  Laptop({required this.brand, required this.price});

  void show() => print("$brand costs $price");
}

void main() {
  var l = Laptop(brand: "HP", price: 70000);
  l.show();
}

//!  Redirecting Constuctor:


class Point {
  int x, y;

  Point(this.x, this.y);

  Point.origin() : this(0, 0); // redirects to main constructor
}

void main() {
  var p = Point.origin();
  print("Point: ${p.x}, ${p.y}");
}


//!  Const Constructor:
    ** Used for compile-time constants **

 class AppConfig {
  final String name;
  const AppConfig(this.name);
}

void main() {
  const app = AppConfig("MyApp");
  print(app.name);
}

//! Factory Constructor:
 **  When you want to return a new object, cached object, or control object creation.  **




