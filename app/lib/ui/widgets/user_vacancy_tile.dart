import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/core/providers.dart';
import 'package:your_job_offer/domain/model/enums.dart';

import '../../domain/model/general.dart';
import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

class UserVacancyTile extends ConsumerStatefulWidget {
  const UserVacancyTile({
    super.key,
    required this.vacancy,
    required this.user,
  });

  final User user;
  final Vacancy vacancy;

  @override
  ConsumerState<UserVacancyTile> createState() => _UserVacancyTileState();
}

class _UserVacancyTileState extends ConsumerState<UserVacancyTile> {
  IconData getStatusIcon(Status? status) {
    if (status == null) {
      return Icons.question_mark;
    }
    switch (status.stage) {
      case StageEnum.invite:
        return Icons.looks_one;
      case StageEnum.consideration:
        return Icons.looks_two;
      case StageEnum.testing:
        return Icons.looks_3;
      case StageEnum.interview:
        return Icons.looks_4;
      case StageEnum.reject:
        return Icons.close;
      default:
        return Icons.question_mark;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.vacancy.job ?? '??',
      ),
      subtitle: Text(widget.vacancy.minSalary.toString() ?? ''),
      trailing: IconButton(
        onPressed: () async {
          await ref
              .read(userRepositoryProvider)
              .responseToTheVacancy(widget.user, widget.vacancy);
        },
        icon: Icon(getStatusIcon(widget.vacancy.status?.last)),
      ),
    );
  }
}
