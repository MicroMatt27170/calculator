import 'dart:async';
import 'package:flutter/material.dart';

class MathOperation {
  String display;
  double number;
  double prevNumber;
  bool isDotPressed;

  MathOperation({double num = 0}) {
    this.display = num.toInt().toString();
    this.number = num;
    this.isDotPressed = false;
    this.prevNumber = 0;
  }

  void restart() {
    this.number = 0;
    this.isDotPressed = false;
    this.prevNumber = 0;
  }

  double addNumber(int n) {
    if(display == '0' || display == '0.0') {

    } else {
      
    }
    var num = this.number * 10;
    num += n;
    this.number = num;
    return this.number;
  }

  @override
  String toString() {
    // TODO: implement toString
    return this.display;
  }
}

enum MathSign {
  Plus,
  Minus,
  Times,
  Divide
}