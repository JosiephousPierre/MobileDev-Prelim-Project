import 'package:riverpod/riverpod.dart';
import 'services/user_service.dart';
import 'dart:io';

// Provider for UserService
final userServiceProvider = Provider((ref) => UserService());

void main() {
  final container = ProviderContainer();
  final userService = container.read(userServiceProvider);

  print('Welcome to the User Management App!');

  while (true) {
    print('\nSelect an option:');
    print('1. Add User');
    print('2. List Users');
    print('3. Delete User');
    print('4. Exit');

    print("");
    var choice = stdin.readLineSync();
    print("");

    switch (choice) {
      case '1':
        print('Enter name:');
        var name = stdin.readLineSync() ?? '';
        print('Enter age:');
        var age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        print('Enter gender:');
        var gender = stdin.readLineSync() ?? '';
        userService.addUser(name, age, gender);
        break;

      case '2':
        userService.listUsers();
        break;

      case '3':
        print('Enter the name of the user to delete:');
        var name = stdin.readLineSync() ?? '';
        userService.deleteUser(name);
        break;

      case '4':
        print('Exiting...');
        exit(0);

      default:
        print('Invalid choice. Please try again.');
    }
  }
}