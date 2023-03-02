

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Stream2 extends StatefulWidget {

  @override
  State<Stream2> createState() => _Stream2State();
}

class _Stream2State extends State<Stream2>with TickerProviderStateMixin {

  var position;
  String userid=FirebaseAuth.instance.currentUser!.uid.toString();

  List coinlist=[];

 late AnimationController animation;
 late Animation<Offset>Offsetanimation;

  @override
  void initState() {
    ganera();
    useractive();

    // TODO: implement initState
    super.initState();
  }
  //user status update function(active function)
  useractive(){

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "active":true,
    });
  }

  //user status update function(inactive function)
  userinactive(){
    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "active":false,
    });
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('state = $state');

    switch(state) {

      case AppLifecycleState.paused:

        userinactive();

        break;

      case AppLifecycleState.resumed:
        userinactive();
        break;
      case AppLifecycleState.inactive:
        userinactive();
        break;
      case AppLifecycleState.detached:
        userinactive();
        break;
    }

  }



int selectedcoin=10;//coin select

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:WillPopScope(
        onWillPop: ()async{
          userinactive();//user active or inactive status update function
          return true;
        },
        child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(//auth-user collection stream
              stream: FirebaseFirestore.instance.collection("Users").where("user id",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
              builder: (context, usersnapshot) {
                return
                  Container(
                  child: StreamBuilder<QuerySnapshot>(//betting stream
                    stream: FirebaseFirestore.instance.collection("Bettingid").snapshots(),
                    builder: (context, snapshot) {

                      if(!snapshot.hasData){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(snapshot.hasData==null){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return  Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text(status.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),

                          Center(child: Text(finalcheck.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance.collection("Users").
                                where("user id", isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
                                builder: (context, snapshot) {
                                return Row( children:snapshot.data!.docs.map((e){
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("wallet amout:"),
                                      Text(e["wallet amount"].toString()),
                                    ],
                                  );
                                }).toList(),);
                              },),
                            ],
                          ),

                          Container(
                            height: 230,
                            width: 300,
                            child: GridView(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,mainAxisSpacing: 10,
                                childAspectRatio: 110/65
                              ),
                              children: [


                                //position 40x container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers();
                                    setState(() {
                                      coin.add("40x");
                                    });
                                    print("40x");
                                  },
                                  child:fourtyxcontainer(),
                                ),

                                //position 25x container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers2();
                                    setState(() {
                                      coin.add("25x");

                                    });
                                    print("25x");
                                  },
                                  child: twentyfivexcontainer(),
                                ),

                                //position 15x container
                                GestureDetector(
                                  onTap:(){

                                    updatesusers3();
                                    setState(() {
                                      coin.add("15x");

                                    });
                                    print("15x");
                                  },
                                  child: fifteenxcontainer(),
                                ),

                                //position10x container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers4();
                                    setState(() {
                                      coin.add("10x");
                                    });
                                    print("10x");
                                  },
                                  child:tenxcontainer() ,
                                ),

                                //position5x1 container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers5();

                                    setState(() {
                                      coin.add("5x1");

                                    });
                                    print("5x1");
                                  },
                                  child: fivex1container(),
                                ),

                                //position5x2 container
                                GestureDetector(
                                  onTap:(){

                                    updatesusers6();
                                    setState(() {
                                      coin.add("5x2");

                                    });
                                    print("5x2");

                                  },
                                  child: fivex2container(),
                                ),

                                //position5x3 container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers7();
                                    setState(() {
                                      coin.add("5x3");
                                    });
                                    print("5x3");

                                  },
                                  child: fivex3container(),
                                ),


                                //position5x4 container
                                GestureDetector(
                                  onTap:(){
                                    updatesusers8();
                                    setState(() {
                                      coin.add("5x4");
                                    });

                                    print("5x4");

                                  },
                                  child: fivex4container(),
                                ),

                              ],
                            )
                          ),


                          //coins and container and designs
                          Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedcoin=10;
                                      });
                                      print(selectedcoin);

                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      color: selectedcoin==10?Colors.green:Colors.red,
                                      child: Center(child: Text("10rs")),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedcoin=20;
                                      });
                                      print(selectedcoin);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      color:selectedcoin==20?Colors.green:Colors.red ,
                                      child: Center(child: Text("20rs")),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedcoin=30;
                                      });
                                      print(selectedcoin);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      color: selectedcoin==30?Colors.green:Colors.red,
                                      child: Center(child: Text("30rs")),
                                    ),
                                  ),

                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedcoin=40;
                                      });
                                      print(selectedcoin);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      color: selectedcoin==40?Colors.green:Colors.red,
                                      child: Center(child: Text("40rs")),
                                    ),
                                  ),


                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        selectedcoin=50;
                                      });
                                      print(selectedcoin);
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 40,
                                      color: selectedcoin==50?Colors.green:Colors.red,
                                      child: Center(child: Text("50rs")),
                                    ),
                                  ),
                                ],
                              ),
                              Text(coin.toString()),
                              ElevatedButton(onPressed:(){
                                setState(() {
                                  coin.clear();
                                });
                              }, child:Text("Clear")),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
  List coin=[];//add coins

  String finalcheck="";//gameid

  String status="";//check status

  //check gameid and status

  ganera(){
    final docRef = FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv");
    docRef.snapshots().listen(
          (event) {
            Map<String,dynamic>? value = event.data();
            setState(() {
              finalcheck=value!["gameid"];
              status=value["status"];

            });

            FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).limit(1).get()
                .then((checkSnapshot) async {
              if (checkSnapshot.size == 0) {
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("40x").set(
                    {
                      "totalamount": 0,
                      "postion": 40,
                      "postionvalue":'40x'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("25x").set(
                    {
                      "totalamount": 0,
                      "postion": 25,
                      "postionvalue":'25x'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("15x").set(
                    {
                      "totalamount": 0,
                      "postion": 15,
                      "postionvalue":'15x'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("10x").set(
                    {
                      "totalamount": 0,
                      "postion": 10,
                      "postionvalue":'10x'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x1").set(
                    {
                      "totalamount": 0,
                      "postion": 5,
                      "postionvalue":'5x1'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x2").set(
                    {
                      "totalamount": 0,
                      "postion": 5,
                      "postionvalue":'5x2'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x3").set(
                    {
                      "totalamount": 0,
                      "postion": 5,
                      "postionvalue":'5x3'

                    }
                );
                FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x4").set(
                    {
                      "totalamount": 0,
                      "postion": 5,
                      "postionvalue":'5x4'

                    }
                );

              }
            });
          },
      onError: (error) => print("Listen failed: $error"),
    );

}

 //40x-position update function(Total betting and users collection)

  updatesusers() async {
    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("40x").
    update(
      {

        "userid": FieldValue.arrayUnion([userid]),
        "postion": 40,
        "totalamount": FieldValue.increment(selectedcoin),
        "postionvalue":'40x'
      }
    );



    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("40x").update({

      'position':40,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'40x'

    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });



  }

  //25x-position update function(Total betting and users collection)
  updatesusers2() async {

    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("25x").
    update(
      {

        "userid":FieldValue.arrayUnion([userid]),
        "postion": 25,
        "totalamount": FieldValue.increment(selectedcoin),
        "postionvalue":'25x'

      }
    );

    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("25x").update({

      'position':25,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'25x'

    });

     FirebaseFirestore.instance.collection("Users").doc(userid).update({
       "wallet amount":FieldValue.increment(-selectedcoin)
     });


  }

  //15x-position update function(Total betting and users collection)
  updatesusers3() async {

    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("15x").
    update(
        {

          "userid":FieldValue.arrayUnion([userid]),
          "postion": 15,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'15x'

        }
    );


    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("15x").update({

      'position':15,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'15x'

    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });



  }

  //10x-position update function(Total betting and users collection)
  updatesusers4() async {

    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("10x").
    update(
        {

          "userid": FieldValue.arrayUnion([userid]),
          "postion": 10,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'10x'

        }
    );



    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("10x").update({

      'position':10,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'10x'

    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });


  }

  //5x1-position update function(Total betting and users collection)
  updatesusers5() async {

    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("5x1").
    update(
        {

          "userid": FieldValue.arrayUnion([userid]),
          "postion": 5,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'5x1'

        }
    );

    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x1").update({

      'position':5,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'5x1'

    });


    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });

  }

  //5x2-position update function(Total betting and users collection)
  updatesusers6() async {

    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("5x2").
    update(
        {

          "userid": FieldValue.arrayUnion([userid]),
          "postion": 5,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'5x2'

        }
    );


    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x2").update({

      'position':5,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'5x2'

    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });


  }

  //5x3-position update function(Total betting and users collection)
  updatesusers7() async {



    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("5x3").
    update(
        {
          "userid": FieldValue.arrayUnion([userid]),
          "postion": 5,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'5x3'

        }
    );


    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x3").update({

      'position':5,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'5x3'

    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });


  }

  //5x4-position update function(Total betting and users collection)
  updatesusers8() async {


    FirebaseFirestore.instance.collection("TotalBetting").doc(finalcheck).collection("Position").doc("5x4").
    update(
        {
          "userid": FieldValue.arrayUnion([userid]),
          "postion": 5,
          "totalamount": FieldValue.increment(selectedcoin),
          "postionvalue":'5x4'
        }
    );


    FirebaseFirestore.instance.collection("Users").doc(userid).collection(finalcheck).doc("5x4").update({
      'position':5,
      'totalamount':FieldValue.increment(selectedcoin),
      "postionvalue":'5x4'
    });

    FirebaseFirestore.instance.collection("Users").doc(userid).update({
      "wallet amount":FieldValue.increment(-selectedcoin)
    });

  }


}




//40x widgets

class fourtyxcontainer extends StatefulWidget {


  @override
  State<fourtyxcontainer> createState() => _fourtyxcontainerState();
}

class _fourtyxcontainerState extends State<fourtyxcontainer> {

  @override
  void initState() {

    print("dfhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhg");
    getgameid();
    getbettingis();
    super.initState();
  }

  String bettingstatus="";

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";

  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
      print(positionstatus);

    });
  }

  double  opacity=1;

  double  opacity2=1;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=="amount"&&
                          bettingstatus=="40x"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=="amount"
                          &&
                          bettingstatus=="40x"?
                      30:0,
                      blurRadius:positionstatus=="amount" && bettingstatus=="40x"?30:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.indigo,
          child: Center(child: Text("40x")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=="amount"
                &&
                bettingstatus=="40x"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}



//25x widgets
class twentyfivexcontainer extends StatefulWidget {
  const twentyfivexcontainer({Key? key}) : super(key: key);

  @override
  State<twentyfivexcontainer> createState() => _twentyfivexcontainerState();
}

class _twentyfivexcontainerState extends State<twentyfivexcontainer> {

  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=="amount"&&
                      bettingstatus=="25x"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:positionstatus=="amount"&& bettingstatus=="25x"?
                      10:0,
                      blurRadius: positionstatus=="amount"&&bettingstatus=="25x"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.teal,
          child: Center(child: Text("25x")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=="amount"&& bettingstatus=="25x"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}


//15x widgets

class fifteenxcontainer extends StatefulWidget {
  const fifteenxcontainer({Key? key}) : super(key: key);

  @override
  State<fifteenxcontainer> createState() => _fifteenxcontainerState();
}

class _fifteenxcontainerState extends State<fifteenxcontainer> {

  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=='amount'&&
                      bettingstatus=="15x"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="15x"?
                      10:0,
                      blurRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="15x"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.purpleAccent,
          child: Center(child: Text("15x")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=='amount'&&
            bettingstatus=="15x"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}


//10x widgets
class tenxcontainer extends StatefulWidget {
  const tenxcontainer({Key? key}) : super(key: key);

  @override
  State<tenxcontainer> createState() => _tenxcontainerState();
}

class _tenxcontainerState extends State<tenxcontainer> {

  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=="amount"&&
                      bettingstatus=="10x"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=="amount"&&
                      bettingstatus=="10x"?
                      10:0,
                      blurRadius:
                      positionstatus=="amount"&&
                      bettingstatus=="10x"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.pink,
          child: Center(child: Text("10x")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=="amount"&&
       bettingstatus=="10x"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}

//5x1 widgets

class fivex1container extends StatefulWidget {
  const fivex1container({Key? key}) : super(key: key);

  @override
  State<fivex1container> createState() => _fivex1containerState();
}

class _fivex1containerState extends State<fivex1container> {
  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=="amount"&&
                      bettingstatus=="5x1"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=="amount"&&
                      bettingstatus=="5x1"?
                      10:0,
                      blurRadius:
                      positionstatus=="amount"&&
                      bettingstatus=="5x1"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text("5x1")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=="amount"&&
    bettingstatus=="5x1"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}

//5x2 widgets


class fivex2container extends StatefulWidget {
  const fivex2container({Key? key}) : super(key: key);

  @override
  State<fivex2container> createState() => _fivex2containerState();
}

class _fivex2containerState extends State<fivex2container> {

  @override
  void initState() {
    getgameid();
    getbettingis();

    // TODO: implement initState
    super.initState();
  }

  String?bettingstatus;

  //late AnimationController animacontroller;

  //late Animation<double> animate;

  getbettingis()async{
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=='amount'&&
                      bettingstatus=="5x2"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x2"?
                      10:0,
                      blurRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x2"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.yellow,
          child: Center(child: Text("5x2")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=='amount'&&
    bettingstatus=="5x2"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}

//5x3 widgets

class fivex3container extends StatefulWidget {
  const fivex3container({Key? key}) : super(key: key);

  @override
  State<fivex3container> createState() => _fivex3containerState();
}

class _fivex3containerState extends State<fivex3container> {

  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=='amount'&&
                      bettingstatus=="5x3"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x3"?
                      10:0,
                      blurRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x3"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text("5x2")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=='amount'&&
              bettingstatus=="5x3"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}

//5x4 widgets



class fivex4container extends StatefulWidget {
  const fivex4container({Key? key}) : super(key: key);

  @override
  State<fivex4container> createState() => _fivex4containerState();
}

class _fivex4containerState extends State<fivex4container> {

  @override
  void initState() {
    getgameid();
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
    var getbetid=await FirebaseFirestore.instance.collection("TotalBetting").doc(positionid).get();
    Map<String,dynamic>?value=getbetid.data();
    setState(() {
      bettingstatus=value!["winnerpostionvalue"];
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

  String positionid="";
  String positionstatus="";

  getgameid()async{

    var gameid = await FirebaseFirestore.instance.collection("Bettingid").doc("OtuJn5yy7ntwaTuv").get();
    Map<String,dynamic>?Value=gameid.data();
    setState(() {
      positionid=Value!["gameid"];
      positionstatus=Value["status"];
    });
  }

  double  opacity=1;

  double  opacity2=1;


  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      color:
                      positionstatus=='amount'&&
                      bettingstatus=="5x4"?
                      Colors.yellow:
                      Colors.transparent,
                      spreadRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x4"?
                      10:0,
                      blurRadius:
                      positionstatus=='amount'&&
                      bettingstatus=="5x4"?10:0
                  )
                ]
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          color: Colors.red,
          child: Center(child: Text("5x4")),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: AnimatedOpacity(
            opacity: opacity,
            duration:Duration(seconds: 1),
            child:
            positionstatus=='amount'&&
            bettingstatus=="5x4"?
            ZoomIn(
              animate: true,
              child: Text("winnner",),
              duration: Duration(milliseconds:1000),
              manualTrigger: false,
              from: 1,
            ):SizedBox(),
          ),
        )


      ],
    );
  }
}












