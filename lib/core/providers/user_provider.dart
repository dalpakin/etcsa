import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
      : super(
          User(
            name: "",
            surname: "",
            ekoid: "",
            userType: 0,
            token: '',
          ),
        );

  void setUser(User user) async {
    state = user;
  }

  User getUser() {
    return state;
  }

  void updateUser({
    String? name,
    String? surname,
    String? ekoid,
    int? userType,
    int? id,
    String? token,
    String? email,
  }) {
    state = User(
      name: name ?? state.name,
      surname: surname ?? state.surname,
      ekoid: ekoid ?? state.ekoid,
      userType: userType ?? state.userType,
      id: id ?? state.id,
      token: token ?? state.token,
    );
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});
