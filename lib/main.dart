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
      title: 'Calculator App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1=0, num2=0, sum=0;

  TextEditingController t1= new TextEditingController(text: '0');
  TextEditingController t2= new TextEditingController(text: '0');

  void doAddition(){
    setState(() {
      num1= int.parse(t1.text);
      num2= int.parse(t2.text);
      sum=num1+num2;
    });
  }
  void doSubtraction(){
    setState(() {
      num1= int.parse(t1.text);
      num2= int.parse(t2.text);
      sum=num1-num2;
    });
  }
  void doMul(){
    setState(() {
      num1= int.parse(t1.text);
      num2= int.parse(t2.text);
      sum=num1*num2;
    });
  }
  void doDiv(){
    setState(() {
      num1= int.parse(t1.text);
      num2= int.parse(t2.text);
      sum=num1 ~/ num2;
    });
  }
  void doRemainder(){
    setState(() {
      num1= int.parse(t1.text);
      num2= int.parse(t2.text);
      sum=num1 % num2;
    });
  }
  void doClear(){
    setState(() {
      t1.text="0";
      t2.text="0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: const Center(
          child: Text(
            'Calculator',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Output : $sum",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purpleAccent),
            ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter Number 1',
                ),
                controller: t1,
              ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: 'Enter Number 2',),
              controller: t2,
            ),
            const Padding(padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.greenAccent,
                  child: const Text('+'),
                    onPressed: (){
                    doAddition();
                    }
                ),
                MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: doSubtraction,
                    child: const Text('-')
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: doMul,
                    child: const Text('*')
                ),
                MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: doDiv,
                    child: const Text('/')
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: doRemainder,
                    child: const Text('%'),
                ),
                MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: doClear,
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


