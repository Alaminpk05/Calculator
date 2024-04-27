import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<OneAddEvent>(oneaddevent);
    on<TwoAddEvent>(twoaddevent);
    on<ThreeAddEvent>(threeaddevent);
    on<FourAddEvent>(fouraddevent);
    on<FiveAddEvent>(fiveaddevent);
    on<SixAddEvent>(sixaddevent);
    on<SevenAddEvent>(sevenaddevent);
    on<EightAddEvent>(eightaddevent);
    on<NineAddEvent>(nineaddevent);
    on<ZeroAddEvent>(zeroaddevent);
    on<AcEvent>(acevent);
    on<PercentageEvent>(percentageevent);
    on<DevidedEvent>(devidedvent);
    on<MultiplyEvent>(multiplyevent);
    on<SubstructionEvent>(substructionevent);
    on<AddEvent>(addevent);
    on<EquelEvent>(equelevent);
    on<DelEvent>(delevent);
    on<PointAddEvent>(pointaddevent);
  }

  FutureOr<void> oneaddevent(OneAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '1';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> twoaddevent(TwoAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '2';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> threeaddevent(
      ThreeAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '3';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> fouraddevent(
      FourAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '4';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> fiveaddevent(
      FiveAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '5';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> sixaddevent(SixAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '6';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> sevenaddevent(
      SevenAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '7';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> eightaddevent(
      EightAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '8';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> nineaddevent(
      NineAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '9';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> zeroaddevent(
      ZeroAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '0';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> acevent(AcEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput = '';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> percentageevent(
      PercentageEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '%';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> devidedvent(
      DevidedEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '/';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> multiplyevent(
      MultiplyEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += 'x';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> substructionevent(
      SubstructionEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '-';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> addevent(AddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '+';
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> equelevent(EquelEvent event, Emitter<CalculatorState> emit) {
    String finaluserinput = state.userinput;
    finaluserinput = state.userinput.replaceAll('x', '*');
    

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    var answer = eval.toString();
    emit(CalculatorState(userinput: '', result: answer));
  }

  FutureOr<void> delevent(DelEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput.substring(0, state.userinput.length - 1);
    emit(CalculatorState(userinput: v, result: '0'));
  }

  FutureOr<void> pointaddevent(
      PointAddEvent event, Emitter<CalculatorState> emit) {
    var v = state.userinput += '.';
    emit(CalculatorState(userinput: v, result: '0'));
  }
}
