import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/core/providers.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

class VacancyTile extends ConsumerStatefulWidget {
  const VacancyTile(this.user, {
    super.key,
    required this.vacancy,
  });
  final User user;
  final Vacancy vacancy;

  @override
  ConsumerState<VacancyTile> createState() => _VacancyTileState();
}

class _VacancyTileState extends ConsumerState<VacancyTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Column(
            children: [
              Text(
                widget.vacancy.job ?? '??',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text((widget.vacancy.minSalary ?? widget.vacancy.maxSalary ?? '').toString()),
            ],
          ),
          TextButton(onPressed: () async {
                await ref.read(userRepositoryProvider).responseToTheVacancy(widget.user, widget.vacancy);
          }, child: const Text('Отклик'))
        ],
      ),
    );
  }
}
