import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);
    void increment() {
      setState(() {
        counter++;
      });
    }

    void decrement() {
      setState(() {
        counter--;
      });
    }

    void restart() {
      setState(() {
        counter = 0;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 1.0,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Clicks', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButtonAction(
        incrementFn: increment,
        decrementFn: decrement,
        restartFn: restart,
      ),
    );
  }
}

class CustomButtonAction extends StatelessWidget {
  final Function incrementFn;
  final Function decrementFn;
  final Function restartFn;

  const CustomButtonAction({
    Key? key,
    required this.incrementFn,
    required this.decrementFn,
    required this.restartFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => incrementFn(),
          child: const Icon(Icons.add),
          backgroundColor: Colors.redAccent,
        ),
        FloatingActionButton(
          onPressed: () => restartFn(),
          child: const Icon(Icons.restart_alt),
          backgroundColor: Colors.redAccent,
        ),
        FloatingActionButton(
          onPressed: () => decrementFn(),
          child: const Icon(Icons.remove),
          backgroundColor: Colors.redAccent,
        ),
      ],
    );
  }
}
