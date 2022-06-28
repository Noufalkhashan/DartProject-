import 'dart:ffi';
import 'dart:io';

import 'package:project/project.dart' as project;

abstract class Author {
  String? name;
  Author({this.name});
}

class Book extends Author {
  int? id;
  double? price;
  String? bname;
  int? quan;
  String? name;
  Book({this.id, this.bname, this.price, this.quan});
}

printList() {
  int count = 1;
  //for (var item in books)
  for (int i = 0; i < books.length; i++) {
    print("${count++}.${books[i]}\n");
  }
}

List<Map<dynamic, dynamic>> books = [];

void main(List<String> arguments) {
  //adding the books
  books.add({
    "ID": "1",
    "Name": "Start with why",
    "Author": "Simon Sinek",
    "Price": 80,
    "Quantity": 13
  });
  books.add({
    "ID": "2",
    "Name": "But how do it",
    "Author": "J. Clark Scott",
    "Price": 59,
    "Quantity": 22
  });
  books.add({
    "ID": "3",
    "Name": "Clean Code",
    "Author": "Rebort Cecil",
    "Price": 50,
    "Quantity": 5
  });
  books.add({
    "ID": "4",
    "Name": "Zero to One",
    "Author": "Peter Thiel",
    "Price": 45,
    "Quantity": 12
  });
  books.add({
    "ID": "5",
    "Name": "You don't know",
    "Authot": "Kyle Simpson",
    "Price": 39.9,
    "Quantity": 9,
  });

  print("Welcome to Maha & Nouf BookStore!");

  int? choice;

  do {
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    print("Please enter what do you want?");
    print(
        " 1-Add book \n 2-Edit book \n 3-Delet book \n 4-Search for A Book \n 5-buying A Book \n 6-View All Books Information \n 7-Exit");
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        AddBook();
        break;

      case 2:
        EditList();
        break;
      case 3:
        RemoveList();
        break;
      case 4:
        Search();
        break;
      case 5:
        Bill();
        break;
      case 6:
        printList();
        break;
    }
  } while (choice != 7);
}

EditList() {
  print("Choose what Book do you want  ");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  printList();
  int num = int.parse(stdin.readLineSync()!);
  print(
      " 1-chage the Book name: \n 2-change the Author name: \n 3-change the price \n 4-change the quantity: ");
  int edt = int.parse(stdin.readLineSync()!);
  switch (edt) {
    case 1:
      print("Enter the new name : ");
      String newn = stdin.readLineSync()!;
      books[num - 1]["Name"] = newn;
      break;
    case 2:
      print("Enter the new Author name : ");
      String newA = stdin.readLineSync()!;
      books[num - 1]["Author"] = newA;
      break;
    case 3:
      print("Enter the new Price: ");
      String newP = stdin.readLineSync()!;
      books[num - 1]["Price"] = newP;
      break;
    case 4:
      print("Enter the new Quantity  : ");
      String newQ = stdin.readLineSync()!;
      books[num - 1]["Quantity"] = newQ;
      break;
    default:
      print("invalid input");
      break;
  }
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  print("Book list After Editing");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  printList();
}

RemoveList() {
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  print("Choose the number you want to Remove: ");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  printList();
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  int numd = int.parse(stdin.readLineSync()!);
  books.removeAt(numd - 1);
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  print("Book list After Remve");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  printList();
}

AddBook() {
  print("Please enter ID: ");
  String id = stdin.readLineSync()!;
  print("Please enter Book name: ");
  String bname = stdin.readLineSync()!;
  print("Please enter author name: ");
  String Aname = stdin.readLineSync()!;
  print("Please enter Price: ");
  int pprice = int.parse(stdin.readLineSync()!);
  print("Please enter Quantity");
  int qquan = int.parse(stdin.readLineSync()!);
  books.add({
    "ID": id,
    "Name": bname,
    "Author": Aname,
    "Prise": pprice,
    "Quantity": qquan
  });

  //print(books);
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  print("The Book List After adding A Book: ");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");

  printList();
}

Search() {
  print(" 1-Search By id: \n 2-Search By Name: \n 3-Search By Author Name");
  int edt = int.parse(stdin.readLineSync()!);
  switch (edt) {
    case 1:
      print("Enter the id: ");
      String id = stdin.readLineSync()!;
      for (int i = 0; i < books.length; i++) {
        if (books[i]["ID"] == id) {
          print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
          print("${books[i]}\n");
        }
      }
      ;
      break;

    case 2:
      print("Enter the Name: ");
      String Name = stdin.readLineSync()!;
      for (int i = 0; i < books.length; i++) {
        if (books[i]["Name"] == Name) {
          print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
          print("${books[i]}\n");
        }
      }
      ;
      break;

    case 3:
      print("Enter the Author Name: ");
      String Author = stdin.readLineSync()!;
      for (int i = 0; i < books.length; i++) {
        if (books[i]["Author"] == Author) {
          print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_\n");
          print("${books[i]}\n");
        }
      }
      ;
      break;

    default:
      print("invalid input");
      break;
  }
}

Bill() {
  //temp list to help us print the Bill
  List<Map<dynamic, dynamic>> Buying = [];

  double totalPrise = 0;
  double totaPriceOneBook;
  int IdNum;
  double QaunNum;
  int choice;
  int count1 = 1;
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  print("choose the Book u want : ");
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  printList();
  print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
  IdNum = int.parse(stdin.readLineSync()!);
  print("How many Books do u need? ");
  QaunNum = double.parse(stdin.readLineSync()!);
  if (books[IdNum - 1]["Quantity"] > QaunNum) {
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    print("Book List After: ");
    books[IdNum - 1]["Quantity"] = books[IdNum - 1]["Quantity"] - QaunNum;
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    printList();
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    totaPriceOneBook = (books[IdNum - 1]["Price"] * QaunNum);
    totalPrise = totalPrise + totaPriceOneBook;
    Buying.add(books[IdNum - 1]);
  } else {
    print("Sorry we don't have enough Books");
  }
  do {
    print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
    print(" 1-Buying anthor Book \n 2-print the Bill \n 3-Exit");
    choice = int.parse(stdin.readLineSync()!);
    if (choice == 1) {
      print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
      print("choose the Book u want : ");
      printList();
      print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
      IdNum = int.parse(stdin.readLineSync()!);
      print("How many Books do u need? ");
      QaunNum = double.parse(stdin.readLineSync()!);
      if (books[IdNum - 1]["Quantity"] > QaunNum) {
        print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
        print("Book List After: ");
        books[IdNum - 1]["Quantity"] = books[IdNum - 1]["Quantity"] - QaunNum;
        print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
        printList();
        print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
        totaPriceOneBook = (books[IdNum - 1]["Price"] * QaunNum);
        totalPrise = totalPrise + totaPriceOneBook;
        Buying.add(books[IdNum - 1]);
      } else {
        print("Sorry we don't have enough Books");
      }
    } else if (choice == 2) {
      print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
      print("            Maha & Nouf BookStore       ");
      print("${DateTime.now()}     Riyadh,PNU");
      print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
      for (int i = 0; i < Buying.length; i++) {
        print("${count1++}.${Buying[i]}\n");
      }

      print("Total Price: $totalPrise");
      print("-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
      print("            Thank you for visit!        ");
    }
  } while (choice != 3);
}
