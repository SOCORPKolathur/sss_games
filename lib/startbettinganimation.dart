import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

int dura=8;

var end=Offset(-0.2,0);



class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
/*
  late final AnimationController _controller = AnimationController(duration:  Duration(seconds: 1), vsync: this,)
  ..repeat(reverse: true,period:Duration(seconds: 2),max: 1)..addListener(() {
    Future.delayed(Duration(milliseconds:3500),(){
      setState(() {
        //_controller.stop();
        //_controller2.stop();
       opacity=0;
      });

    },);
    });

  late final AnimationController _controller2 = AnimationController(duration:  Duration(seconds: 1), vsync: this,
      reverseDuration:Duration(seconds: 1),animationBehavior: AnimationBehavior.preserve )
    ..repeat(reverse: true,period: Duration(seconds: 2),max: 1)..addStatusListener((AnimationStatus status) {
      if(status==AnimationStatus.completed){
        print("completted");
      }
    });

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(end: end, begin: const Offset(1.5, 0.0),).
  animate(CurvedAnimation(parent: _controller, curve: Curves.fastLinearToSlowEaseIn,));

  late final Animation<Offset> _offsetAnimation2 = Tween<Offset>(end: end, begin: const Offset(-1.5, 0.0),).
  animate(CurvedAnimation(parent: _controller2, curve: Curves.fastLinearToSlowEaseIn,));


  @override
  void dispose() {


    _controller.dispose();
    super.dispose();
  }

 */
  double height=100;
  double width=300;
  double opacity=1;
  double animateheight=200;
  double animatewidth=200;
  
  
  @override
  void initState() {

    getbettingis();

    // TODO: implement initState
    super.initState();
  }

  String?bettingid;

  String?bettingstatus;



  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingid=value!["gameid"];
      bettingstatus=value["status"];
    });
  }

  updatestauswaiting(){
    FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").update({
      'status':"Waiting"
    });
  }

  updatestausamount(){
    FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").update({
      'status':"amount"
    });
  }

  updatestausstart(){
    FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").update({
      'status':"betting"
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Bettingid").snapshots(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: snapshot.data!.docs.map((e){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(e["gameid"].toString()),
                  Text(e["status"].toString()),

                  /* GestureDetector(
          onTap: (){
            Future.delayed(Duration(seconds: 1),(){
              setState(() {
                animateheight=150;
                animatewidth=150;
              });
            });
            Future.delayed(Duration(seconds: 2),(){
              setState(() {
                animateheight=250;
                animatewidth=250;
              });
            });

          },
          child: AnimatedContainer(duration: Duration(seconds: 1),
          curve: Curves.easeIn,
            height:animateheight,
            width:animatewidth,
            color: Colors.red,
            child: Center(child: Text("gdgdfgdf")),
          ),
          ),*/

                //  e["status"].toString()=="betting"?bettingstage():Container(),

               //   e["status"].toString()=="waitging"?Waitingstage():Container(),

                //  e["status"].toString()=="amount"?amountstage():Container(),

                  e["status"].toString()=="betting"?fourtyxcontainer():Container(),


                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


class bettingstage extends StatefulWidget {


  @override
  State<bettingstage> createState() => _bettingstageState();
}

class _bettingstageState extends State<bettingstage> {

  @override
  void initState() {
    getbettingis();
    // TODO: implement initState
    super.initState();
  }

  String?bettingstatus;

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["status"];
      print(bettingstatus);
    });
   Future.delayed(Duration(seconds: 2),(){

   setState(() {
    opacity=0;
   });

  });

  }

  double  opacity=1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="betting"?300:520),
                curve: Curves.easeOutSine,
                  duration: Duration(seconds: 2),
                height:bettingstatus=="betting"?50:50,
                width:bettingstatus=="betting"?200:200,
               child: bettingstatus=="betting"?Image.asset("assets/gamestart.png"):
             Container(),
              ),
            ),

            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity,
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="betting"?300:0),
                curve: Curves.easeOutSine,
                duration: Duration(seconds: 2),
                height:bettingstatus=="betting"?50:50,
                width:bettingstatus=="betting"?200:200,
               child: Center(child:
               bettingstatus=="betting"?Text("Start Betting"):Text("")
               ),
              ),
            ),


          ],
        ),
      ],
    );
  }
}


class Waitingstage extends StatefulWidget {
  const Waitingstage({Key? key}) : super(key: key);

  @override
  State<Waitingstage> createState() => _WaitingstageState();
}

class _WaitingstageState extends State<Waitingstage> {

  @override
  void initState() {
    getbettingis();
    // TODO: implement initState
    super.initState();
  }

  String?bettingstatus;

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["status"];
      print(bettingstatus);
    });
    Future.delayed(Duration(seconds: 2),(){

      setState(() {
        opacity=0;
      });

    });

  }

  double  opacity=1;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Stack(
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="Waiting"?300:520),
                curve: Curves.easeIn,
                duration: Duration(seconds: 2),
                height:bettingstatus=="waitging"?50:50,
                width:bettingstatus=="waitging"?200:200,
                child: bettingstatus=="waitging"?Image.asset("assets/gamestart.png"):
                Container(),
              ),
            ),

            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity,
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="betting"?300:0),
                curve: Curves.easeIn,
                duration: Duration(seconds: 2),
                height:bettingstatus=="waitging"?50:50,
                width:bettingstatus=="waitging"?200:200,
                child: Center(child:
                bettingstatus=="waitging"?Text("Stop Betting"):Text("")
                ),
              ),
            ),


          ],
        ),
      ],
    );
  }
}


class amountstage extends StatefulWidget {
  const amountstage({Key? key}) : super(key: key);

  @override
  State<amountstage> createState() => _amountstageState();
}

class _amountstageState extends State<amountstage> {

  @override
  void initState() {
    getbettingis();
    // TODO: implement initState
    super.initState();
  }

  String?bettingstatus;

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["status"];
      print(bettingstatus);
    });
    Future.delayed(Duration(seconds: 2),(){

      setState(() {
        opacity=0;
      });

    });

  }

  double  opacity=1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="amount"?300:520),
                curve: Curves.easeOutSine,
                duration: Duration(seconds: 2),
                height:bettingstatus=="amount"?50:50,
                width:bettingstatus=="amount"?200:200,
                child: bettingstatus=="amount"?Image.asset("assets/gamestart.png"):
                Container(),
              ),
            ),

            AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: opacity,
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: bettingstatus=="amount"?300:0),
                curve: Curves.easeOutSine,
                duration: Duration(seconds: 2),
                height:bettingstatus=="amount"?50:50,
                width:bettingstatus=="amount"?200:200,
                child: Center(child:
                bettingstatus=="amount"?Text("Winner stage"):Text("")
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class fourtyxcontainer extends StatefulWidget {
  const fourtyxcontainer({Key? key}) : super(key: key);

  @override
  State<fourtyxcontainer> createState() => _fourtyxcontainerState();
}

class _fourtyxcontainerState extends State<fourtyxcontainer> {

  @override
  void initState() {
    getbettingis();
   // animacontroller=AnimationController(vsync:this,duration: Duration(seconds: 2));
   // animate=CurvedAnimation(parent: animacontroller, curve:Curves.easeIn,reverseCurve: Curves.ease);
   // animacontroller.repeat(reverse: false);
    // TODO: implement initState
    super.initState();
  }

  String?bettingstatus;

   //late AnimationController animacontroller;

  //late Animation<double> animate;

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc("gdg").get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["postionvalue"];
      print(bettingstatus);
    });
    Future.delayed(Duration(milliseconds:2000),(){
      setState(() {
        opacity=0;

      });

    });

    Future.delayed(Duration(milliseconds:3100),(){
      setState(() {
        opacity2=0;

      });

    });

  }

  double  opacity=1;

  double  opacity2=1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [


              AnimatedOpacity(
              opacity: opacity2,
              duration: Duration(seconds: 1),
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: Duration(seconds: 1),
                height:300,
                width:300,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: bettingstatus=="betting"?
                          Colors.yellow:
                          Colors.transparent,
                          spreadRadius: bettingstatus=="betting"?
                          10:0,
                          blurRadius: bettingstatus=="betting"?10:0
                      )
                    ]
                ),
              ),
            ),

              Container(
                height: 300,
                width: 300,
                child: Image.network("https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",fit: BoxFit.cover,),
              ),

              Positioned(
                top: 150,
                left: 120,
                child: AnimatedOpacity(
                   opacity: opacity,
                   duration:Duration(seconds: 1),
                   child: ZoomIn(
                     animate: true,
                     child: Text("winnner",),
                     duration: Duration(milliseconds:1000),
                     manualTrigger: false,
                     from: 5,
                   ),
                 ),
              )


          ],
        ),
      ],
    );
  }
}



