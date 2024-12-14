import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/vacancies_status_provider.dart';
import 'package:your_job_offer/ui/widgets/user_vacancy_tile.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';
import '../providers/vacancies/vacancies_provider.dart';

class UserVacancyPage extends ConsumerStatefulWidget {
  const UserVacancyPage({super.key});

  @override
  ConsumerState<UserVacancyPage> createState() => _UserVacancyPageState();
}

class _UserVacancyPageState extends ConsumerState<UserVacancyPage> {
  bool isLoading = true;
  late List<Vacancy> vacancies;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    // final vacancies = ref.watch(vacanciesStatusStateProvider).valueOrNull ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vacancies"),
      ),
      body:
      FutureBuilder<List<Vacancy>>(
        future: ref.read(vacanciesStatusStateProvider.notifier).getVacanciesStatus(user),
        builder: (BuildContext context, AsyncSnapshot<List<Vacancy>> snapshot) {
          if (snapshot.hasData) {
            return   ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final vacancy = snapshot.data?[index];
                return UserVacancyTile(
                  vacancy: vacancy?? Vacancy(),
                  user: user,
                );
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return
              const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              );
          } else {
            return  const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // ListView.builder(
      //   itemCount: vacancies.length,
      //   itemBuilder: (context, index) {
      //     final vacancy = vacancies[index];
      //     return UserVacancyTile(
      //       vacancy: vacancy,
      //       user: user,
      //     );
      //   },
      // ),
    );
  }
}
