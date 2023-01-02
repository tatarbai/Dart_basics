import 'dart:core';

class User {
  String email;

  User(this.email);
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin MailSystem on User {
  String getMailSystem() => email.split("@").last;
}

// как я понял, менеджер это тот же юзер но у него есть подчененные
class UserManager<T extends User> extends User {
  UserManager(String email) : super(email);

  void addUser(T usr) => _users.add(usr);
  void removeUser(T usr) => _users.remove(usr);

  void displayAllUsers() {
    print("=============");
    print("Manager $email has users:");
    print("------------");
    for (var user in _users) {
      print(user is AdminUser ? user.getMailSystem() : user.email);
    }
    print("------------\n");
  }

  final List<T> _users = [];
}

void main(List<String> arguments) {
  final usr1 = User("usr1@mail.ru");
  final admin = AdminUser("admin@mail.ru");
  final gs1 = GeneralUser("gs1@mail.ru");
  final gs2 = GeneralUser("gs2@mail.ru");

  final firstManager = UserManager("first_manager@mail.ru");

  final secondManager = UserManager("second_manager@mail.ru");

  firstManager.addUser(usr1);
  firstManager.addUser(admin);
  firstManager.addUser(gs1);
  firstManager.addUser(gs2);

  firstManager.removeUser(usr1);

  secondManager.addUser(usr1);
  secondManager.displayAllUsers();

  firstManager.displayAllUsers();
}
