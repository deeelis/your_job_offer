enum WorkTypeEnum {
  office('Офисная'),
  remote('Удаленная'),
  hybrid('Гибрид'),
  field_work('Работа на улице');

  final String value;

  const WorkTypeEnum(this.value);
}

enum GenderEnum {
  male('Мужской'),
  female('Женский');

  final String value;

  const GenderEnum(this.value);
}

enum BusinessTripReadinessEnum {
  ready('Готов к командировкам'),
  sometimes('Готов к редким командировкам'),
  never('Не готов к командировкам');

  final String value;

  const BusinessTripReadinessEnum(this.value);
}

enum RelocationEnum {
  no_relocation('Не готов к переезду'),
  relocation_possible('Готов к переезду'),
  relocation_desirable('Хочу переехать');

  final String value;

  const RelocationEnum(this.value);
}

enum EmploymentEnum {
  full('Полная занятость'),
  part('Частичная занятость'),
  project('Проектная работа'),
  volunteer('Волонтерство'),
  probation('Стажировка');

  final String value;

  const EmploymentEnum(this.value);
}

enum ScheduleEnum {
  fullDay('Полный день'),
  shift('Сменный график'),
  flexible('Гибкий график'),
  remote('Удаленная работа'),
  flyInFlyOut('Вахтовый метод');

  final String value;

  const ScheduleEnum(this.value);
}

enum LanguageLevelEnum {
  a1('A1 — Начальный'),
  a2('A2 — Элементарный'),
  b1('B1 — Средний'),
  b2('B2 — Средне-продвинутый'),
  c1('C1 — Продвинутый'),
  c2('C2 — В совершенстве'),
  l1('Родной');

  final String value;

  const LanguageLevelEnum(this.value);
}

enum EducationLevelEnum {
  secondary('Среднее'),
  special_secondary('Среднее специальное'),
  unfinished_higher('Неоконченное высшее'),
  higher('Высшее'),
  bachelor('Бакалавр'),
  master('Магистр'),
  candidate('Кандидат наук'),
  doctor('Доктор наук');

  final String value;

  const EducationLevelEnum(this.value);
}

enum CitizenshipEnum {
  rf('Гражданство РФ'),
  another('Другое');

  final String value;

  const CitizenshipEnum(this.value);
}

enum StageEnum {
  consideration('consideration'),
  reject('reject'),
  invite('invite'),
  testing('testing'),
  interview('interview');

  final String value;

  const StageEnum(this.value);
}
