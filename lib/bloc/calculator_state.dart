part of 'calculator_bloc.dart';

@immutable
 // ignore: must_be_immutable
 final class CalculatorState {
  // ignore: prefer_typing_uninitialized_variables
  var result;
  // ignore: prefer_typing_uninitialized_variables
  var  userinput;
   CalculatorState({required this.userinput,required this.result});
}

// ignore: must_be_immutable
final class CalculatorInitial extends CalculatorState {
   CalculatorInitial():super(result: '0',userinput: '');
}
