import 'package:your_job_offer/domain/model/user.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import '../../domain/repository/user_repository.dart';
import '../dao/user_dao.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao userDao;

  UserRepositoryImpl(
    this.userDao,
  );

  @override
  Future<User> getUserFromLocalStorage() async {
    User user = await userDao.getUser();
    return user;
  }

  @override
  Future<User> login(User user) async {
    user = await userDao.loginUser(user);
    await userDao.setUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await userDao.logout();
  }

  @override
  Future<User> register(User user) async {
    user = await userDao.registerUser(user);
    await userDao.setUser(user);
    return user;
  }

  @override
  Future<List<Vacancy>> getVacancies(User user) async {
    return await userDao.getVacancies(user);
  }

  @override
  Future<User> uploadForm(User user) async {
    user = await userDao.uploadForm(user);
    await userDao.setUser(user);
    return user;
  }

  @override
  Future<void> responseToTheVacancy(User user, Vacancy vacancy) async {
    await userDao.responseToTheVacancy(user, vacancy);
  }

  @override
  Future<List<Vacancy>> getStatus(User user) async {
    return await userDao.getStatus(user);
  }
}
