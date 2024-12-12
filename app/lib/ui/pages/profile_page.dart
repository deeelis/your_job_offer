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
        appBar: AppBar(title: const Text('Профиль')),
        body: SingleChildScrollView(
          child: Column(
            children: [

              Text(
                  "ФИО:${user.lastName} ${user.firstName} ${user.middleName ?? ''}"),
              Text('Дата рождения: ${user.birthDate}'),
            Text('Email: ${user.email}'),
              Text('Телефон: ${user.phone}'),
              Text('Email: ${user.email}'),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, Pages.userVacancies);
              }, child: Text('Мои вакансии'))
            ],
          ),
        ));
  }
}
