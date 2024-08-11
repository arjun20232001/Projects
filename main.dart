import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "BMI Calculator",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String _bmiResult = "";
  String _healthStatus = "";

  void _calculateBMI() {
    final int? age = int.tryParse(_ageController.text);
    final double? height = double.tryParse(_heightController.text);
    final double? weight = double.tryParse(_weightController.text);

    if (age != null && height != null && weight != null) {
      // Calculate BMI
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        _bmiResult = "Your BMI is: ${bmi.toStringAsFixed(2)}";
        _healthStatus = _getHealthStatus(bmi);
      });
    } else {
      setState(() {
        _bmiResult = "Please enter valid values.";
        _healthStatus = "";
      });
    }
  }

  String _getHealthStatus(double bmi) {
    if (bmi < 18.5) {
      return "Health Status: Underweight";
    } else if (bmi < 24.9) {
      return "Health Status: Normal weight";
    } else if (bmi < 29.9) {
      return "Health Status: Overweight";
    } else {
      return "Health Status: Obesity";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.grey.shade200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Years"),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 9),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Height (cm)",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                            child: TextField(
                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "cm"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 9),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight (kg)",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          SizedBox(
                            width: 30,
                            child: TextField(
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(hintText: "kg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 135,
                child: ElevatedButton(
                  onPressed: _calculateBMI,
                  child: Text("Calculate"),
                ),
              ),
              SizedBox(height: 35),
              Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text(
                    "Result",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                _bmiResult,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              Text(
                _healthStatus,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 228),
              Container(
                color: Colors.blue,
                height: 50,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}