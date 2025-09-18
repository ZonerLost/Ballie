import 'package:get/get.dart';

enum UserRole { watcher, owner }

class UserController extends GetxController {
  static UserController instance = Get.find<UserController>();
  final Rx<UserRole> _role = UserRole.watcher.obs;

  UserRole get role => _role.value;

  void chooseRole(UserRole selectedRole) {
    _role.value = selectedRole;
  }

  void resetRole() {
    _role.value = UserRole.watcher;
  }
}
