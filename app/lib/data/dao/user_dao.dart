import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_job_offer/data/dto/list_vacancies_dto.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import '../../domain/model/user.dart';

class UserDao {
  UserDao();

  static const String baseUrl = 'http://94.103.183.30:8080';
  static const String loginPath = '/login';
  static const String registerPath = '/register';
  static const String getVacanciesPath = '/get_vacancies';
  static const String formPath = '/form';

  Future<User> registerUser(
    User user,
  ) async {
    var url = '$baseUrl$registerPath';

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return User.fromJson(json.decode(response.body));
  }

  Future<User> loginUser(User user) async {
    var url = '$baseUrl$loginPath';

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Vacancy>> getVacancies(User user) async {
    var url = '$baseUrl$getVacanciesPath';

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    print(json.decode(response.body));

    return ListVacanciesDto.fromJson(json.decode(response.body)).vacancies;
  }

  Future<User> uploadForm(User user) async {
    var url = '$baseUrl$formPath';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return user;
  }

  Future<void> logout() async {
    setUser(User.getEmptyUser());
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String login = prefs.getString('login') ?? '';
    String password = prefs.getString('password') ?? '';
    return User(login: login, password: password);
  }

  Future<bool> setUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', user.login);
    return prefs.setString("password", user.password);
  }

  Future<void> responseToTheVacancy(User user, Vacancy vacancy) async {

  }
}
