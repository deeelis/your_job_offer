import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_job_offer/core/providers.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import '../../../domain/model/user.dart';

part 'vacancies_status_provider.g.dart';

@riverpod
class VacanciesStatusState extends _$VacanciesStatusState {
  @override
  Future<List<Vacancy>> build() async {
    return [];
  }

  Future<List<Vacancy>> getVacanciesStatus(User user) async {
    print(user.toJson().toString());
    final vacancies = await ref.read(userRepositoryProvider).getStatus(user);
    print(vacancies.toString());
    state = AsyncValue.data(vacancies);
    return vacancies;
  }
}
