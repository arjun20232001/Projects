import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<Homepage> {
 String output="0";
 String currentnumber='';
 double num1=0;
 String operand="";
 void buttonPressed(String buttonText)
 {
   if(buttonText=="C")
     {
       output="0";
       currentnumber="0";
       num1=0;
       operand="";
     }
   else if(buttonText=="+"|| buttonText=="-"||buttonText=="*"|| buttonText=="/")
     {
       if(currentnumber.isNotEmpty){
         num1=double.parse(currentnumber);
         operand=buttonText;
         currentnumber="";
       }
     }
   else if(buttonText=="=")
     {
       if(currentnumber.isNotEmpty && operand.isNotEmpty)
         {
           double num2=double.parse(currentnumber);
           switch(operand)
               {
             case "+":
               output=(num1+num2).toString();
               break;
             case "-":
               output=(num1-num2).toString();
               break;
             case "*":
               output=(num1*num2).toString();
               break;
             case "/":
               output=(num1/num2).toString();
               break;
           }
           currentnumber=output;
           operand='';
         }
     }
   else{
     currentnumber+=buttonText;
     output=currentnumber;
   }


    setState(() {});
  }

  Widget Button(String button_value) {
    return Expanded(
      child: MaterialButton(
        child: Text(
          "$button_value",
          style: TextStyle(fontSize: 45, fontWeight: FontWeight.normal),
        ),
        onPressed: () {
          buttonPressed(button_value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "$operand",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$output",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ),
            ),
            Row(
              children: [
                Button("9"),
                Button("8"),
                Button("7"),
                Button("+"),
              ],
            ),
            Row(
              children: [
                Button("6"),
                Button("5"),
                Button("4"),
                Button("-"),
              ],
            ),
            Row(
              children: [
                Button("3"),
                Button("2"),
                Button("1"),
                Button("*"),
              ],
            ),
            Row(
              children: [
                Button("C"),
                Button("0"),
                Button("="),
                Button("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
