import 'dart:convert';

import 'package:your_job_offer/domain/model/vacancy.dart';

import 'enums.dart';
import 'general.dart';

class User {
  int? id;
  String login;
  String password;
  String? birthDate;
  String? firstName;
  String? lastName;
  String? middleName;
  String? photo;
  GenderEnum? gender;
  String? phone;
  String? email;
  CityModel? city;
  CountryModel? country;
  String? cv;
  String? description;
  WorkTypeEnum? workType;
  int? minSalary;
  int? maxSalary;
  BusinessTripReadinessEnum? businessTripReadiness;
  int? workHours;
  RelocationEnum? relocation;
  EmploymentEnum? employment;
  ScheduleEnum? schedule;
  String? hhResumeId;
  EducationLevelEnum? educationLevel;
  String? source;
  List<ProjectModel> projects;
  List<AchievementModel> achievements;
  List<WorkExperienceModel> workExperiences;
  List<EducationModel> educations;
  List<SkillModel> skills;
  List<LanguageModel> languages;
  // List<Vacancy> vacancies;

  User({
    this.id,
    required this.login,
    required this.password,
    this.birthDate,
    this.firstName,
    this.lastName,
    this.middleName,
    this.photo,
    this.gender,
    this.phone,
    this.email,
    this.city,
    this.country,
    this.cv,
    this.description,
    this.workType,
    this.minSalary,
    this.maxSalary,
    this.businessTripReadiness,
    this.workHours,
    this.relocation,
    this.employment,
    this.schedule,
    this.hhResumeId,
    this.educationLevel,
    this.source,
    this.projects = const [],
    this.achievements = const [],
    this.workExperiences = const [],
    this.educations = const [],
    this.skills = const [],
    this.languages = const [],
    // this.vacancies= const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      login: json['login'],
      password: json['password'],
      birthDate: json['birth_date'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      photo: json['photo'],
      gender: json['gender'] != null ? GenderEnum.values.firstWhere((e) => e.toString() == 'GenderEnum.${json['gender']}') : null,
      phone: json['phone'],
      email: json['email'],
      city: json['city'] != null ? CityModel.fromJson(json['city']) : null,
      country: json['country'] != null ? CountryModel.fromJson(json['country']) : null,
      cv: json['cv'],
      description: json['description'],
      workType: json['work_type'] != null ? WorkTypeEnum.values.firstWhere((e) => e.toString() == 'WorkTypeEnum.${json['work_type']}') : null,
      minSalary: json['min_salary'],
      maxSalary: json['max_salary'],
      businessTripReadiness: json['business_trip_readiness'] != null ? BusinessTripReadinessEnum.values.firstWhere((e) => e.toString() == 'BusinessTripReadinessEnum.${json['business_trip_readiness']}') : null,
      workHours: json['work_hours'],
      relocation: json['relocation'] != null ? RelocationEnum.values.firstWhere((e) => e.toString() == 'RelocationEnum.${json['relocation']}') : null,
      employment: json['employment'] != null ? EmploymentEnum.values.firstWhere((e) => e.toString() == 'EmploymentEnum.${json['employment']}') : null,
      schedule: json['schedule'] != null ? ScheduleEnum.values.firstWhere((e) => e.toString() == 'ScheduleEnum.${json['schedule']}') : null,
      hhResumeId: json['hh_resume_id'],
      educationLevel: json['education_level'] != null ? EducationLevelEnum.values.firstWhere((e) => e.toString() == 'EducationLevelEnum.${json['education_level']}') : null,
      source: json['source'],
      projects: (json['projects'] as List).map((item) => ProjectModel.fromJson(item)).toList(),
      achievements: (json['achievements'] as List).map((item) => AchievementModel.fromJson(item)).toList(),
      workExperiences: (json['work_experiences'] as List).map((item) => WorkExperienceModel.fromJson(item)).toList(),
      educations: (json['educations'] as List).map((item) => EducationModel.fromJson(item)).toList(),
      skills: (json['skills'] as List).map((item) => SkillModel.fromJson(item)).toList(),
      languages: (json['languages'] as List).map((item) => LanguageModel.fromJson(item)).toList(),
      // vacancies: (json['vacancies'] as List).map((item) => Vacancy.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'password': password,
      'birth_date': birthDate,
      'first_name': firstName,
      'last_name': lastName,
      'middle_name': middleName,
      'photo': photo,
      'gender': gender?.toString().split('.').last,
      'phone': phone,
      'email': email,
      'city': city?.toJson(),
      'country': country?.toJson(),
      'cv': cv,
      'description': description,
      'work_type': workType?.toString().split('.').last,
      'min_salary': minSalary,
      'max_salary': maxSalary,
      'business_trip_readiness': businessTripReadiness?.toString().split('.').last,
      'work_hours': workHours,
      'relocation': relocation?.toString().split('.').last,
      'employment': employment?.toString().split('.').last,
      'schedule': schedule?.toString().split('.').last,
      'hh_resume_id': hhResumeId,
      'education_level': educationLevel?.toString().split('.').last,
      'source': source,
      'projects': projects.map((item) => item.toJson()).toList(),
      'achievements': achievements.map((item) => item.toJson()).toList(),
      'work_experiences': workExperiences.map((item) => item.toJson()).toList(),
      'educations': educations.map((item) => item.toJson()).toList(),
      'skills': skills.map((item) => item.toJson()).toList(),
      'languages': languages.map((item) => item.toJson()).toList(),
      // 'vacancies': vacancies.map((item) => item.toJson()).toList(),
    };
  }
  static User getEmptyUser() {
    return User(login: "", password: "");
  }

  @override
  String toString() {
    return 'User(id=$id, login=$login, password=***, firstName=$firstName, lastName=$lastName, gender=$gender, email=$email, city=$city, country=$country, projects=$projects, achievements=$achievements, workExperiences=$workExperiences, educations=$educations, skills=$skills, languages=$languages)';
  }
}
