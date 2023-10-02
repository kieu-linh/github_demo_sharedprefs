import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs_flutter/shared_prefs/local/shared_prefs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  SharedPrefs prefs = SharedPrefs();
  // int _counter = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      prefs.saveNumber(_counter);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNumber();
    _getName();
    _getAge();
  }

  void _getNumber() async {
    _counter = await prefs.getNumber() ?? 0;
    setState(() {});
  }

  void _getName() async {
    nameController.text = await prefs.getName() ?? '';
    setState(() {});
  }

  void _getAge() async {
    ageController.text = await prefs.getAge() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    labelText: 'Input Name',
                    border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.pink),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: TextField(
                controller: ageController,
                decoration: const InputDecoration(
                    hintText: 'Age',
                    labelText: 'Input Age',
                    border: OutlineInputBorder()),
                style: const TextStyle(color: Colors.pink),
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {
                prefs.saveName(nameController.text);
                prefs.saveAge(ageController.text);
              },
              child: Text('Lưu!'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
