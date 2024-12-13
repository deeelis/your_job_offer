import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';

import '../../domain/model/user.dart';
import '../../main.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Профиль'),
          actions: [
            IconButton(
                onPressed: () {
                  ref.read(userStateProvider.notifier).logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Pages.home, (route) => false);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Логин: ${user.login}'),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "ФИО:${user.lastName} ${user.firstName} ${user.middleName ?? ''}"),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Дата рождения: ${user.birthDate}'),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Email: ${user.email}'),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Телефон: ${user.phone}'),
                ),
                const Divider(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Pages.userVacancies);
                    },
                    child: const Text('Мои вакансии'))
              ],
            ),
          ),
        ));
  }
}
