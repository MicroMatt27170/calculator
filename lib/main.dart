import 'package:flutter/material.dart';
import 'MathOperation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MathOperation math = new MathOperation();
  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 90, 40, 40),
      child: Column( //Since we have multiple children arranged vertically, we are using column
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal vertical space between all the children of column
          children: <Widget>[ // the column widget uses the children property
            Container( // Display Container
              constraints: BoxConstraints.expand( // Creating a boxed container 
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
              ),
              alignment: Alignment.bottomRight, // Aligning the text to the bottom right of our display screen
              color: Colors.transparent, // Seting the background color of the container

              child: Text(
                '$math',
                style: TextStyle( // Styling the text
                  fontSize: 50.0,
                  color: Colors.white
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _button("M", () => {}, background: Colors.black, foreground: Colors.black), // using custom widget _button
                 _button("CE", () => { setState(() => {math.restart()})}, background: Colors.red),
                 _button("<-", () => {}, background: Colors.redAccent),
                 _button("/", () => {}, background: Colors.lightGreen)               
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _button("7", () => { setState(() => {math.addNumber(7)})}), // using custom widget _button
                 _button("8", () => { setState(() => {math.addNumber(8)})}),
                 _button("9", () => { setState(() => {math.addNumber(9)})}),
                 _button("X", () => {}, background: Colors.lightGreen)               
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _button("4", () => { setState(() => {math.addNumber(4)})}), // using custom widget _button
                 _button("5", () => { setState(() => {math.addNumber(5)})}),
                 _button("6", () => { setState(() => {math.addNumber(6)})}),
                 _button("-", () => {}, background: Colors.lightGreen)               
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _button("1", () => { setState(() => {math.addNumber(1)})}), // using custom widget _button
                 _button("2", () => { setState(() => {math.addNumber(2)})}),
                 _button("3", () => { setState(() => {math.addNumber(3)})}),
                 _button("+", () => {}, background: Colors.lightGreen)               
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                 _button(".", () => {}), // using custom widget _button
                 _button("0", () => {}),
                 _button("=", () => {}, background: Colors.blue),
                 _button("-/+", () => {}, background: Colors.lightGreen)               
              ],
            )
          ],
        ),
    );
  }

  Widget _button (String number, Function() f, {Color background = Colors.black38, Color foreground = Colors.white}){ // Creating a method of return type Widget with number and function f as a parameter
    return new RawMaterialButton(
      onPressed: f,
      child: new Text(
        number, textScaleFactor: 2.25, style: TextStyle(color: foreground),
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: background,
      padding: const EdgeInsets.all(15.0),
    );
  }
}
