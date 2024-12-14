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
  static const String getStatusPath = '/get_status';

  Future<User> registerUser(
    User user,
  ) async {
    var url = '$baseUrl$registerPath';
    print(user.professionalRole?.name.toString());

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return User.fromJson(json.decode(response.body));
    // return user;
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
  Future<List<Vacancy>> getStatus(User user) async {
    var url = '$baseUrl$getStatusPath'; //todo normal path

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    print('STATUS');
    print(json.decode(response.body));

    return ListVacanciesDto.fromJson(json.decode(response.body)).vacancies;
  }
}

String s = '''{
    "vacancies": [
{
"id": 1,
"job": "E-commerce аналитик",
"description": "",
"min_salary": 80000,
"max_salary": 120000,
"address": "",
"link": "https://api.hh.ru/vacancies/111992232?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=111992232",
"phone": null,
"email": null,
"employer": "BID CONSULT LLC",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "part",
"schedule": "remote",
"has_test": false,
"requirement": "Знание базового английского. Честность, порядочность. Аналитические навыки, внимательность. Усидчивость, умение работать с монотонной задачей. Обучаемость. Работа в интернете - необходимо иметь...",
"responsibility": "Поиск подходящих товаров с помощью специальных программ на интернет площадке Amazon по определенным критериям. Заполнение и анализ данных в Excel. ",
"area": "Павлодар",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 2,
"job": "Аналитик DWH",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "Москва, Славянская площадь",
"link": "https://api.hh.ru/vacancies/112304365?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=112304365",
"phone": null,
"email": null,
"employer": "ПСБ (ПАО «Промсвязьбанк»)",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "fullDay",
"has_test": true,
"requirement": "Опыт работы на должности аналитика данных/бизнес-аналитика от 2 лет. Опыт работы в банке или финансовых компаниях. ",
"responsibility": "Участие в подготовке описания бизнес-архитектуры данных. Отслеживание происхождения и анализ влияния данных. Определение источников загрузки данных. Согласование с бизнес...",
"area": "Москва",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 3,
"job": "Junior Аналитик Данных",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "",
"link": "https://api.hh.ru/vacancies/112958533?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=112958533",
"phone": null,
"email": null,
"employer": "ОсОО Форвис Мазарс ТЦК",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "fullDay",
"has_test": false,
"requirement": "Английский язык - B1+ B2 (upper intermediate). Опыт разработки отчетов в Power BI / Tableau до 2 лет. ",
"responsibility": "Сбор и формализация требований клиента к анализу данных. Анализ потоков данных в организациях и обеспечение качества данных. Создание эффективных и...",
"area": "Бишкек",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 4,
"job": "Стажер в IT отдел",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "Санкт-Петербург, Комендантский проспект",
"link": "https://api.hh.ru/vacancies/110332213?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=110332213",
"phone": null,
"email": null,
"employer": "Автозавод Санкт-Петербург",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "probation",
"schedule": "fullDay",
"has_test": false,
"requirement": "Студент старших курсов ВУЗа (4 курс бакалавриат, 1-2 курс магистратуры). Имеете опыт работы с базами данных. Знаете и работаете...",
"responsibility": "Отдел информационных систем:",
"area": "Санкт-Петербург",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 5,
"job": "Data Analyst",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "Москва, Овчинниковская набережная",
"link": "https://api.hh.ru/vacancies/112731457?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=112731457",
"phone": null,
"email": null,
"employer": "PARI",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "fullDay",
"has_test": false,
"requirement": "Высокий уровень навыка критического мышления в пересечении с софт навыками защиты своей позиции на данных и выводах. Глубокое понимание методологий...",
"responsibility": "Развитие и создание зон роста компании через данные, оптимизацию процессов и предложение альтернатив текущему формату. Быть гарантом валидного и корректного...",
"area": "Москва",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 6,
"job": "Аналитик данных (MS Excel)",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "",
"link": "https://api.hh.ru/vacancies/113015466?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=113015466",
"phone": null,
"email": null,
"employer": "МФК ВЭББАНКИР",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "remote",
"has_test": false,
"requirement": "Уверенное владение MS Excel, включая создание и использование макросов. Базовые навыки работы с SQL (желательно). Опыт работы в 1С. ",
"responsibility": "Проверка корректности начисления резервов и расчетов дней просрочки. Подготовка данных для ответов на запросы Центрального Банка. Участие в формировании выгрузок...",
"area": "Москва",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 7,
"job": "Стажер - аналитик данных",
"description": "",
"min_salary": null,
"max_salary": null,
"address": "",
"link": "https://api.hh.ru/vacancies/113103733?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=113103733",
"phone": null,
"email": null,
"employer": "Технологии Доверия",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "part",
"schedule": "remote",
"has_test": false,
"requirement": "Какие мы предъявляем требования к кандидатам: Опыт создания дэшбордов в Power BI и обработки данных в Power Query (или их...",
"responsibility": "О команде ТеДо Change: Мы помогаем проектным командам и подразделениям компании оптимизировать текущие процессы, быстро обрабатывать, анализировать и визуализировать данные...",
"area": "Казань",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 8,
"job": "Младший аналитик данных",
"description": "",
"min_salary": 90000,
"max_salary": 110000,
"address": "",
"link": "https://api.hh.ru/vacancies/112795631?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=112795631",
"phone": null,
"email": null,
"employer": "Группа компаний МЕДСИ",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "remote",
"has_test": false,
"requirement": "Опыт работы аналитиком данных до года. Знание Python (pandas, matplotlib, selenium). Знание SQL (DML, временные таблицы; процедуры, SQL agent - будет...",
"responsibility": "Мы ищем младшего аналитика данных в направление по работе с данными. Нужно будет выполнять ad hoc задачи для внутренних (выгрузка...",
"area": "Москва",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 9,
"job": "Аналитик данных",
"description": "",
"min_salary": 88000,
"max_salary": null,
"address": "Екатеринбург, улица Розы Люксембург, 51",
"link": "https://api.hh.ru/vacancies/112948767?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=112948767",
"phone": null,
"email": null,
"employer": "Трубная Металлургическая Компания",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "fullDay",
"has_test": false,
"requirement": "Имеете высшее образование. Умеете анализировать данные, извлекать данные из различных источников. Уверенно владеете программными продуктами: Visio, Excel, Power Point. ",
"responsibility": "Создавать и поддерживать интерактивные панели (витрины данных). Разрабатывать инструменты по автоматизации и оптимизации работы с данными, формировать и обрабатывать большие...",
"area": "Екатеринбург",
"source": null,
"id_vacancy_from_source": null
},
{
"id": 10,
"job": "Аналитик данных",
"description": "",
"min_salary": 80000,
"max_salary": null,
"address": "Москва, Верейская улица, 29с134",
"link": "https://api.hh.ru/vacancies/113012142?host=hh.ru",
"apply_link": "https://hh.ru/applicant/vacancy_response?vacancyId=113012142",
"phone": null,
"email": null,
"employer": "Крибрум",
"created_at": null,
"updated_at": null,
"work_type": null,
"business_trip_readiness": null,
"work_hours": null,
"relocation": null,
"employment": "full",
"schedule": "fullDay",
"has_test": false,
"requirement": "Вдумчивость, усидчивость, готовность к монотонной работе, анализу больших объемов данных. Высшее образование. Рассмотрим студентов ВУЗов 4-5 курсов, направление подготовки...",
"responsibility": "Главная функция: Мониторинг информационного пространства на предмет угроз информационной безопасности по запросу заказчика, составление отчетов по итогам исследования.",
"area": "Москва",
"source": null,
"id_vacancy_from_source": null
}
]
}''';
