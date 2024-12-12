import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_job_offer/core/providers.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import '../../../domain/model/user.dart';

part 'vacancies_provider.g.dart';

@riverpod
class VacanciesState extends _$VacanciesState {
  @override
  Future<List<Vacancy>> build() async {
    return [];
  }

  Future<List<Vacancy>> getVacancies(User user) async{
    final vacancies = await ref.read(userRepositoryProvider).getVacancies(user);
    state=AsyncValue.data(vacancies);
    return vacancies;
  }



}
