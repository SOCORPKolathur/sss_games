

import 'package:flutter/material.dart';

class playboard extends StatefulWidget {
  const playboard({Key? key}) : super(key: key);

  @override
  State<playboard> createState() => _playboardState();
}

class _playboardState extends State<playboard> with TickerProviderStateMixin {

  Animation?animation;
  Animation?animation2;
  AnimationController?controller;
  AnimationController?controller2;

   List<Widget>coins=List.generate(15, (index) =>Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12)
    ),
  ));
 //List<AnimationController>animated=List.generate(15, (index) =>AnimationController(vsync: this,duration: Duration(seconds: 1)));
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));


    Tween tween =  Tween(begin: 0.0, end: 40.0);

     animation = tween.animate(controller!);

    animation!.addListener(() {
      setState(() {

        position=300;

      });
    });

    controller!.forward();
    super.initState();
  }

  //bottom container
  int animate=0;

  //top container
  int select=40;

  double position=0;

  double opacity=1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: 350,
          width: 700,
          color: Colors.red,
          child: Stack(
            children: [
              Positioned(
                top: 250,
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.yellow,
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    select=40;
                    animate=40;
                    print(select);
                  });
                },
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.green,child: Center(
                  child: Text("40x"),
                ),),
              ),

              Positioned(
                  top: 0,
                  left: 60,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=20;
                        animate=20;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.indigo,
                    child: Center(child: Text("20x"),),
                    ),
                  )),

              Positioned(
                  top: 0,
                  left: 120,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=15;
                        animate=15;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.purple,
                    child: Center(child: Text("15x"),),
                    ),
                  )),

              Positioned(
                  top: 0,
                  left: 180,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=10;
                        animate=10;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.pink,
                    child: Center(child: Text("10x"),),
                    ),
                  )),

              //second row container
              Positioned(
                  top: 60,
                  left: 0,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=51;
                        animate=51;
                        position=100;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.pink,
                      child: Center(child: Text("5x"),),
                    ),
                  )),

              Positioned(
                  top: 60,
                  left: 60,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=52;
                        animate=52;
                        position=100;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.yellow,
                      child: Center(child: Text("5x"),),
                    ),
                  )),

              Positioned(
                  top: 60,
                  left: 120,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=53;
                        animate=53;
                        position=100;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.purpleAccent,
                      child: Center(child: Text("5x"),),
                    ),
                  )),

              Positioned(
                  top: 60,
                  left: 180,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        select=54;
                        animate=54;
                        position=100;
                        print(select);

                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Colors.greenAccent,
                      child: Center(child: Text("5x"),),
                    ),
                  )),



              Positioned(
                top: animate==select?animation!.value:position,
                left: select==40?0
                      :select==20?73:
                      select==15?130:
                      select==10?180:
                      select==51?0:
                      select==52?73:
                      select==53?130:
                      select==54?180: 0,
                child: GestureDetector(
                  onTap: (){
                    print("ddd");
                    if(select==40){
                      setState(() {
                        animate=40;
                        print(animate);
                      });
                    }

                    if(select==20){
                      setState(() {
                        animate=20;
                        print(animate);
                      });
                    }


                    if(select==15){
                      setState(() {
                        animate=15;
                        print(animate);
                      });
                    }

                    if(select==10){
                      setState(() {
                        animate=10;
                        print(animate);
                      });
                    }

                      if(position==10){
                        setState(() {
                          controller!.stop();
                          opacity=0;
                          position=20;
                        });

                      }


                  },
                  child:AnimatedContainer(
                    duration: Duration(
                     seconds: 2
                    ),
                    transform:animate==select?Matrix4.rotationZ(5):Matrix4.rotationZ(0),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: 30,width: 30,color: Colors.blue,
                  child: Center(child: Text("10")),
                  ),
                ),
              )
            ],
          ),

        ),
      ),

    );
  }
}
