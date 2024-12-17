import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';

import '../../domain/model/user.dart';
import '../../main.dart';
import 'form_page.dart';

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
    var userProfile =
        ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль пользователя'),
        actions: [
          IconButton(
              onPressed: () async {
                  Navigator.pushNamed(
                    context,
                    Pages.form,
                    arguments: FormArguments(user: userProfile, isEdit: true),
                  );

              },
              icon: Icon(Icons.edit)),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Фото и информация о пользователе
            _buildProfileHeader(userProfile),
            _buildInfoRow(Icons.person, userProfile.login),
            SizedBox(height: 20),

            // Контактная информация
            _buildCard(
              title: 'Контактная информация',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userProfile.email != null)
                    _buildInfoRow(Icons.email, userProfile.email!),
                  if (userProfile.phone != null)
                    _buildInfoRow(Icons.phone, userProfile.phone!),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Описание пользователя
            if (userProfile.description != null &&
                userProfile.description!.isNotEmpty)
              _buildCard(
                title: 'О себе',
                content: Text(
                  userProfile.description!,
                  style: TextStyle(fontSize: 16),
                ),
              ),

            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Pages.userVacancies);
                },
                child: const Text('Мои вакансии'))
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(User userProfile) {
    return Center(
      child: Column(
        children: [
          // if (userProfile.photo != null)
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg'),
            ),
          SizedBox(height: 16),
          Text(
            '${userProfile.firstName ?? ''} ${userProfile.lastName ?? ''} ${userProfile.middleName ?? ''}',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(
            info,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Профиль'),
    //       actions: [
    //         IconButton(onPressed: (){
    //           Navigator.pushNamed(context, Pages.form,
    //               arguments: FormArguments(user: user, isEdit: true),);
    //         }, icon: Icon(Icons.edit)),
    //         IconButton(
    //             onPressed: () {
    //               ref.read(userStateProvider.notifier).logout();
    //               Navigator.pushNamedAndRemoveUntil(
    //                   context, Pages.home, (route) => false);
    //             },
    //             icon: const Icon(Icons.logout))
    //       ],
    //     ),
    //     body: SingleChildScrollView(
    //       child: Center(
    //         child: Column(
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Логин: ${user.login}'),
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text(
    //                   "ФИО:${user.lastName} ${user.firstName} ${user.middleName ?? ''}"),
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Дата рождения: ${user.birthDate}'),
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Email: ${user.email}'),
    //             ),
    //             const Divider(),
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Text('Телефон: ${user.phone}'),
    //             ),
    //             const Divider(),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   Navigator.pushNamed(context, Pages.userVacancies);
    //                 },
    //                 child: const Text('Мои вакансии'))
    //           ],
    //         ),
    //       ),
    //     ));
  }
}
