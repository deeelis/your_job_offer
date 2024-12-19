import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/domain/model/enums.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/filters_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/vacancies_provider.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';
import '../../main.dart';
import '../../utils/methods.dart';
import '../widgets/filters.dart';
import '../widgets/vacancy_tile.dart';

class VacancyPage extends ConsumerStatefulWidget {
  const VacancyPage({super.key});

  @override
  ConsumerState<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends ConsumerState<VacancyPage> {
  bool isLoading = true;
  late List<Vacancy> vacancies;
   List<bool> isApplyingLoading=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    vacancies = ref.watch(vacanciesStateProvider).valueOrNull ?? [];
    var filters = ref.watch(filterStateProvider).value;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вакансии"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  DialogEditFilter(filters ?? user),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Pages.profile);
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: Column(
        children: <Widget>[
          vacancies.isEmpty
              ? Expanded(
                  child: Center(
                    child: Text(
                      "Ничего не нашли, попробуйте другие фильтры",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black38),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: vacancies.length,
                    itemBuilder: (context, index) {
                      final vacancy = vacancies[index];
                      StageEnum? status;
                      if(vacancy.status!=null && vacancy.status!.isNotEmpty){
                        status=vacancy.status?.last.status;
                      }
                      print(status);
                      return VacancyTile(
                        vacancy: vacancy,
                        user: user,
                        isLoading: isApplyingLoading.length>index? isApplyingLoading[index]:false,
                        status: status,
                      );
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await ref
                          .read(vacanciesStateProvider.notifier)
                          .getVacancies(user);
                      setState(() {});
                    } on Exception catch (e) {
                      showError(e, context);
                    }

                  },
                  child: const Text('Find Jobs'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    int index=0;try {
                    for (Vacancy vacancy in vacancies) {
                      setState(() {
                        isApplyingLoading.add(true);
                      });

                        bool result=await ref
                            .read(vacanciesStateProvider.notifier)
                            .responseToTheVacancy(user, vacancy);
                        if(result){
                          index++;
                        }

                      setState(() {
                        isApplyingLoading.last=false;
                      });

                    }
                    } on Exception catch (e) {
                      if (mounted) {
                        showError(e, context);
                      }
                    }
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Подача на вакансии'),
                        content: Text("Вы успешно подались на $index вакансий "),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );

                  },
                  child: const Text('Apply all'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
