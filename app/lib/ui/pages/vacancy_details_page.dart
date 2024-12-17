import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';
import 'package:your_job_offer/ui/providers/vacancies/vacancies_provider.dart';
import 'package:your_job_offer/ui/widgets/user_vacancy_tile.dart';

import '../../core/providers.dart';
import '../../domain/model/enums.dart';
import '../../domain/model/user.dart';
import '../../domain/model/vacancy.dart';

class VacancyDetailsPage extends ConsumerStatefulWidget {
  const VacancyDetailsPage({required this.vacancy, super.key});

  final Vacancy vacancy;

  @override
  ConsumerState<VacancyDetailsPage> createState() => _VacancyDetailsPageState();
}


class _VacancyDetailsPageState extends ConsumerState<VacancyDetailsPage> {
  bool isApplying = false;
  bool isApplied = false;
  String? errorMessage;
  late User user;

  Future<void> applyForVacancy() async {
    setState(() {
      isApplying = true;
      errorMessage = null;
    });

    try {
      setState(() {isApplying = false;});


        bool result=await ref
            .read(vacanciesStateProvider.notifier).responseToTheVacancy(user, widget.vacancy);
        if(mounted) {
          setState(() {
            if (result) {
              isApplied = true;
            } else {
              errorMessage = "Упс, что-то пошло не так. Попробуйте позже.";
            }
          });
        }


    } catch (e) {
      if(mounted) {
        setState(() {
        isApplying = false;
        errorMessage = "Ошибка подключения: ${e.toString()}";
      });
      }
    }
  }

  Widget buildVacancyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              // color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vacancy = widget.vacancy;
    user =ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    StageEnum? stage;
    if(vacancy.status!=null && vacancy.status!.isNotEmpty){
      stage=vacancy.status?.last.status;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(vacancy.job ?? "Вакансия"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (vacancy.professionalRole != null)
                buildVacancyField("Профессия",
                    vacancy.professionalRole!.name ?? "Не указано"),
              if (vacancy.description != null &&
                  vacancy.description!.isNotEmpty)
                buildVacancyField("Описание", vacancy.description!),
              if (vacancy.minSalary != null || vacancy.maxSalary != null)
                buildVacancyField(
                  "Зарплата",
                  "${vacancy.minSalary ?? "?"} - ${vacancy.maxSalary ?? "?"} руб.",
                ),
              if (vacancy.address != null)
                buildVacancyField("Адрес", vacancy.address!),
              if (vacancy.employer != null)
                buildVacancyField("Работодатель", vacancy.employer!),
              if (vacancy.workType != null)
                buildVacancyField("Тип работы", vacancy.workType!.value),
              if (vacancy.schedule != null)
                buildVacancyField("График работы", vacancy.schedule!.value),
              if (vacancy.businessTripReadiness != null)
                buildVacancyField("Готовность к командировкам",
                    vacancy.businessTripReadiness!.value),
              if (vacancy.relocation != null)
                buildVacancyField(
                    "Готовность к переезду", vacancy.relocation!.value),
              if (vacancy.employment != null)
                buildVacancyField("Занятость", vacancy.employment!.value),
              if (vacancy.requirement != null)
                buildVacancyField("Требования", vacancy.requirement!),
              if (vacancy.responsibility != null)
                buildVacancyField("Обязанности", vacancy.responsibility!),
              if (vacancy.hasTest != null)
                buildVacancyField(
                    "Тестовое задание", vacancy.hasTest! ? "Есть" : "Нет"),
              if (vacancy.area != null)
                buildVacancyField("Регион", vacancy.area!),
              if (vacancy.phone != null)
                buildVacancyField("Телефон", vacancy.phone!),
              if (vacancy.email != null)
                buildVacancyField("Email", vacancy.email!),
              if (vacancy.link != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ссылка",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          // color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      InkWell(
                          child: Text(
                            vacancy.link!,
                            style: const TextStyle(fontSize: 16),
                          ),
                          onTap: () => launch(vacancy.link!)),
                    ],
                  ),
                ),
              const SizedBox(height: 16),
              if (isApplying) const Center(child: CircularProgressIndicator()),
              if (!isApplying && !isApplied && errorMessage == null && stage==null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: applyForVacancy,
                    child: const Text("Податься на вакансию"),
                  ),
                ),
              if (isApplied && stage==null)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 32),
                    SizedBox(width: 8),
                    Text(
                      "Вы успешно подались!",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              if(stage!=null)
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(getStatusIcon(vacancy.status!)),
                    SizedBox(width: 8),
                    Text(
                      getStatusText(vacancy.status!),
                    ),
                  ],
                ),
              if (errorMessage != null && stage==null)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
