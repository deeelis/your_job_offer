class NeedTestTaskException implements Exception {
  final String msg;

  const NeedTestTaskException(this.msg);

  @override
  String toString() => msg;
}

class ApplyingImpossibleException implements Exception {
  final String msg;

  const ApplyingImpossibleException(this.msg);

  @override
  String toString() => msg;
}


class NotValidParametersException implements Exception {
  final String msg;

  const NotValidParametersException(this.msg);

  @override
  String toString() => msg;
}


class NotValidAuthException implements Exception {
  final String msg;

  const NotValidAuthException(this.msg);

  @override
  String toString() => msg;
}


class NotValidAuthInAggregatorException implements Exception {
  final String msg;

  const NotValidAuthInAggregatorException(this.msg);

  @override
  String toString() => msg;
}


class BadRequestException implements Exception {
  final String msg;

  const BadRequestException(this.msg);

  @override
  String toString() => msg;
}


class ServerErrorException implements Exception {
  final String msg;

  const ServerErrorException(this.msg);

  @override
  String toString() => msg;
}


class NotAvailableAggregatorException implements Exception {
  final String msg;

  const NotAvailableAggregatorException(this.msg);

  @override
  String toString() => msg;
}


class TooMuchRequestException implements Exception {
  final String msg;

  const TooMuchRequestException(this.msg);

  @override
  String toString() => msg;
}


class UnknownException implements Exception {
  final String msg;

  const UnknownException(this.msg);

  @override
  String toString() => msg;
}
