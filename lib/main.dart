import 'package:counter/counter.dart';
import 'package:counter/numbers_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _value = 0;

  Future<void> _getRandomValue() async {
    final NumbersService numbersService = NumbersService.filled();
    final int randomInt = await numbersService.getRandomInt();
    setState(() {
      _value = randomInt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Random value is:',
            ),
            Counter(_value),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomValue,
        tooltip: 'Randomize',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
