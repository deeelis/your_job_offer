import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'exceptions.dart';

void checkResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return;
    case 302:
      throw NeedTestTaskException(jsonDecode(response.body)['error']);
    case 303:
      throw ApplyingImpossibleException(jsonDecode(response.body)['error']);
    case 400:
      throw NotValidParametersException(jsonDecode(response.body)['error']);
    case 401:
      throw NotValidAuthException(jsonDecode(response.body)['error']);
    case 403:
      throw NotValidAuthInAggregatorException(jsonDecode(response.body)['error']);
    case 404:
      throw TooMuchRequestException(jsonDecode(response.body)['error']);
    case 429:
      throw BadRequestException(jsonDecode(response.body)['error']);
    case 500:
      throw ServerErrorException(jsonDecode(response.body)['error']);
    case 503:
      throw NotAvailableAggregatorException(jsonDecode(response.body)['error']);
    case 520:
      throw UnknownException(jsonDecode(response.body)['error']);
    default:
      {
        if (response.statusCode >= 300) {
          throw Exception();
        }
      }
  }

}

 void showError(Exception e, BuildContext context){
  if (e is NeedTestTaskException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Необходимо сделать тестовое задание'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is ApplyingImpossibleException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка в подаче на вакансию'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is NotValidParametersException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Неправильные параметры'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is NotValidAuthInAggregatorException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка авторизации в агрегаторе'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is NotValidAuthException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка авторизации'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is TooMuchRequestException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Слишком много запросов'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is BadRequestException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }if (e is ServerErrorException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is NotAvailableAggregatorException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Агрегатор не доступен'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is UnknownException){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Неизвестная ошибка'),
        content: Text(e.msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is SocketException) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Сервер не доступен'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }
  if (e is TimeoutException) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Ошибка подключения'),
        content: Text(e.toString()),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Понятно'),
          ),
        ],
      ),
    );
    return;
  }




}