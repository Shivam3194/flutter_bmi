import 'package:flutter/material.dart';

void main() {
  runApp(const MyBMI());
}

class MyBMI extends StatefulWidget {
  const MyBMI({super.key});

  @override
  State<MyBMI> createState() => _MyBMIState();
}

class _MyBMIState extends State<MyBMI> {

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";

  var bgcolor =Colors.indigo.shade200;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Container(
              color: bgcolor,
              width: 300, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const SizedBox(height: 11),

                  const Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Pacifico',
                    ),
                  ),

                  const SizedBox(height: 11),

                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Weight(in kgs)',style: TextStyle(fontFamily: 'Pacifico'),),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 11),

                  TextField(
                    controller: ftController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height(in feet)',style: TextStyle(fontFamily: 'Pacifico'),),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 11),
                  
                  TextField(
                    controller: inController,
                    decoration: const InputDecoration(
                      label: Text('Enter Your Height(in inch)',style: TextStyle(fontFamily: 'Pacifico'),),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 10),

                 ElevatedButton(onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){
                        var iWt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iInch = int.parse(inch);

                        var tInch = ift*12+iInch;
                        var tCm = tInch*2.54;
                        var tM = tCm/100;

                        var bmi = iWt/(tM*tM);

                        var msg="";

                        if(bmi > 25){
                          msg = 'You are overweight';
                          bgcolor = Colors.orange.shade200;
                        }

                        else if(bmi < 18){
                          msg = 'You are underweight';
                          bgcolor = Colors.red.shade200;
                        }
                        else{
                          msg = 'You Are healthy';
                          bgcolor = Colors.green.shade200;

                         }
                        setState(() {
                             result = "$msg \nYour BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                     
                    }
                    else{
                      setState(() {
                        result = 'Please Fill all the required Details';
                        bgcolor = Colors.yellow;
                      });
                    }
                 }, 
                 child: const Text('Calculate'),
                 ),
                 Text(result, style: const TextStyle(fontSize: 16),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
