part of 'providers.dart';

class UserProvider extends ChangeNotifier {
  UserModel tempUser;
  UserModel get user => tempUser;

  Future<void> setUser(UserModel user) async {
    tempUser = user;
    notifyListeners();
  }
}
