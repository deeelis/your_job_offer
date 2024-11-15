import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final Map<String, dynamic>? initialData;
  const FormScreen({super.key, this.initialData});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController middleNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController descriptionController;
  late TextEditingController minSalaryController;
  late TextEditingController maxSalaryController;
  late TextEditingController workHoursController;

  late String gender;
  late String workType;
  late String businessTripReadiness;
  late String relocation;
  late String employment;
  late String schedule;

  @override
  void initState() {
    super.initState();
    final initialData = widget.initialData ?? {};
    firstNameController = TextEditingController(text: initialData['first_name'] ?? '');
    lastNameController = TextEditingController(text: initialData['last_name'] ?? '');
    middleNameController = TextEditingController(text: initialData['middle_name'] ?? '');
    phoneController = TextEditingController(text: initialData['phone'] ?? '');
    emailController = TextEditingController(text: initialData['email'] ?? '');
    descriptionController = TextEditingController(text: initialData['description'] ?? '');
    minSalaryController = TextEditingController(text: initialData['min_salary']?.toString() ?? '');
    maxSalaryController = TextEditingController(text: initialData['max_salary']?.toString() ?? '');
    workHoursController = TextEditingController(text: initialData['work_hours']?.toString() ?? '');

    gender = initialData['gender'] ?? 'male';
    workType = initialData['work_type'] ?? 'office';
    businessTripReadiness = initialData['business_trip_readiness'] ?? 'never';
    relocation = initialData['relocation'] ?? 'no';
    employment = initialData['employment'] ?? 'full';
    schedule = initialData['schedule'] ?? 'fullDay';
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'middle_name': middleNameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'description': descriptionController.text,
        'min_salary': int.tryParse(minSalaryController.text),
        'max_salary': int.tryParse(maxSalaryController.text),
        'work_hours': int.tryParse(workHoursController.text),
        'gender': gender,
        'work_type': workType,
        'business_trip_readiness': businessTripReadiness,
        'relocation': relocation,
        'employment': employment,
        'schedule': schedule,
      };

      print(formData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Форма отправлена')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Форма пользователя')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'Имя'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите имя';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Фамилия'),
              ),
              TextFormField(
                controller: middleNameController,
                decoration: const InputDecoration(labelText: 'Отчество'),
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
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Описание'),
              ),
              TextFormField(
                controller: minSalaryController,
                decoration: const InputDecoration(labelText: 'Минимальная зарплата'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: maxSalaryController,
                decoration: const InputDecoration(labelText: 'Максимальная зарплата'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: workHoursController,
                decoration: const InputDecoration(labelText: 'Часы работы'),
                keyboardType: TextInputType.number,
              ),
              DropdownButtonFormField<String>(
                value: gender,
                decoration: const InputDecoration(labelText: 'Пол'),
                items: ['male', 'female']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => gender = value!),
              ),
              DropdownButtonFormField<String>(
                value: workType,
                decoration: const InputDecoration(labelText: 'Тип работы'),
                items: ['office', 'remote', 'hybrid', 'field_work']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => workType = value!),
              ),
              DropdownButtonFormField<String>(
                value: businessTripReadiness,
                decoration: const InputDecoration(labelText: 'Готовность к командировкам'),
                items: ['ready', 'sometimes', 'never']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => businessTripReadiness = value!),
              ),
              DropdownButtonFormField<String>(
                value: relocation,
                decoration: const InputDecoration(labelText: 'Переезд'),
                items: ['no', 'possible', 'desirable']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => relocation = value!),
              ),
              DropdownButtonFormField<String>(
                value: employment,
                decoration: const InputDecoration(labelText: 'Занятость'),
                items: ['full', 'part', 'project', 'volunteer', 'probation']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => employment = value!),
              ),
              DropdownButtonFormField<String>(
                value: schedule,
                decoration: const InputDecoration(labelText: 'График работы'),
                items: ['fullDay', 'shift', 'flexible', 'remote', 'flyInFlyOut']
                    .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                    .toList(),
                onChanged: (value) => setState(() => schedule = value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitForm,
                child: const Text('Отправить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

