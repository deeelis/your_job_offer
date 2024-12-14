import 'package:json_annotation/json_annotation.dart';

import 'enums.dart';
import 'general.dart';

part 'vacancy.g.dart';

@JsonSerializable(explicitToJson: true)
class Vacancy {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'job')
  final String? job;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'min_salary')
  final int? minSalary;
  @JsonKey(name: 'max_salary')
  final int? maxSalary;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'link')
  final String? link;
  @JsonKey(name: 'apply_link')
  final String? applyLink;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'employer')
  final String? employer;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'work_type')
  final WorkTypeEnum? workType;
  @JsonKey(name: 'business_trip_readiness')
  final BusinessTripReadinessEnum? businessTripReadiness;
  @JsonKey(name: 'work_hours')
  final int? workHours;
  @JsonKey(name: 'relocation')
  final RelocationEnum? relocation;
  @JsonKey(name: 'employment')
  final EmploymentEnum? employment;
  @JsonKey(name: 'schedule')
  final ScheduleEnum? schedule;
  @JsonKey(name: 'has_test')
  final bool? hasTest;
  @JsonKey(name: 'requirement')
  final String? requirement;
  @JsonKey(name: 'responsibility')
  final String? responsibility;
  @JsonKey(name: 'area')
  final String? area;
  @JsonKey(name: 'source')
  final String? source;
  @JsonKey(name: 'id_vacancy_from_source')
  final String? idVacancyFromSource;
  @JsonKey(name: 'status')
  final List<Status>? status;
  @JsonKey(name: 'professional_role')
  ProfessionalRole? professionalRole;

  Vacancy({
    this.id,
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
    this.status,
    this.professionalRole,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) =>
      _$VacancyFromJson(json);

  Map<String, dynamic> toJson() => _$VacancyToJson(this);

  @override
  String toString() {
    return 'Vacancy(id: $id, job: $job, description: $description, min_salary: $minSalary, max_salary: $maxSalary, address: $address, employer: $employer, work_type: $workType, schedule: $schedule, requirement: $requirement)';
  }
}
