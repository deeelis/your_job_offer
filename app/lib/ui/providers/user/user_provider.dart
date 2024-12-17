import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_job_offer/core/providers.dart';

import '../../../domain/model/user.dart';

part 'user_provider.g.dart';

@riverpod
class UserState extends _$UserState {
  @override
  Future<User> build() async {
    User user =
        await ref.read(userRepositoryProvider).getUserFromLocalStorage();
    try {
      user = await ref.read(userRepositoryProvider).login(user);
    } on Exception {
      user = User.getEmptyUser();
    }
    return user;
  }

  Future<User> login(User user) async {
    user = await ref.read(userRepositoryProvider).login(user);
    state = AsyncValue.data(user);
    return user;
  }

  Future<User> register(User rawUser) async {
    final user = await ref.read(userRepositoryProvider).register(rawUser);
    state = AsyncValue.data(user);
    return user;
  }

  Future<void> logout() async {
    await ref.read(userRepositoryProvider).logout();
    state = AsyncValue.data(User.getEmptyUser());
  }

  Future<void> updateUser(User user) async {
    state = AsyncValue.data(user);
    print(state.valueOrNull?.login);
  }

  Future<void> uploadForm(User user) async {
    user = await ref.read(userRepositoryProvider).uploadForm(user);
    state = AsyncValue.data(user);
  }

  Future<void> updateForm(User user) async {
    user = await ref.read(userRepositoryProvider).updateForm(user);
    state = AsyncValue.data(user);
  }
}
