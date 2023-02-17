

import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'dart:math';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:random_string/random_string.dart';
import 'dart:math' show Random;


class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  // We can detech the location of the card by this  GlobalKey<CartIconKey>
  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart2 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart3 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart4 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart5 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart6 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart7 = GlobalKey<CartIconKey>();
  GlobalKey<CartIconKey> gkCart8 = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  var _cartQuantityItems = 0;
  
  final GlobalKey imageGlobalKey = GlobalKey();
  final GlobalKey imageGlobalKey2 = GlobalKey();
  final GlobalKey imageGlobalKey3 = GlobalKey();
  final GlobalKey imageGlobalKey4 = GlobalKey();
  final GlobalKey imageGlobalKey5 = GlobalKey();

  var com;

  var gcom;



  int selected=10;
  double height=60;
  double width=60;

   var fourtyx =[];
   var twentyx =[];
   var fifteenx =[];
   var tenx =[];
   var fivex =[];
   var fivex2 =[];
   var fivex3 =[];
   var fivex4 =[];
  int countdownvalue=10;
  final CountdownController _controller =  CountdownController(autoStart: true);

  String bettindid="";

   generateid(){

  setState(() {
    bettindid=randomAlphaNumeric(16);

    print(bettindid);
   });
   print(bettindid);

  }


  @override
  void initState() {


  }


  final _firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return AddToCartAnimation(
      // To send the library the location of the Cart icon
      gkCart: gcom,
      rotation: false,
      dragToCardCurve: Curves.fastLinearToSlowEaseIn,
      dragToCardDuration: const Duration(milliseconds: 1000),
      previewCurve: Curves.linearToEaseOut,
      previewDuration: const Duration(milliseconds: 2),
      previewHeight: 0,
      previewWidth: 0,
      opacity: 0.85,
      initiaJump: false,
      receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
        // You can run the animation by addToCardAnimationMethod, just pass trough the the global key of  the image as parameter
        this.runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                //playboard container
                Container(
                  height: 300,
                  child: Container(
                    width: 500,
                    height: 165,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/play board.png")
                      )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                           StreamBuilder<QuerySnapshot>(
                               stream:FirebaseFirestore.instance.collection("Total Listing").where("coins").
                               where("Timecstamp").snapshots() ,
                               builder:(context, snapshot) {
                                 return GestureDetector(
                                   onTap: (){
                                     setState(() {
                                       gcom=gkCart;
                                     });

                                     listClick(com);
                                     countdownfunction("40");


                                     print("40x");

                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.all(4.0),
                                       child: Container(
                                         key: gkCart,
                                         width: 60,
                                         height: 60,
                                         color: Colors.blue,
                                         child: Stack(
                                           children: snapshot.data!.docs.map((val){
                                             return  val["coins"]==40?
                                             Image.asset(val["coins"].toString()):
                                             Text('40X');
                                           }).toList()
                                         ),

                                       ),
                                     ),


                                 );
                               }, ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart2;
                                  });
                                  listClick(com);
                                  print('25');
                                },
                                child: Container(
                                  key: gkCart2,
                                  height: 60,
                                  width: 60,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text("25x"),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart3;
                                  });
                                  listClick(com);
                                  print('15');
                                },
                                child: Container(
                                  key: gkCart3,
                                  height: 60,
                                  width: 60,
                                  color: Colors.pink,
                                  child: Center(
                                    child: Text("15x"),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart4;
                                  });
                                  listClick(com);
                                  print('10');
                                },
                                child: Container(
                                  key: gkCart4,
                                  height: 60,
                                  width: 60,
                                  color: Colors.lightBlue,
                                  child: Center(
                                    child: Text("10x"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  gcom=gkCart5;
                                });
                                listClick(com);
                                print("40x");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  key: gkCart5,
                                  width: 60,
                                  height: 60,
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text("5x"),
                                  ),

                                ),
                              ),

                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart6;
                                  });
                                  listClick(com);
                                  print('25');
                                },
                                child: Container(
                                  key: gkCart6,
                                  height: 60,
                                  width: 60,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text("5x"),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart7;
                                  });
                                  listClick(com);
                                  print('15');
                                },
                                child: Container(
                                  key: gkCart7,
                                  height: 60,
                                  width: 60,
                                  color: Colors.pink,
                                  child: Center(
                                    child: Text("5x"),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    gcom=gkCart8;
                                  });
                                  listClick(com);
                                  print('10');
                                },
                                child: Container(
                                  key: gkCart8,
                                  height: 60,
                                  width: 60,
                                  color: Colors.lightBlue,
                                  child: Center(
                                    child: Text("5x"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 100,
                              width: 150,
                              child: Countdown(
                                // controller: _controller,
                                  seconds: countdownvalue,
                                  controller:_controller ,
                                  build: (_, double time) => Text(
                                    time.toString(),
                                    style: TextStyle(
                                      fontSize: 100,
                                    ),
                                  ),
                                  interval: Duration(milliseconds: 100),
                                  onFinished: () {
                                    print("finish");

                                   // countdownfunction(gcom);

                                    print("finish");
                                  }
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                //Coins container
                Positioned(
                  top: 180,
                  child: Container(
                    height: 100,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //coins
                        Row(
                          children: [

                            Padding(
                              padding: selected==10? EdgeInsets.all(6.0): EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    com=imageGlobalKey;
                                    print("1");
                                    selected=10;
                                     height=70;
                                     width=70;
                                  });

                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                    seconds: 2
                                  ),
                                curve: Curves.linearToEaseOut,
                                key: imageGlobalKey,
                                width: selected==10?height:60,
                                height: selected==10?width:60,
                                child: Image.asset("assets/10.png"),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    selected==10?BoxShadow(
                                      color: Color(0xfffdfcc6),
                                      blurRadius: 2,
                                        spreadRadius: 0.5
                                    ):BoxShadow(
                                        color: Colors.transparent,
                                        blurRadius: 0,spreadRadius: 0
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/10.png",)
                                  )
                                ),
                                ),

                              ),

                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    com=imageGlobalKey2;
                                    selected=50;
                                    height=70;
                                    width=70;
                                    print("2");
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                    seconds: 1
                                  ),
                                curve: Curves.linearToEaseOut,
                                key: imageGlobalKey2,
                                width: selected==50?height:60,
                                height: selected==50?width:60,
                                  child: Image.asset("assets/50.png"),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        boxShadow: [
                                          selected==50?BoxShadow(
                                            color: Color(0xfffdfcc6),
                                            spreadRadius: 0.5
                                              ,blurRadius: 2
                                          ):BoxShadow(
                                              color: Colors.transparent,
                                              spreadRadius: 0
                                              ,blurRadius: 0
                                          )
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/50.png",)
                                        )
                                    ),
                               ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    com=imageGlobalKey3;
                                    print("3");
                                    selected=100;
                                    height=70;
                                    height=70;
                                  });
                                },
                                child: AnimatedContainer(

                                  duration: Duration(
                                      seconds: 1
                                  ),
                                  curve: Curves.linearToEaseOut,
                                  key: imageGlobalKey3,
                                    height: selected==100?height:60,
                                    width: selected==100?height:60,
                                  child: Image.asset("assets/100.png"),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          selected==100?BoxShadow(
                                              color: Color(0xfffdfcc6),
                                              blurRadius: 2,
                                              spreadRadius: 0.5
                                          ):BoxShadow(
                                              color: Colors.transparent,
                                              blurRadius: 0,spreadRadius: 0
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/100.png",)
                                        )
                                    ),
                                   ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    com=imageGlobalKey4;
                                    selected=200;
                                    height=70;
                                    width=70;
                                    print("4");
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                      seconds: 1
                                  ),
                                  curve: Curves.linearToEaseOut,
                                    key: imageGlobalKey4,
                                    height:selected==200?height: 60,
                                    width: selected==200?width:60,
                                  child: Image.asset("assets/200.png"),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          selected==200?BoxShadow(
                                              color: Color(0xfffdfcc6),
                                              blurRadius: 2,
                                              spreadRadius: 0.5
                                          ):BoxShadow(
                                              color: Colors.transparent,
                                              blurRadius: 0,spreadRadius: 0
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/200.png",)
                                        )
                                    ),
                                   ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    com=imageGlobalKey5;
                                    selected=500;
                                    height=70;
                                    width=70;
                                    print("4");
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                      seconds: 1
                                  ),
                                  curve: Curves.linearToEaseOut,
                                    key: imageGlobalKey5,
                                    height:selected==500?height:60,
                                    width: selected==500?width:60,
                                  child: Image.asset("assets/500.png"),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          selected==500?BoxShadow(
                                              color: Color(0xfffdfcc6),
                                              blurRadius: 2,
                                              spreadRadius: 0.5
                                          ):BoxShadow(
                                              color: Colors.transparent,
                                              blurRadius: 0,spreadRadius: 0
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/500.png",)
                                        )
                                    ),
                                   ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }

  // Improvement/Suggestion 4.4 -> Running AddTOCartAnimation BEFORE runCArtAnimation
  void listClick(GlobalKey gkImageContainer) async {
    await runAddToCardAnimation(gkImageContainer);
    await gkCart.currentState!.runCartAnimation((++_cartQuantityItems).toString());
  }
  

  countdownfunction(gcom) {

    FirebaseFirestore.instance.collection("Total Listing").doc().set({

      "betting positions": gcom,
      "betting id":"",
      "userid":FirebaseAuth.instance.currentUser!.uid,
      "Timecstamp": DateTime
          .now()
          .microsecondsSinceEpoch,
      'coins': selected,


    });
    print('Total listing');

    FirebaseFirestore.instance.collection("Users Listing").doc(
        FirebaseAuth.instance.currentUser!.uid)
        .collection("Betting").doc()
        .set({
      "betting positions": gcom,
      "Amount": _cartQuantityItems,
      "Timecstamp": DateTime
          .now()
          .microsecondsSinceEpoch,
      'coins': selected,

    });
  }




}