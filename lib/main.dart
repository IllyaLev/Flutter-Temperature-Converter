import 'package:flutter/material.dart';

import './rust_lib.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TemperatureConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureConverter extends StatefulWidget{
  @override  
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter>{
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _convertToCelsius(){
    final double fahrenheit = double.tryParse(_controller.text) ?? 0.0;
    final double celsius = fahrenheitToCelsius(fahrenheit);
    setState(() {
      _result = '$fahrenheit°F is ${celsius.toStringAsFixed(2)}°C';
    });
  }

  void _convertToFahrenheit(){
    final double celsius = double.tryParse(_controller.text) ?? 0.0;
    final double fahrenheit = celsiusToFahrenheit(celsius);
    setState((){
      _result = '$celsius°C is ${fahrenheit.toStringAsFixed(2)}°F';
    });
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Input temperature',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _convertToCelsius,
                  child: Text('To Celsius'),
                ),
                ElevatedButton(
                  onPressed: _convertToFahrenheit,
                  child: Text('To Fahrenheit'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}