import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
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
    // vacancies = user.vacancies ?? [];
    vacancies = ref.watch(vacanciesStateProvider).valueOrNull ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vacancies"),
      ),
      body: ListView.builder(
        itemCount: vacancies.length,
        itemBuilder: (context, index) {
          final vacancy = vacancies[index];
          return UserVacancyTile(
            vacancy: vacancy,
            user: user,
          );
        },
      ),
    );
  }
}
