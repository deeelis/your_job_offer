import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/domain/model/enums.dart';

import '../../domain/model/general.dart';
import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';
import '../../main.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.vacancy.job ?? '??',
      ),
      subtitle: Text(widget.vacancy.requirement??''),
      trailing: IconButton(
        onPressed: () async {
        },
        icon: Icon(getStatusIcon(widget.vacancy.status ?? [])),
      ),
      onTap: () {
        Navigator.pushNamed(context, Pages.details, arguments: widget.vacancy);
      },
    );
  }
}
IconData getStatusIcon(List<Status> statuses) {
  print(statuses);
  if(statuses.isEmpty){
    return Icons.question_mark;
  }
  var status =statuses.last;
  print(status.toJson().toString());
  switch (status.status) {
    case StageEnum.invite:
      return Icons.edit_calendar;
    case StageEnum.consideration:
      return Icons.search;
    case StageEnum.testing:
      return Icons.task;
    case StageEnum.interview:
      return Icons.question_answer_outlined;
    case StageEnum.reject:
      return Icons.cancel_outlined;
    default:
      return Icons.question_mark;
  }
}

String getStatusText(List<Status> statuses) {
  print(statuses);
  if(statuses.isEmpty){
    return "Неизвестно";
  }
  var status =statuses.last;
  print(status.toJson().toString());
  switch (status.status) {
    case StageEnum.invite:
      return "Нужно дозаполнить информацию";
    case StageEnum.consideration:
      return "Рассмотрение";
    case StageEnum.testing:
      return "Тестирование";
    case StageEnum.interview:
      return "Назначено собеседование";
    case StageEnum.reject:
      return "Отказ";
    default:
      return "Неизвестно";
  }
}
