import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  final TextEditingController _agecontroller = new TextEditingController();
  final TextEditingController _heightcontroller = new TextEditingController();
  final TextEditingController _weightcontroller = new TextEditingController();
  double inches = 0;
  double result = 0;
  String _finalresult ="";

  String _newresult="";

  void calculate() {
    setState(() {
      int age = int.parse(_agecontroller.text);
      double height = double.parse(_heightcontroller.text);
      inches = height * 12;
      double weight = double.parse(_weightcontroller.text);

      if ((_agecontroller.text.isNotEmpty || age > 0) &&
          (_heightcontroller.text.isNotEmpty || inches > 0) &&
          (_weightcontroller.text.isNotEmpty || weight > 0)) {
        result = weight / (inches* inches) * 703;
         
          if (double.parse(result.toStringAsFixed(2))< 18.5)
          {_finalresult="Underweight";}
          else if (double.parse(result.toStringAsFixed(2))>=18.5
          && result<25){_finalresult="Normal";}
          else if (double.parse(result.toStringAsFixed(2))>=18.5
          && result<30){_finalresult="Overweight";}
          else if (double.parse(result.toStringAsFixed(2))>=30)
          {_finalresult="Obese";}
             
      }
      else {
        result=0.0;
      }
    });
    _newresult="Your BMI: ${result.toStringAsFixed(2)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        //centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(1.0),
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 80.0,
            ),
            new Container(
              // padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(5.0),
              height: 260,
              width: 290,
              color: Colors.grey.shade400,

              child: Column(
                children: <Widget>[
                  new TextField(
                    controller: _agecontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Age',
                        hintText: 'e.g: 21',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Height in feet',
                        hintText: 'e.g: 5.9',
                        icon: new Icon(Icons.insert_chart)),
                  ),
                  new TextField(
                    controller: _weightcontroller,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Weight in lb',
                        hintText: 'e.g: 190',
                        icon: new Icon(Icons.line_weight)),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(4.0),
                  ),
                  new RaisedButton(
                    onPressed: calculate,
                    color: Colors.green,
                    child: new Text(
                      'Calculate',
                    ),
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_newresult",
                  style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.orange,
                  ),
                ),
                new Text(
                  "$_finalresult",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
