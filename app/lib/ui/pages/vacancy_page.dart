import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/vacancies_provider.dart';

import '../../core/providers.dart';
import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';
import '../widgets/filters.dart';

class VacancyPage extends ConsumerStatefulWidget {
  const VacancyPage({super.key});

  @override
  ConsumerState<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends ConsumerState<VacancyPage> {
  bool isLoading = true;
  late List<Vacancy> vacancies;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    vacancies = ref.watch(vacanciesStateProvider).valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vacancies"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) =>
                  DialogEditFilter(user),
            ),
          ),
          IconButton(
              onPressed: () {
                ref.read(userStateProvider.notifier).logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: vacancies.length,
              itemBuilder: (context, index) {
                final vacancy = vacancies[index];
                return VacancyTile(vacancy: vacancy);
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
                    await ref
                        .read(vacanciesStateProvider.notifier)
                        .getVacancies(user);
                  },
                  child: Text('Find Jobs'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    for( Vacancy vacancy in vacancies){
                      await ref.read(userRepositoryProvider).responseToTheVacancy(user, vacancy);
                    }
                  },
                  child: Text('Apply all'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VacancyTile extends StatelessWidget {
  const VacancyTile({
    super.key,
    required this.vacancy,
  });

  final Vacancy vacancy;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(vacancy.job ?? '??'),
      subtitle: Text(vacancy.requirement ?? '??'),
    );
  }
}
