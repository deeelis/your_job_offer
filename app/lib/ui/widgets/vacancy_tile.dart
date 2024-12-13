import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/core/providers.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

class VacancyTile extends ConsumerStatefulWidget {
  const VacancyTile({
    super.key,
    required this.vacancy,
    required this.user,
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
      title: Text(
        widget.vacancy.job ?? '??',
      ),
      subtitle: Text(widget.vacancy.requirement ?? ''),
      trailing: IconButton(
        onPressed: () async {
          await ref
              .read(userRepositoryProvider)
              .responseToTheVacancy(widget.user, widget.vacancy);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }
}
