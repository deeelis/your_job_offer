import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';

import '../../domain/model/enums.dart';
import '../../domain/model/general.dart';
import '../../domain/model/user.dart';
import '../../main.dart';
import '../../utils.dart';

class FormPage extends ConsumerStatefulWidget {
  const FormPage(this.args, {super.key});

  final FormArguments args;

  @override
  ConsumerState<FormPage> createState() => _FormPageState();
}

class FormArguments {
  final User user;

  FormArguments({required this.user});
}

class _FormPageState extends ConsumerState<FormPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController middleNameController;
  late TextEditingController phoneController;
  late TextEditingController descriptionController;
  late TextEditingController minSalaryController;
  late TextEditingController maxSalaryController;
  late TextEditingController workHoursController;

  GenderEnum? selectedGender;
  WorkTypeEnum? selectedWorkType;
  BusinessTripReadinessEnum? selectedBusinessTripReadiness;
  RelocationEnum? selectedRelocation;
  EmploymentEnum? selectedEmployment;
  ScheduleEnum? selectedSchedule;
  EducationLevelEnum? selectedEducationLevel;
  CitizenshipEnum? selectedCitizenship;

  DateTime? selectedBirthDate;
  Country? selectedCountry;
  City? selectedCity;

  List<Education> educations = [];
  List<WorkExperience> workExperiences = [];
  List<Project> projects = [];
  List<Skill> skills = [];
  List<Language> languages = [];

  late User user;

  @override
  void initState() {
    super.initState();

    user = widget.args.user;
    print(user);
    firstNameController = TextEditingController(text: user.firstName ?? '');
    lastNameController = TextEditingController(text: user.lastName ?? '');
    emailController = TextEditingController(text: user.email ?? '');
    middleNameController = TextEditingController(text: user.middleName ?? '');
    phoneController = TextEditingController(text: user.phone ?? '');
    descriptionController = TextEditingController(text: user.description ?? '');
    minSalaryController = TextEditingController(
        text: user.minSalary != null ? user.minSalary.toString() : '');
    maxSalaryController = TextEditingController(
        text: user.maxSalary != null ? user.maxSalary.toString() : '');
    workHoursController = TextEditingController(
        text: user.workHours != null ? user.workHours.toString() : '');

    selectedGender = user.gender ?? GenderEnum.male;
    selectedWorkType = user.workType;
    selectedBusinessTripReadiness = user.businessTripReadiness;
    selectedRelocation = user.relocation;
    selectedEmployment = user.employment;
    selectedSchedule = user.schedule;
    selectedCitizenship = user.citizenship ?? CitizenshipEnum.rf;
    selectedEducationLevel =
        user.educationLevel ?? EducationLevelEnum.secondary;

    selectedBirthDate = DateTime.tryParse(user.birthDate ?? "");
    // selectedCountry = user.country;
    // selectedCity = user.city;

    educations.addAll(user.educations ?? []);
    workExperiences.addAll(user.workExperiences ?? []);
    projects.addAll(user.projects ?? []);
    skills.addAll(user.skills ?? []);
    languages.addAll(user.languages ?? []);
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate() &&
        selectedCitizenship != null &&
        selectedCountry != null &&
        selectedCity != null) {
      user.firstName = firstNameController.text;
      user.lastName = lastNameController.text;
      user.middleName = middleNameController.text;
      user.phone = phoneController.text;
      user.email = emailController.text;
      user.description = descriptionController.text;
      user.minSalary = int.tryParse(minSalaryController.text);
      user.maxSalary = int.tryParse(maxSalaryController.text);
      user.workHours = int.tryParse(workHoursController.text);

      user.gender = selectedGender;
      user.workType = selectedWorkType;
      user.businessTripReadiness = selectedBusinessTripReadiness;
      user.relocation = selectedRelocation;
      user.employment = selectedEmployment;
      user.schedule = selectedSchedule;
      user.educationLevel = selectedEducationLevel;

      user.birthDate = selectedBirthDate.toString();
      user.country = selectedCountry;
      user.city = selectedCity;

      user.educations = educations;
      user.workExperiences = workExperiences;
      user.skills = skills;

      await ref.read(userStateProvider.notifier).uploadForm(user);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Form saved successfully!")),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, Pages.home, (route) => false);
      }
    } else if (selectedCitizenship == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Нужно заполнить гражданство")),
      );
    } else if (selectedCountry == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Нужно заполнить страну")),
      );
    } else if (selectedCity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Нужно заполнить город")),
      );
    }
  }

  Future<void> _selectBirthDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != selectedBirthDate) {
      setState(() {
        selectedBirthDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Форма"),
        actions: [
          TextButton(
            child: const Text("Сохранить"),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await submitForm();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: "Фамилия"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите фамилию';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: "Имя"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: middleNameController,
                decoration: const InputDecoration(labelText: 'Отчество'),
              ),
              GestureDetector(
                onTap: _selectBirthDate,
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Дата рождения",
                      hintText: "Выберите дату",
                    ),
                    controller: TextEditingController(
                      text: selectedBirthDate != null
                          ? "${selectedBirthDate!.day}.${selectedBirthDate!.month}.${selectedBirthDate!.year}"
                          : null,
                    ),
                  ),
                ),
              ),
              _buildDropdown<GenderEnum>(
                "Пол",
                GenderEnum.values,
                selectedGender,
                (value) => setState(() => selectedGender = value),
                (value) => value.value,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Телефон'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Введите корректный email';
                  }
                  return null;
                },
              ),
              _buildDropdown<CitizenshipEnum>(
                "Гражданство",
                CitizenshipEnum.values,
                selectedCitizenship,
                (value) => setState(() => selectedCitizenship = value),
                (value) => value.value,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Дополнительная информация'),
              ),
              DropdownSearch<Country>(
                items: countries
                    .map((e) => Country(area_id: e['id'], name: e['country']))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                    print(value);
                    print(selectedCountry);
                    // selectedCountry?.areaId = value?.areaId;
                    // selectedCountry?.name = value?.name;
                    selectedCity = null;
                  });
                },
                itemAsString: (item) => item.name ?? '',
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                  labelText: "Выберите страну",
                  hintText: "Страна",
                )),
                // showSearchBox: true,
              ),
              if (selectedCountry != null)
                DropdownSearch<City>(
                  items: (countries.firstWhere((e) =>
                              e['country'] == selectedCountry?.name)['cities']
                          as List<Map<String, dynamic>>)
                      .map((e) => City(area_id: e['id'], name: e['city']))
                      .toList(),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                    labelText: "Выберите город",
                    hintText: "Город",
                  )),
                  onChanged: (value) {
                    setState(() {
                      selectedCity = value;
                    });
                  },
                  selectedItem: selectedCity,
                  itemAsString: (item) => item.name ?? '',
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                  ),
                ),
              _buildDynamicList<Skill>(
                "Добавить навык",
                skills,
                (skill) => _buildSkillForm(skill),
                () => setState(() => skills.add(Skill())),
                (index) => setState(() => skills.removeAt(index)),
              ),
              _buildDropdown<EducationLevelEnum>(
                "Уровень образования",
                EducationLevelEnum.values,
                selectedEducationLevel,
                (value) => setState(() => selectedEducationLevel = value),
                (value) => value.value,
              ),
              _buildDynamicList<Education>(
                "Добавить образование",
                educations,
                (education) => _buildEducationForm(education),
                () => setState(() => educations
                    .add(Education(id: DateTime.now().millisecondsSinceEpoch))),
                (index) => setState(() => educations.removeAt(index)),
              ),
              TextFormField(
                controller: minSalaryController,
                decoration:
                    const InputDecoration(labelText: 'Минимальная зарплата'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: maxSalaryController,
                decoration:
                    const InputDecoration(labelText: 'Максимальная зарплата'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: workHoursController,
                decoration: const InputDecoration(labelText: 'Часы работы'),
                keyboardType: TextInputType.number,
              ),
              _buildDropdown<EmploymentEnum>(
                "Тип занятости",
                EmploymentEnum.values,
                selectedEmployment,
                (value) => setState(() => selectedEmployment = value),
                (value) => value.value,
              ),
              _buildDropdown<WorkTypeEnum>(
                "Тип работы",
                WorkTypeEnum.values,
                selectedWorkType,
                (value) => setState(() => selectedWorkType = value),
                (value) => value.value,
              ),
              _buildDropdown<ScheduleEnum>(
                "График работы",
                ScheduleEnum.values,
                selectedSchedule,
                (value) => setState(() => selectedSchedule = value),
                (value) => value.value,
              ),
              _buildDropdown<BusinessTripReadinessEnum>(
                "Готовность к командировкам",
                BusinessTripReadinessEnum.values,
                selectedBusinessTripReadiness,
                (value) =>
                    setState(() => selectedBusinessTripReadiness = value),
                (value) => value.value,
              ),
              _buildDropdown<RelocationEnum>(
                "Готовность к переезду",
                RelocationEnum.values,
                selectedRelocation,
                (value) => setState(() => selectedRelocation = value),
                (value) => value.value,
              ),
              _buildDynamicList<WorkExperience>(
                "Добавить опыт работы",
                workExperiences,
                (experience) => _buildWorkExperienceForm(experience),
                () => setState(() => workExperiences.add(
                    WorkExperience(id: DateTime.now().millisecondsSinceEpoch))),
                (index) => setState(() => workExperiences.removeAt(index)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T extends Enum>(
      String label,
      List<T> values,
      T? selectedValue,
      ValueChanged<T?> onChanged,
      String Function(T) toStringValue) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(labelText: label),
      value: selectedValue,
      onChanged: onChanged,
      items: values
          .map((value) =>
              DropdownMenuItem(value: value, child: Text(toStringValue(value))))
          .toList(),
    );
  }

  Widget _buildDynamicList<T>(
    String title,
    List<T> items,
    Widget Function(T item) itemBuilder,
    VoidCallback onAdd,
    void Function(int index) onRemove,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: onAdd,
            ),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                children: [
                  itemBuilder(items[index]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text("Удалить"),
                      onPressed: () => onRemove(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildEducationForm(Education education) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextFormField(
            initialValue: education.institution,
            decoration:
                const InputDecoration(labelText: "Название учебного заведения"),
            onChanged: (value) => education.institution = value,
          ),
          TextFormField(
            initialValue: education.major,
            decoration: const InputDecoration(labelText: "Специальность"),
            onChanged: (value) => education.major = value,
          ),
          TextFormField(
            initialValue: education.degree,
            decoration: const InputDecoration(labelText: "Степень"),
            onChanged: (value) => education.degree = value,
          ),
          TextFormField(
            initialValue: education.description,
            decoration: const InputDecoration(labelText: "Описание"),
            onChanged: (value) => education.description = value,
          ),
          GestureDetector(
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                setState(() {
                  education.startDate = date;
                });
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Дата начала",
                  hintText: "Выберите дату",
                ),
                controller: TextEditingController(
                  text: education.startDate != null
                      ? "${education.startDate!.day}.${education.startDate!.month}.${education.startDate!.year}"
                      : null,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (date != null) {
                setState(() {
                  education.finishDate = date;
                });
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Дата окончания",
                  hintText: "Выберите дату",
                ),
                controller: TextEditingController(
                  text: education.finishDate != null
                      ? "${education.finishDate!.day}.${education.finishDate!.month}.${education.finishDate!.year}"
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkExperienceForm(WorkExperience workExperience) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              initialValue: workExperience.job,
              decoration: const InputDecoration(labelText: "Должность"),
              onChanged: (value) => workExperience.job = value,
            ),
            TextFormField(
              initialValue: workExperience.workPlace,
              decoration: const InputDecoration(labelText: "Место работы"),
              onChanged: (value) => workExperience.workPlace = value,
            ),
            TextFormField(
              initialValue: workExperience.description,
              decoration: const InputDecoration(labelText: "Описание"),
              onChanged: (value) => workExperience.description = value,
            ),
            GestureDetector(
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    workExperience.startDate = date;
                  });
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Дата начала",
                    hintText: "Выберите дату",
                  ),
                  controller: TextEditingController(
                    text: workExperience.startDate != null
                        ? "${workExperience.startDate!.day}.${workExperience.startDate!.month}.${workExperience.startDate!.year}"
                        : null,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() {
                    workExperience.finishDate = date;
                  });
                }
              },
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Дата окончания",
                    hintText: "Выберите дату",
                  ),
                  controller: TextEditingController(
                    text: workExperience.finishDate != null
                        ? "${workExperience.finishDate!.day}.${workExperience.finishDate!.month}.${workExperience.finishDate!.year}"
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillForm(Skill skill) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              initialValue: skill.name,
              decoration: const InputDecoration(labelText: "Навык"),
              onChanged: (value) => skill.name = value,
            ),
            TextFormField(
              initialValue: skill.description,
              decoration: const InputDecoration(labelText: "Описание"),
              onChanged: (value) => skill.description = value,
            ),
          ],
        ),
      ),
    );
  }
}
