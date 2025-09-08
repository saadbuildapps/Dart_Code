import 'dart:io';

// ---------------------- Abstract Class ----------------------
abstract class Students {
  late int id;
  void setData();
}

// ---------------------- Student Data Class ----------------------
class StudentData extends Students {
  @override
  late int id;
  late String names;
  Map<int, Map<String, dynamic>> students = {};
  late int totalStudents;

  @override
  void setData() {
    print('Enter total number of Students: ');
    totalStudents = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < totalStudents; i++) {
      print('\nEnter data for Student ${i + 1}:');
      stdout.write('Enter Student ID (number): ');
      id = int.parse(stdin.readLineSync()!);

      if (students.containsKey(id)) {
        print('❌ This ID already exists. Try another.');
        i--;
        continue;
      }

      stdout.write('Enter student name: ');
      names = stdin.readLineSync()!;

      Map<String, int> marks = {};
      stdout.write('Enter marks for Maths: ');
      marks['Maths'] = int.parse(stdin.readLineSync()!);
      stdout.write('Enter marks for English: ');
      marks['English'] = int.parse(stdin.readLineSync()!);
      stdout.write('Enter marks for Urdu: ');
      marks['Urdu'] = int.parse(stdin.readLineSync()!);

      students[id] = {'name': names, 'marks': marks};

      print('✅ Student $names added with ID $id\n');
    }
  }

  void showData(int searchId) {
    if (students.containsKey(searchId)) {
      var student = students[searchId]!;
      print('\n👤 Student ID: $searchId');
      print('👤 Name: ${student['name']}');

      Map<String, int> marks = student['marks'];
      print('📚 Marks:');
      marks.forEach((subject, score) {
        print('$subject: $score');
      });

      int totalMarks = marks.values.reduce((a, b) => a + b);
      print('📊 Total Marks: $totalMarks');

      Grades.showGrades(totalMarks);
    } else {
      print('❌ Student with ID $searchId not found.');
    }
  }
}

// ---------------------- Grades Class ----------------------
class Grades {
  static void showGrades(int marks) {
    if (marks >= 240) {
      print('🏆 Grade: A+');
    } else if (marks >= 180) {
      print('🎖️ Grade: A');
    } else if (marks >= 120) {
      print('🎖️ Grade: B');
    } else if (marks >= 60) {
      print('🎖️ Grade: C');
    } else {
      print('Grade: ❌ You failed.');
    }
  }
}

// ---------------------- Grades Menu ----------------------
void gradesMenu() {
  StudentData std = StudentData();

  while (true) {
    print('''
============= 🎓 Grades Management Menu =============
1. Add Student Data
2. Show Student Data with Grades
3. Exit to Main Menu
=====================================================
Enter your choice:
''');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        std.setData();
        break;
      case 2:
        stdout.write('Enter Student ID to search: ');
        int id = int.parse(stdin.readLineSync()!);
        std.showData(id);
        break;
      case 3:
        print("👋 Returning to Main Menu...");
        return;
      default:
        print('❌ Invalid choice. Try again.\n');
    }
  }
}

void main() {
  stdout.write("👋 Enter your name (Admin): ");
  String admin = stdin.readLineSync()!;
  print("✅ Welcome $admin!\n");

 gradesMenu() ; 
}
