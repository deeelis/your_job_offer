import 'enums.dart';


class CountryModel {
  int? id;
  String? name;
  int? area_id;

  CountryModel({
    this.id,
    this.name,
    this.area_id,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      area_id: json['area_id'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'areaId': area_id,
    };
  }

  @override
  String toString() {
    return 'Country(id=$id, name=$name, area_id=$area_id)';
  }
}

class CityModel {
  int? id;
  String? name;
  int? area_id;

  CityModel({
    this.id,
    this.name,
    this.area_id,
  });


  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      area_id: json['area_id'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'area_id': area_id,
    };
  }

  @override
  String toString() {
    return 'City(id=$id, name=$name, area_id=$area_id)';
  }
}

class LanguageModel {
  int? id;
  String? name;
  LanguageLevelEnum? level;

  LanguageModel({
    this.id,
    this.name,
    this.level,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      id: json['id'],
      name: json['name'],
      level: LanguageLevelEnum.values.firstWhere(
              (e) => e.toString() == 'LanguageLevelEnum.' + json['level'],
          orElse: () => LanguageLevelEnum.a1), // default value
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level.toString().split('.').last,
    };
  }

  @override
  String toString() {
    return 'Language(id=$id, name=$name, level=$level)';
  }
}

class SkillModel {
  int? id;
  String? name;
  String? description;

  SkillModel({
    this.id,
    this.name,
    this.description,
  });


  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Skill(id=$id, name=$name, description=$description)';
  }
}


class ProjectModel {
  int? id;
  String? name;
  String? description;
  String? link;

  ProjectModel({
    this.id,
    this.name,
    this.description,
    this.link,
  });


  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'link': link,
    };
  }

  @override
  String toString() {
    return 'Project(id=$id, name=$name, description=$description, link=$link)';
  }
}

class AchievementModel {
  int? id;
  String? name;
  String? description;
  String? link;

  AchievementModel({
    this.id,
    this.name,
    this.description,
    this.link,
  });

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      link: json['link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'link': link,
    };
  }

  @override
  String toString() {
    return 'Achievement(id=$id, name=$name, description=$description, link=$link)';
  }
}

class WorkExperienceModel {
  int? id;
  String? job;
  String? workPlace;
  String? description;
  DateTime? startDate;
  DateTime? finishDate;

  WorkExperienceModel({
    this.id,
    this.job,
    this.workPlace,
    this.description,
    this.startDate,
    this.finishDate,
  });

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return WorkExperienceModel(
      id: json['id'],
      job: json['job'],
      workPlace: json['workPlace'],
      description: json['description'],
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      finishDate: json['finishDate'] != null ? DateTime.parse(json['finishDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job': job,
      'workPlace': workPlace,
      'description': description,
      'startDate': startDate?.toIso8601String(),
      'finishDate': finishDate?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'WorkExperience(id=$id, job=$job, workPlace=$workPlace, description=$description, startDate=$startDate, finishDate=$finishDate)';
  }
}

class EducationModel {
  int? id;
  String? institution;
  String? major;
  String? degree;
  String? description;
  DateTime? startDate;
  DateTime? finishDate;

  EducationModel({
    this.id,
    this.institution,
    this.major,
    this.degree,
    this.description,
    this.startDate,
    this.finishDate,
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json['id'],
      institution: json['institution'],
      major: json['major'],
      degree: json['degree'],
      description: json['description'],
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : null,
      finishDate: json['finishDate'] != null ? DateTime.parse(json['finishDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'institution': institution,
      'major': major,
      'degree': degree,
      'description': description,
      'startDate': startDate?.toIso8601String(),
      'finishDate': finishDate?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Education(id=$id, institution=$institution, major=$major, degree=$degree, description=$description, startDate=$startDate, finishDate=$finishDate)';
  }
}

