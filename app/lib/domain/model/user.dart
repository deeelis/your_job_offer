import 'package:json_annotation/json_annotation.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import 'enums.dart';
import 'general.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'login')
  String login;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'birthDate')
  String? birthDate;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'middle_name')
  String? middleName;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'gender')
  GenderEnum? gender;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'city')
  City? city;
  @JsonKey(name: 'country')
  Country? country;
  @JsonKey(name: 'cv')
  String? cv;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'work_type')
  WorkTypeEnum? workType;
  @JsonKey(name: 'min_salary')
  int? minSalary;
  @JsonKey(name: 'max_salary')
  int? maxSalary;
  @JsonKey(name: 'business_trip_readiness')
  BusinessTripReadinessEnum? businessTripReadiness;
  @JsonKey(name: 'work_hours')
  int? workHours;
  @JsonKey(name: 'relocation')
  RelocationEnum? relocation;
  @JsonKey(name: 'employment')
  EmploymentEnum? employment;
  @JsonKey(name: 'schedule')
  ScheduleEnum? schedule;
  @JsonKey(name: 'hh_resume_id')
  String? hhResumeId;
  @JsonKey(name: 'education_level')
  EducationLevelEnum? educationLevel;
  @JsonKey(name: 'citizenship')
  CitizenshipEnum? citizenship;
  @JsonKey(name: 'professional_role')
  ProfessionalRole? professionalRole;
  @JsonKey(name: 'projects')
  List<Project>? projects;
  @JsonKey(name: 'achievements')
  List<Achievement>? achievements;
  @JsonKey(name: 'work_experiences')
  List<WorkExperience>? workExperiences;
  @JsonKey(name: 'educations')
  List<Education>? educations;
  @JsonKey(name: 'skills')
  List<Skill>? skills;
  @JsonKey(name: 'languages')
  List<Language>? languages;
  @JsonKey(name: 'vacancies')
  List<Vacancy>? vacancies;

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
    this.citizenship,
    this.professionalRole,
    this.projects = const [],
    this.achievements = const [],
    this.workExperiences = const [],
    this.educations = const [],
    this.skills = const [],
    this.languages = const [],
    this.vacancies = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static User getEmptyUser() {
    return User(login: "", password: "");
  }

}
