// Создание интерпретатора математических выражений с поддержкой переменных
//
// Цель:
// Необходимо разработать алгоритм на Dart для интерпретации математических выражений (действия сложения, вычитания, умножения, деления, должны поддерживаться числовые константы и именованные переменные, а также скобки). Преобразователь должен быть оформлен как класс (конструктор принимает строку с математической функций) с функцией преобразования, принимающей Map с переменными (ключ - название переменной, значение - числовое значение, которое подставляется вместо переменной) и возвращающей значение типа double. При вычислении значения выражения необходимо учитывать приоритет математических операций. За основу можно взять любой алгоритм (например, https://dev.to/brunooliveira/writing-a-mathematical-expression-evaluator-in-java-1ka6), либо разработать собственный. Для тестирования корректности можно использовать минимум три выражения (x=10).
//
// 10*5+4/2-1 (результат 51)
// (x*3-5)/5 (результат 5)
// 3*x+15/(3+2) (результат 33)
// Опционально можно сделать поддержку отрицательных констант с унарным минусом.
//
// Описание/Пошаговая инструкция выполнения домашнего задания:
// Разработать алгоритм разбора строки с учетом приоритета операций (при необходимо можно вносить изменения в строку)
// Реализовать функцию (итеративную или рекурсивную) для выполнения последовательности операций
// Создать класс для вычисления значения произвольной функции с заданными значениями переменных

import 'dart:collection';

final patternVariable = RegExp(r'^[a-zA-Z]$');
final patternOperand = RegExp(r'[\d.]');
final patternOperator = RegExp(r'^[\+\-\*/()_]$');

final patternPriorityLow = RegExp(r'^[()]$');
final patternPriorityMiddle = RegExp(r'^[+-_]$');
final patternPriorityHigh = RegExp(r'^[*\/]$');

enum ChunkType { operator, operand }

class Calc {
  String _expression;
  Map<String, num> _variablesMap = {};

  Calc.expression(this._expression);
  Calc.formula(this._expression, this._variablesMap);
  setExpression(String expression) => _expression = expression;
  setVariablesMap(Map<String, double> variablesMap) =>
      _variablesMap = variablesMap;

  static Map<String, int> priority = {
    '(': 0,
    '+': 1,
    '-': 1,
    '*': 2,
    '/': 2,
    '_': 3
  };

  static getChunkType(String chunk) {
    if (patternOperand.hasMatch(chunk) || patternVariable.hasMatch(chunk)) {
      return ChunkType.operand;
    } else if (patternOperator.hasMatch(chunk)) {
      return ChunkType.operator;
    } else {
      throw 'Can\'t evaluate chunk type: "$chunk"';
    }
  }

  static List getReverseEndlessList(String expression) {
    List reverseEndlessList = [];
    Queue operatorQueue = Queue();
    String operand = '';
    for (int i = 0; i < expression.length; i++) {
      String chunk = expression[i];
      ChunkType chunkType = getChunkType(chunk);
      if (chunkType == ChunkType.operand) {
        operand = operand + chunk;
        if (i + 1 < expression.length &&
            getChunkType(expression[i + 1]) == ChunkType.operand) {
          continue;
        }
        reverseEndlessList.add(operand);
        operand = '';
      } else if (chunkType == ChunkType.operator) {
        if (chunk == '(' || operatorQueue.isEmpty) {
          operatorQueue.addLast(chunk);
          continue;
        }
        if (chunk == ')') {
          while (chunk != '(') {
            chunk = operatorQueue.removeLast();
            if (chunk != '(') {
              reverseEndlessList.add(chunk);
            }
          }
          continue;
        }
        int operatorPriority = priority[chunk]!;
        int lastOperatorPriority = priority[operatorQueue.last]!;
        if (lastOperatorPriority >= operatorPriority) {
          while (lastOperatorPriority >= operatorPriority &&
              operatorQueue.isNotEmpty) {
            reverseEndlessList.add(operatorQueue.removeLast());
            if (operatorQueue.isNotEmpty) {
              lastOperatorPriority = priority[operatorQueue.last]!;
            }
          }
        }
        operatorQueue.addLast(chunk);
      }
    }
    operatorQueue.toList().reversed.forEach((chunk) {
      reverseEndlessList.add(chunk);
    });
    return reverseEndlessList;
  }

  num calculate() {
    List reversePolandList = getReverseEndlessList(_expression);
    Queue<num> results = Queue();
    num result = 0;
    for (var chunk in reversePolandList) {
      ChunkType chunkType = getChunkType(chunk);
      if (chunkType == ChunkType.operator) {
        if (chunk == '_') {
          results.addLast(-1);
          chunk = '*';
        }
        num operandB = results.removeLast();
        num operandA = results.removeLast();
        switch (chunk) {
          case '+':
            result = operandA + operandB;
          case '-':
            result = operandA - operandB;
          case '*':
            result = operandA * operandB;
          case '/':
            result = operandA / operandB;
          default:
            throw 'illegal operator $chunk';
        }
      } else {
        if (patternVariable.hasMatch(chunk)) {
          result = _variablesMap[chunk]!;
        } else {
          result = num.parse(chunk);
        }
      }
      results.addLast(result);
    }
    return results.last;
  }
}

void main() {
  var calc = Calc.expression('1+(4-2)*_3');
  print(calc._expression);
  print(calc.calculate());
  calc.setExpression('10*5+4/2-1');
  print(calc._expression);
  print(calc.calculate());
  calc.setExpression('(x*3-5)/5');
  print(calc._expression);
  calc.setVariablesMap({'x': 10});
  print(calc.calculate());
  calc.setExpression('3*x+15/(3+2)');
  print(calc._expression);
  print(calc.calculate());
  // unary operator (_)
  calc.setExpression('(_x*_3-5)/5');
  print(calc.calculate());
}
