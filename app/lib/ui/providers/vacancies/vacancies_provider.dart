import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:your_job_offer/core/providers.dart';
import 'package:your_job_offer/domain/model/enums.dart';
import 'package:your_job_offer/domain/model/vacancy.dart';

import '../../../domain/model/general.dart';
import '../../../domain/model/user.dart';

part 'vacancies_provider.g.dart';

@riverpod
class VacanciesState extends _$VacanciesState {
  @override
  Future<List<Vacancy>> build() async {
    return [];
  }

  Future<List<Vacancy>> getVacancies(User user) async {
    final vacancies = await ref.read(userRepositoryProvider).getVacancies(user);
    print(user.toJson().toString());
    state = AsyncValue.data(vacancies);
    return vacancies;
  }
  
  Future<bool> responseToTheVacancy(User user,  Vacancy vacancy) async {
    var vacanciesOld=state.value!;
    List<Vacancy> vacancies=[];
    for(final vac in vacanciesOld){
      vacancies.add(vac);
    }
    final result = await ref
        .read(userRepositoryProvider)
        .responseToTheVacancy(user, vacancy);
    int index=-1;
    for(int i=0;i<vacancies.length;i++){
      if(vacancies[i].id==vacancy.id){
        index=i;
        break;
      }
    }
    if(index!=-1 ) {
      if (vacancies[index].status == null) {
        vacancies[index].status = [];
      }
      vacancies[index].status?.add(Status(status: StageEnum.consideration));
    }
    state=AsyncValue.data(vacancies);
    print(state.value?[0].toJson()['status']);
    return result;
  }
}
