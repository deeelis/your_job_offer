import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/domain/model/enums.dart';
import 'package:your_job_offer/main.dart';

import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

class VacancyTile extends ConsumerStatefulWidget {
  const VacancyTile(  {
    super.key,
    required this.vacancy,
    required this.user,
    required this.isLoading,
    this.status,
  });

  final User user;
  final Vacancy vacancy;
  final bool isLoading;
  final StageEnum? status;


  @override
  ConsumerState<VacancyTile> createState() => _VacancyTileState();
}

class _VacancyTileState extends ConsumerState<VacancyTile> {
  IconData icon=Icons.download_done;

  // bool isLoading = false;
  // @override
  // void initState() {
  //   super.initState();
  //   if(widget.vacancy.status!=null && widget.vacancy.status!.length>1){
  //     icon=getStatusIcon(widget.vacancy.status?[0]);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.vacancy.job ?? '??',
      ),
      subtitle: Text(widget.vacancy.requirement ?? ''),
      trailing: widget.isLoading? const CircularProgressIndicator(): widget.status!=null?IconButton(
        onPressed: () async {
        },
        icon:  Icon(icon),
      ):const SizedBox.shrink(),
      onTap: (){
        Navigator.pushNamed(context, Pages.details, arguments: widget.vacancy);
      },
    );
  }
}
