import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/pages/vacancy_page.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/vacancies_provider.dart';

import '../../domain/model/user.dart';
import 'login_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    if (user.login.isEmpty) {
      return const LoginPage();
    } else {
      ref.read(vacanciesStateProvider.notifier).getVacancies(user);
      return const VacancyPage();
    }
  }
}
