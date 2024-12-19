import 'package:json_annotation/json_annotation.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import 'enums.dart';

part 'general.g.dart';

@JsonSerializable(explicitToJson: true)
class Country {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'area_id')
  int? area_id;

  Country({
    this.id,
    this.name,
    this.area_id,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  String toString() {
    return 'Country(id=$id, name=$name, area_id=$area_id)';
  }
}

@JsonSerializable(explicitToJson: true)
class City {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'area_id')
  int? area_id;

  City({
    this.id,
    this.name,
    this.area_id,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);

  @override
  String toString() {
    return 'City(id=$id, name=$name, area_id=$area_id)';
  }
}

@JsonSerializable(explicitToJson: true)
class Language {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'level')
  LanguageLevelEnum? level;

  Language({
    this.id,
    this.name,
    this.level,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  String toString() {
    return 'Language(id=$id, name=$name, level=$level)';
  }
}

@JsonSerializable(explicitToJson: true)
class Skill {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;

  Skill({
    this.id,
    this.name,
    this.description,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  Map<String, dynamic> toJson() => _$SkillToJson(this);

  @override
  String toString() {
    return 'Skill(id=$id, name=$name, description=$description)';
  }
}

@JsonSerializable(explicitToJson: true)
class Project {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'link')
  String? link;

  Project({
    this.id,
    this.name,
    this.description,
    this.link,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

  @override
  String toString() {
    return 'Project(id=$id, name=$name, description=$description, link=$link)';
  }
}

@JsonSerializable(explicitToJson: true)
class Achievement {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'link')
  String? link;

  Achievement({
    this.id,
    this.name,
    this.description,
    this.link,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementToJson(this);

  @override
  String toString() {
    return 'Achievement(id=$id, name=$name, description=$description, link=$link)';
  }
}

@JsonSerializable(explicitToJson: true)
class WorkExperience {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'job')
  String? job;
  @JsonKey(name: 'work_place')
  String? workPlace;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'start_date')
  DateTime? startDate;
  @JsonKey(name: 'finish_date')
  DateTime? finishDate;

  WorkExperience({
    this.id,
    this.job,
    this.workPlace,
    this.description,
    this.startDate,
    this.finishDate,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$WorkExperienceToJson(this);

  @override
  String toString() {
    return 'WorkExperience(id=$id, job=$job, workPlace=$workPlace, description=$description, startDate=$startDate, finishDate=$finishDate)';
  }
}

@JsonSerializable(explicitToJson: true)
class Education {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'institution')
  String? institution;
  @JsonKey(name: 'major')
  String? major;
  @JsonKey(name: 'degree')
  String? degree;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'start_date')
  DateTime? startDate;
  @JsonKey(name: 'finish_date')
  DateTime? finishDate;

  Education({
    this.id,
    this.institution,
    this.major,
    this.degree,
    this.description,
    this.startDate,
    this.finishDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);

  @override
  String toString() {
    return 'Education(id=$id, institution=$institution, major=$major, degree=$degree, description=$description, startDate=$startDate, finishDate=$finishDate)';
  }
}

@JsonSerializable(explicitToJson: true)
class Status {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'vacancy')
  Vacancy? vacancy;
  @JsonKey(name: 'deadline')
  String? deadline;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'status')
  StageEnum? status;

  Status({
    this.id,
    this.vacancy,
    this.deadline,
    this.date,
    this.message,
    this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}



@JsonSerializable(explicitToJson: true)
class ProfessionalRole {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'role_id')
  int? role;
  @JsonKey(name: 'name')
  String? name;

  ProfessionalRole({
    this.id,
    this.role,
  });

  factory ProfessionalRole.fromJson(Map<String, dynamic> json) => _$ProfessionalRoleFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionalRoleToJson(this);


}