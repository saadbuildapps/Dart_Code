List<int> numbers = [1, 2, 3];

void main() {
  List<String> fruits = ['Apple', 'Banana', 'Mango'];

  fruits.add('Orange'); // Add new item
  print(fruits[0]); // Access by index
  print(fruits.length); // Length of list

  for (var fruit in fruits) {
    print(fruit);
  }
  print(numbers);

  //!  Sets :

  Set<int> ids = {1, 2, 3, 3, 4};

  ids.add(5);
  print(ids); // Output: {1, 2, 3, 4, 5

  //!  Maps :
  Map<String, int> marks = {'Math': 90, 'Science': 85, 'English': 88};

  print(marks['Math']); // Access by key
  marks['Math'] = 95; // Update value
  print(marks);

  //! Records :

  // A record with 3 values
  var user = ('Saad', 25, true);

  print(user); // (Saad, 25, true)
  print(user.$1); // Saad
  print(user.$2); // 25
  print(user.$3); // true

  // Named record
  var info = (name: 'Ali', age: 30);
  print(info.name); // Ali
  print(info.age); // 30

  // Tuple / Lightweight class , Fixed/grouped data (like returning multiple values)

  // json fromat
  Map<String, dynamic> person = {
    'name': 'Saad',
    'age': 25,
    'email': 'saad@gmail.com',
  };

  person['age'] = 26; // Update
  person['city'] = 'Lahore'; // Add

  print(user);

  var public = (name: 'Saad', age: 25, email: 'saad@gmail.com');

  print(public.name); // Saad
  print(public.age); // 25
  // user.city = 'Lahore'; ❌ Not allowed — no city field in this record
}
