import 'enums.dart';

class Vacancy {
  final int id;
  final String? job;
  final String? description;
  final int? minSalary;
  final int? maxSalary;
  final String? address;
  final String? link;
  final String? applyLink;
  final String? phone;
  final String? email;
  final String? employer;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final WorkTypeEnum? workType;
  final BusinessTripReadinessEnum? businessTripReadiness;
  final int? workHours;
  final RelocationEnum? relocation;
  final EmploymentEnum? employment;
  final ScheduleEnum? schedule;
  final bool? hasTest;
  final String? requirement;
  final String? responsibility;
  final String? area;
  final String? source;
  final String? idVacancyFromSource;

  Vacancy({
    required this.id,
    this.job,
    this.description,
    this.minSalary,
    this.maxSalary,
    this.address,
    this.link,
    this.applyLink,
    this.phone,
    this.email,
    this.employer,
    this.createdAt,
    this.updatedAt,
    this.workType,
    this.businessTripReadiness,
    this.workHours,
    this.relocation,
    this.employment,
    this.schedule,
    this.hasTest,
    this.requirement,
    this.responsibility,
    this.area,
    this.source,
    this.idVacancyFromSource,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      id: json['id'],
      job: json['job'],
      description: json['description'],
      minSalary: json['min_salary'],
      maxSalary: json['max_salary'],
      address: json['address'],
      link: json['link'],
      applyLink: json['apply_link'],
      phone: json['phone'],
      email: json['email'],
      employer: json['employer'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      workType: json['work_type'] != null
          ? WorkTypeEnum.values.firstWhere(
              (e) => e.toString() == 'WorkTypeEnum.${json['work_type']}')
          : null,
      businessTripReadiness: json['business_trip_readiness'] != null
          ? BusinessTripReadinessEnum.values.firstWhere((e) =>
              e.toString() ==
              'BusinessTripReadinessEnum.${json['business_trip_readiness']}')
          : null,
      workHours: json['work_hours'],
      relocation: json['relocation'] != null
          ? RelocationEnum.values.firstWhere(
              (e) => e.toString() == 'RelocationEnum.${json['relocation']}')
          : null,
      employment: json['employment'] != null
          ? EmploymentEnum.values.firstWhere(
              (e) => e.toString() == 'EmploymentEnum.${json['employment']}')
          : null,
      schedule: json['schedule'] != null
          ? ScheduleEnum.values.firstWhere(
              (e) => e.toString() == 'ScheduleEnum.${json['schedule']}')
          : null,
      hasTest: json['has_test'],
      requirement: json['requirement'],
      responsibility: json['responsibility'],
      area: json['area'],
      source: json['source'],
      idVacancyFromSource: json['id_vacancy_from_source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'job': job,
      'description': description,
      'min_salary': minSalary,
      'max_salary': maxSalary,
      'address': address,
      'link': link,
      'apply_link': applyLink,
      'phone': phone,
      'email': email,
      'employer': employer,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'work_type': _enumToString(workType),
      'business_trip_readiness': _enumToString(businessTripReadiness),
      'work_hours': workHours,
      'relocation': _enumToString(relocation),
      'employment': _enumToString(employment),
      'schedule': _enumToString(schedule),
      'has_test': hasTest,
      'requirement': requirement,
      'responsibility': responsibility,
      'area': area,
      'source': source,
      'id_vacancy_from_source': idVacancyFromSource,
    };
  }

  static String? _enumToString<T>(T? e) {
    if (e == null) return null;
    return e.toString().split('.').last;
  }

  @override
  String toString() {
    return 'Vacancy(id: $id, job: $job, description: $description, min_salary: $minSalary, max_salary: $maxSalary, address: $address, employer: $employer, work_type: $workType, schedule: $schedule, requirement: $requirement)';
  }
}
