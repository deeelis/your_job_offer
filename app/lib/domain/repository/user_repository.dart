import 'dart:io';

import 'package:your_job_offer/domain/model/vacancy.dart';

import '../model/user.dart';

abstract interface class UserRepository {
  Future<User> login(User user);

  Future<User> register(User user);

  Future<User> getUserFromLocalStorage();

  Future<void> logout();

  Future<List<Vacancy>> getVacancies(User user);
  Future<User> uploadForm(User user);
  Future<void> responseToTheVacancy(User user, Vacancy vacancy);
}
