import 'package:bmi_calculator/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      home:  SplashScreen(),  ////////////////////imp/////////////////
    );}}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  var wtController= TextEditingController();  //for user value using controller
  var ftController= TextEditingController();  //same
  var inController= TextEditingController();  //same
  var result='';
  Color bgColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),

        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.w500),),
                  SizedBox(
                    height: 23,
                  ),
                  TextField(
                    controller: wtController, //for take a value of weight
                    decoration: InputDecoration(
                      label: Text('Enter Your weight in Kg',style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.gas_meter_rounded,color: Colors.yellow,),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  TextField(
                    controller: ftController, //for take a value of height
                    decoration: InputDecoration(
                      label: Text('Enter Your height in feet',style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.man,color: Colors.yellow,),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  TextField(
                    controller: inController, //for take a value of height
                    decoration: InputDecoration(
                      label: Text('Enter Your height in inch',style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.height,color: Colors.yellow,),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  ElevatedButton(onPressed: (){
                    var wt=wtController.text.toString();
                    var ft=ftController.text.toString();
                    var inch=inController.text.toString();

                    if(wt!="" && ft!="" && inch!=""){
                      //BMI Calculation
                      var Weight = int.parse(wt);
                      var Feet = int.parse(ft);
                      var Inch = int.parse(inch);

                      var totalInch = (Feet*12)+Inch;
                      //1 Inch = 0.0254 Meter
                      //1 Inch = 2.54 Cm
                      var totalmeter = (totalInch*0.0254);

                      var BMI= Weight/(totalmeter*totalmeter);

                      var msg = "";
                      if(BMI>25){
                        msg = "You are OverWeighted!!";
                        bgColor = Colors.orange;
                      }
                      else if(BMI<18){
                        msg = "You are UnderWeighted!!";
                        bgColor = Colors.blue;
                      }
                      else{  //  18= < x <= 25
                        msg = "You are Healthyy!!" ;
                        bgColor = Colors.green.shade400;
                      }

                      setState(() {
                        result = "$msg \n Your BMI is  ${BMI.toStringAsFixed(4)}";
                      });

                    }
                    else{
                      setState(() {
                        result = "Please fill all the required Blanks!!";
                      });
                    }

                  }, child: Text('Calculate')),
                  SizedBox(
                    height: 15,
                  ),
                  Text(result,style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),


                ],
              ),
            ),
          ),
        )
        
    );}}
