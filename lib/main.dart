import 'package:calculator/widgets/nx_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> button = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: button.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return NxButton(
                      btnText: (button[index]),
                      textColor: Colors.white,
                      color: Colors.green,
                    );
                  } else if (index == 1) {
                    return NxButton(
                      btnText: (button[index]),
                      textColor: Colors.white,
                      color: Colors.red,
                    );
                  } else {
                    return NxButton(
                      btnText: (button[index]),
                      textColor: isOperator(button[index])
                          ? Colors.white
                          : Colors.deepPurple,
                      color: isOperator(button[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple.shade50,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String val) {
    if (val == '%' ||
        val == '/' ||
        val == 'X' ||
        val == '-' ||
        val == '+' ||
        val == '=') {
      return true;
    }
    return false;
  }
}
