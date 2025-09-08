/*
void main() {
  int? a = 0;
  var selfdetected = 3.3;

  String name = '';

  double price = 0.0;

  bool isLogin = true;
  if (a == 10) {
    if (a != 9) ;

    print('this is the integer a : $a');
  } else if (selfdetected == 3.5) {
    var Var = 3.3 + 3;
    selfdetected = Var;

    print('this is var : $selfdetected');
  } else if (price == 0.1 || price == 0.0 || price != 1) {
    print('price  is : 0.0');
  } else {
    print('nothing ');
  }
}
*/

//!  SWITCH  CASE ::::

void main() {
  int day = 2;

  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesdat");
      break;
    default:
      print("Other day");
  }
}

//? know about this ---->  :: 


//!  1. Inferred_type: 
// var x = 10;       // Mutable, type inferred
// Dart automatically guesses the data type based on the value.

//!  2. Explicit Type:
// var name = 'Ali';       // Type inferred as String
// String city = 'Lahore'; // Explicit type 
// You are manually telling Dart: “This variable is a String.”
// No guessing — the type is clearly written.
//* Example : String  name = 'Saadullah' ; 

//!  3. @Immutable: 
// They are immutable, meaning their values cannot be changed once they are set


//! final Key_Word:
// --> final is immutable once assign can't change the value: 
// --> Value is assigned once at runtime

// Cannot be changed after that

// Useful when value is not known in advance, but should never change once set

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
//*  Feature	                       final                      const
// 1. Changeable?             	     ❌ No	                  ❌ No
// 2. Set at?	                       Runtime	               Compile-time
// (Supports DateTime,               ✅ Yes	                ❌ No
// API data?) 	
// Best for                          (Dynamic values           Fully fixed values
//                                   that don't change)	         