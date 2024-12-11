import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  var bmi = 00.00;
  var height = 160;
  var weight = 50;
  var level = '';
  var Gender = '';

  @override
  Widget build(BuildContext context) {
    //remember why container add Scaffold
    //add Scaffold beacuse its render supereb ui

    return Scaffold(
        body: Container(
            color: const Color.fromARGB(210, 114, 64, 139),
            child: SafeArea(
                //Padding(padding: EdgeInsets.all(16.0)
                child: Column(children: [
              //Padding(padding: EdgeInsets.all(16.0)
              Row(children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Gender = 'M';
                    });
                  },
                  child: Container(
                      height: 185,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 27.5, vertical: 25.0),
                      decoration: BoxDecoration(
                          color: Gender == 'M'
                              ? Color.fromARGB(255, 77, 147, 152)
                              : Color.fromARGB(255, 216, 142, 197),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Icon(
                            Icons.male,
                            size: 150,
                            color: Color.fromARGB(198, 37, 61, 157),
                          ),
                          Text("Male",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 245, 238, 146),
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Gender = 'F';
                    });
                  },
                  child: Container(
                      height: 185,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 27.5, vertical: 25.0),
                      decoration: BoxDecoration(
                          color: Gender == 'F'
                              ? Color.fromARGB(255, 77, 147, 152)
                              : Color.fromARGB(255, 216, 142, 197),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(children: [
                        Icon(
                          Icons.female,
                          size: 150,
                          color: Color.fromARGB(108, 244, 2, 2),
                        ),
                        Text("Female",
                            style: TextStyle(
                                color: Color.fromARGB(255, 245, 238, 146),
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold)),
                      ])),
                ),
              ]),
              const SizedBox(
                height: 0,
              ),
              Row(children: [
                Padding(
                    padding: EdgeInsets.all(23.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                              fontSize: 30,
                              height: 2,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("$height",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 50,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 125) height--;
                                  bmi = bmiCal();
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            SizedBox(width: 45),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height < 220) height++;
                                  bmi = bmiCal();
                                });
                              },
                              shape: CircleBorder(),
                              child: Icon(Icons.add, size: 40),
                            )
                          ],
                        )
                      ],
                    )),
                const Spacer(),
                Padding(
                    padding: EdgeInsets.all(23.0),
                    child: Column(children: [
                      Text("Weight",
                          style: TextStyle(
                              fontSize: 30,
                              height: 2,
                              fontWeight: FontWeight.bold)),
                      Text("$weight",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 50) weight--;

                                bmi = bmiCal();
                              });
                            },
                            shape: CircleBorder(),
                            child: Icon(Icons.remove, size: 40),
                          ),
                          SizedBox(width: 45),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 135) weight++;
                                bmi = bmiCal();
                              });
                            },
                            shape: CircleBorder(),
                            child: Icon(Icons.add, size: 40),
                          )
                        ],
                      ),
                    ])),
              ]),
              //,
              const SizedBox(
                height: 50,
              ),
              Row(children: [
                const Spacer(),
                Column(
                  children: <Widget>[
                    const Text("BMI",
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.w500)),
                    Text(bmi.toStringAsFixed(2),
                        style: TextStyle(
                            height: 2,
                            color: Color.fromARGB(255, 245, 238, 146),
                            fontSize: 55,
                            fontWeight: FontWeight.bold)),
                    Text("$level",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                  ],
                ),
                const Spacer()
              ]),
            ]))));
  }

  //methods
  double bmiCal() {
    var localVar = (weight / (height * height)) * 10000;

    if (localVar < 18.5) {
      level = "Under Weight";
    } else if (localVar < 25) {
      level = "Normal Weight";
    } else if (localVar < 30) {
      level = "Over Weight";
    } else if (localVar < 35) {
      level = "Obese Class 1";
    } else if (localVar < 40) {
      level = "Obese Class 2";
    } else if (localVar > 40) {
      level = "Obese Class 3";
    } else {
      level = '';
    }
    return localVar;
  }
}
//Text("200",style:TextStyle(color:Color.fromARGB(223, 98, 227, 102),fontSize: 25))