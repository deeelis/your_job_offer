import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:your_job_offer/domain/model/enums.dart';
import 'package:your_job_offer/ui/providers/user/user_provider.dart';

import '../../domain/model/user.dart';
import '../../main.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _patronymicController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();
  CitizenshipEnum? selectedCitizenship;

  @override
  Widget build(BuildContext context) {
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _loginController,
                  decoration: const InputDecoration(labelText: 'Логин'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите логин';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Пароль'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'Имя'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите имя';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'Фамилия'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите фамилию';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _patronymicController,
                  decoration: const InputDecoration(labelText: 'Отчество'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Пожалуйста, введите корректный email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Телефон'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите телефон';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Дата рождения'),
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        _dateController.text =
                            DateFormat('dd.MM.yyyy').format(date);
                      });
                    }
                  },
                ),
                _buildDropdown<CitizenshipEnum>(
                  "Гражданство",
                  CitizenshipEnum.values,
                  selectedCitizenship,
                  (value) => setState(() => selectedCitizenship = value),
                  (value) => value.value,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate() &&
                        selectedCitizenship != null) {
                      final rawUser = User(
                          login: _loginController.text,
                          password: _passwordController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          middleName: _patronymicController.text,
                          phone: _phoneController.text,
                          email: _emailController.text,
                          birthDate: _dateController.text,
                          citizenship: selectedCitizenship);
                      final user = await ref
                          .read(userStateProvider.notifier)
                          .register(rawUser);
                      if (user.login.isNotEmpty && context.mounted) {
                        Navigator.pushNamed(
                          context,
                          Pages.cvUpload,
                        );
                      }
                    } else if (selectedCitizenship == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Нужно заполнить поле гражданство")),
                      );
                    }
                  },
                  child: const Text('Зарегистрироваться'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Pages.login);
                  },
                  child: const Text('Авторизация'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _patronymicController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
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
}
