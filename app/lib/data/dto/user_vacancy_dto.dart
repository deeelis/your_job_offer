import 'package:json_annotation/json_annotation.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

part 'user_vacancy_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserVacancyDto {
  @JsonKey(name: "user")
  final User user;

  @JsonKey(name: "vacancy")
  final Vacancy vacancy;

  UserVacancyDto({required this.user, required this.vacancy});

  factory UserVacancyDto.fromJson(Map<String, dynamic> json) =>
      _$UserVacancyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserVacancyDtoToJson(this);
}
