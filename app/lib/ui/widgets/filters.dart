import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_job_offer/ui/providers/vacancies/filters_provider.dart';
import '../../domain/model/enums.dart';
import '../../domain/model/user.dart';
import '../providers/vacancies/vacancies_provider.dart';

class DialogEditFilter extends ConsumerStatefulWidget {
  const DialogEditFilter(
    this.user, {
    super.key,
  });

  final User user;

  @override
  DialogEditFilterState createState() => DialogEditFilterState();
}

class DialogEditFilterState extends ConsumerState<DialogEditFilter> {
  RangeValues _rangeSliderDiscreteValues = const RangeValues(80000, 150000);
  TextEditingController minSalaryController = TextEditingController();
  TextEditingController maxSalaryController = TextEditingController();
  TextEditingController workHoursController = TextEditingController();

  WorkTypeEnum? selectedWorkType;
  BusinessTripReadinessEnum? selectedBusinessTripReadiness;
  RelocationEnum? selectedRelocation;
  EmploymentEnum? selectedEmployment;
  ScheduleEnum? selectedSchedule;
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
    _rangeSliderDiscreteValues = const RangeValues(80000, 150000);
    minSalaryController.text =
        _rangeSliderDiscreteValues.start.toInt().toString();
    maxSalaryController.text =
        _rangeSliderDiscreteValues.end.toInt().toString();
    workHoursController.text =
        widget.user.workHours != null ? widget.user.workHours.toString() : '';

    selectedWorkType = widget.user.workType;
    selectedBusinessTripReadiness = widget.user.businessTripReadiness;
    selectedRelocation = widget.user.relocation;
    selectedEmployment = widget.user.employment;
    selectedSchedule = widget.user.schedule;
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Фильтры",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Text(
                "Желаемая зарплата",
              ),
              RangeSlider(
                values: _rangeSliderDiscreteValues,
                min: 1000,
                max: 500000,
                divisions: 1000,
                labels: RangeLabels(
                  _rangeSliderDiscreteValues.start.round().toString(),
                  _rangeSliderDiscreteValues.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    _rangeSliderDiscreteValues = values;
                    minSalaryController.text = values.start.toInt().toString();
                    maxSalaryController.text = values.end.toInt().toString();
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                          controller: minSalaryController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(labelText: 'Min'),
                          onChanged: (value) {
                            setState(() {
                              double val = double.parse(value);
                              if (val >= 1000 &&
                                  val < _rangeSliderDiscreteValues.end) {
                                _rangeSliderDiscreteValues = RangeValues(
                                    val, _rangeSliderDiscreteValues.end);
                              }
                            });
                          }),
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                          controller: maxSalaryController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(labelText: 'Max'),
                          onChanged: (value) {
                            setState(() {
                              double val = double.parse(value);
                              if (val <= 500000 &&
                                  val >= _rangeSliderDiscreteValues.start) {
                                _rangeSliderDiscreteValues = RangeValues(
                                    _rangeSliderDiscreteValues.start, val);
                              }
                            });
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: workHoursController,
                  decoration: const InputDecoration(labelText: 'Часы работы'),
                  keyboardType: TextInputType.number,
                ),
              ),
              _buildDropdown<EmploymentEnum>(
                "Тип занятости",
                EmploymentEnum.values,
                selectedEmployment,
                (value) => setState(() => selectedEmployment = value),
                (value) => value.value,
              ),
              // _buildDropdown<WorkTypeEnum>(
              //   "Тип работы",
              //   WorkTypeEnum.values,
              //   selectedWorkType,
              //   (value) => setState(() => selectedWorkType = value),
              //   (value) => value.value,
              // ),
              _buildDropdown<ScheduleEnum>(
                "График работы",
                ScheduleEnum.values,
                selectedSchedule,
                (value) => setState(() => selectedSchedule = value),
                (value) => value.value,
              ),
              _buildDropdown<BusinessTripReadinessEnum>(
                "Командировки",
                BusinessTripReadinessEnum.values,
                selectedBusinessTripReadiness,
                (value) =>
                    setState(() => selectedBusinessTripReadiness = value),
                (value) => value.value,
              ),
              _buildDropdown<RelocationEnum>(
                "Переезд",
                RelocationEnum.values,
                selectedRelocation,
                (value) => setState(() => selectedRelocation = value),
                (value) => value.value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () async {
                      await ref.read(filterStateProvider.notifier).updateFilter(null);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Apply'),
                    onPressed: () async {
                      User newUser=User.fromJson(user.toJson());
                      newUser.id=null;

                      if (minSalaryController.text.isNotEmpty) {
                        newUser.minSalary = int.parse(minSalaryController.text);
                      }
                      if (maxSalaryController.text.isNotEmpty) {
                        newUser.maxSalary = int.parse(maxSalaryController.text);
                      }
                      if (workHoursController.text.isNotEmpty) {
                        newUser.workHours = int.parse(workHoursController.text)?? newUser.workHours;
                      }

                      newUser.schedule = selectedSchedule;
                      newUser.businessTripReadiness =
                          selectedBusinessTripReadiness;
                      newUser.relocation = selectedRelocation;
                      // newUser.workType = selectedWorkType;
                      newUser.employment = selectedEmployment;
                      await ref
                          .read(vacanciesStateProvider.notifier)
                          .getVacancies(newUser);
                      await ref.read(filterStateProvider.notifier).updateFilter(newUser);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
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

    var items = values
        .map((value) =>
        DropdownMenuItem(value: value, child: Text(
          toStringValue(value),
          overflow: TextOverflow.fade,
        )))
        .toList();
    items.add(const DropdownMenuItem(
      value: null,
      child: Text("-"),
    ));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DropdownButtonFormField<T>(
        itemHeight: null,
        isExpanded: true,
        decoration: InputDecoration(labelText: label),
        value: selectedValue,
        onChanged: onChanged,
        items:items
      ),
    );
  }
}
