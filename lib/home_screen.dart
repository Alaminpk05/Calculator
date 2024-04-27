import 'package:calculator/bloc/calculator_bloc.dart';
import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
  builder: (context, state) {
    return Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.userinput,
                          style: const TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.result,
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: 'AC',onPress: () {
                          context.read<CalculatorBloc>().add(AcEvent());
                          
                        },),
                        MyButton(title: '+/-',onPress: () {
                          
                        },),
                        MyButton(title: '%',onPress: () {
                          context.read<CalculatorBloc>().add(PercentageEvent());
                        },),
                        MyButton(title: '/',onPress: () {
                          context.read<CalculatorBloc>().add(DevidedEvent());

                        }, color: const Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '7',onPress: () {
                          context.read<CalculatorBloc>().add(SevenAddEvent());
                        },),
                        MyButton(title: '8',onPress: () {
                          context.read<CalculatorBloc>().add(EightAddEvent());
                        },),
                        MyButton(title: '9',onPress: () {
                          context.read<CalculatorBloc>().add(NineAddEvent());
                        },),
                        MyButton(title: 'x',onPress: () {
                          context.read<CalculatorBloc>().add(MultiplyEvent());
                        }, color: const Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '4',onPress: () {
                          context.read<CalculatorBloc>().add(FourAddEvent());
                        },),
                        MyButton(title: '5',onPress: () {
                          context.read<CalculatorBloc>().add(FiveAddEvent());
                        },),
                        MyButton(title: '6',onPress: () {
                          context.read<CalculatorBloc>().add(SixAddEvent());
                        },),
                        MyButton(title: '-',onPress: () {
                          context.read<CalculatorBloc>().add(SubstructionEvent());
                        }, color: const Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '1', onPress: () {
                          context.read<CalculatorBloc>().add(OneAddEvent());
                        },
                        ),
                        MyButton(title: '2',onPress: () {
                          context.read<CalculatorBloc>().add(TwoAddEvent());
                        },),
                        MyButton(title: '3',onPress: () {
                          context.read<CalculatorBloc>().add(ThreeAddEvent());
                        },),
                        MyButton(title: '+', onPress: () {
                          context.read<CalculatorBloc>().add(AddEvent());
                        },color: const Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        MyButton(title: '0',onPress: () {
                          context.read<CalculatorBloc>().add(ZeroAddEvent());
                        },),
                        MyButton(title: '.',onPress: () {
                          context.read<CalculatorBloc>().add(PointAddEvent());
                        },),
                        MyButton(title: 'DEL',onPress: () {
                          context.read<CalculatorBloc>().add(DelEvent());
                        },),
                        MyButton(title: '=', onPress: () {
                          context.read<CalculatorBloc>().add(EquelEvent());
                        },color: const Color(0xffffa00a),),
                      ],
                    ),
                  ),

                ],
              ),
            ),


          ],
        );
  },
),
      ),
    );
  }


  void equalPressed() {

    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }


  }

