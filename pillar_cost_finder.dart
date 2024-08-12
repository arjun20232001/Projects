import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: "Pillar Cost Finder",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final area1 = TextEditingController();
  final area2 = TextEditingController();
  final depth = TextEditingController();
  final cost_of_excavation = TextEditingController();
  final cost_of_the_steel = TextEditingController();
  final weight_of_the_steel = TextEditingController();
  final cost_of_material = TextEditingController();
  final cost_of_labour = TextEditingController();

  String result = "";

  void calculateCosts() {
    // Retrieve input values
    double? a1 = double.tryParse(area1.text);
    double? a2 = double.tryParse(area2.text);
    double? d = double.tryParse(depth.text);
    double? costExcavation = double.tryParse(cost_of_excavation.text);
    double? costSteel = double.tryParse(cost_of_the_steel.text);
    double? weightSteel = double.tryParse(weight_of_the_steel.text);
    double? costMaterial = double.tryParse(cost_of_material.text);
    double? costLabour = double.tryParse(cost_of_labour.text);

    // Check for valid inputs
    if (a1 != null && a2 != null && d != null && costExcavation != null) {
      double volume = a1 * a2 * d;
      double totalExcavationCost = volume * costExcavation;

      double totalSteelCost = costSteel != null && weightSteel != null
          ? costSteel * weightSteel
          : 0.0;

      double totalMaterialCost = costMaterial ?? 0.0;
      double totalLabourCost = costLabour ?? 0.0;

      setState(() {
        result =
        "Total Excavation Cost: ${totalExcavationCost.toStringAsFixed(2)}\n"
            "Total Steel Cost: ${totalSteelCost.toStringAsFixed(2)}\n"
            "Total Material Cost: ${totalMaterialCost.toStringAsFixed(2)}\n"
            "Total Labour Cost: ${totalLabourCost.toStringAsFixed(2)}\n"
            "Total Cost: ${(totalExcavationCost + totalSteelCost + totalMaterialCost + totalLabourCost).toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        result = "Please enter valid numbers in all required fields.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pillar Cost Finder"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Excavation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black, // Changed color to black
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Volume = Area * Depth",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Changed color to black
                      ),
                    ),
                    SizedBox(height: 10),
                    buildInputField("Area 1 (meter)", area1),
                    buildInputField("Area 2 (meter)", area2),
                    buildInputField("Depth (meter)", depth),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cost Per Cubic Meter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black, // Changed color to black
                      ),
                    ),
                    SizedBox(height: 30),
                    buildInputField("Cost", cost_of_excavation),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Steel Cost",
                  style: TextStyle(
                    color: Colors.black, // Changed color to black
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cost Of The Steel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black, // Changed color to black
                      ),
                    ),
                    SizedBox(height: 10),
                    buildInputField("Cost", cost_of_the_steel),
                    buildInputField("Weight", weight_of_the_steel),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Shuttering Cost",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Changed color to black
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Assuming Cost for Setup and Material",
                        style: TextStyle(color: Colors.black)), // Changed color to black
                    SizedBox(height: 10),
                    buildInputField("Cost", cost_of_material),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Labour Cost",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black, // Changed color to black
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cost Given To Labour",
                        style: TextStyle(color: Colors.black)), // Changed color to black
                    SizedBox(height: 10),
                    buildInputField("Cost", cost_of_labour),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: calculateCosts,
                  child: Text("Calculate"),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Result",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Changed color to black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(color: Colors.black), // Changed color to black
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
