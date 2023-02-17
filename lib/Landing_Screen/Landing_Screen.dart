import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';

class Landing_Screen extends StatefulWidget {


  @override
  State<Landing_Screen> createState() => _Landing_ScreenState();
}

class _Landing_ScreenState extends State<Landing_Screen> {

   double WIDTH=50;
  @override
  Widget build(BuildContext context) {

    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/back.png",)
          )
        ),
        child: Column(
          children: [

            //top bar profiles and so on
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [

                  //profile container
                  GestureDetector(
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/man 1.png")
                          ),
                          color: Colors.red,
                        borderRadius:
                          BorderRadius.circular(128)
                      ),
                    ),
                    onTap: (){
                      print(width);
                      print(height);
                    },
                  ),
                  SizedBox(width: 5,),



                  //profile username
                  Text(
                    "Srini Pandiyan",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(width: 5,),


                  Stack(
                    children: [

                      Container(
                        height:25 ,
                        width: 115,
                        decoration: BoxDecoration(
                            color:Color(0xff373737),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                      //add button
                      Positioned(
                        left: 55,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ),
                          elevation:10,
                          child: Container(
                            height: 25,
                            width: 60,
                            child: Center(
                              child: Text('Add',style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                color: Color(0xff000000)
                              ),),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(8)
                            ),
                          ),
                        ),
                      ),

                      //coin img
                      Positioned(
                        left: 1,
                        child: Material(
                          elevation: 10,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: SvgPicture.asset("assets/Coin icons.svg",
                                  fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 5,),
                              Text("20",style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                color: Color(0xffFBD03C)

                              ),)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),

                  SizedBox(width: 15,),


                  //withdraw container

                  GestureDetector(
                    onTap: (){
                      print( "Withdraw");
                    },
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 26,
                        width: 114,
                        child: Center(
                          child: Text(
                            "Withdraw",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              color: Color(0xff510066),
                              fontSize: 12
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [

                            Color(0xff770095),
                            Color(0xffD959FA),
                            Color(0xff770095),
                          ]),
                          borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 225,),


                  //lucky spain img
                  Column(
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        child: Image.asset("assets/—Pngtree—lucky triple seven with wheel_6061622 1.png",fit: BoxFit.cover,),
                      ),
                      Text("Lucky Spain",style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFC200),
                        fontSize: 10
                      ),),
                    ],
                  ),
                  SizedBox(width: 15,),
                  //dashboard icons
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        //more button
                        child: Image.asset("assets/menu 1.png",fit: BoxFit.cover,)
                      ),
                      Text("More",style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color:  Color(0xffFFC200),
                        fontSize: 10
                      ),)
                    ],
                  )
              ],),
            ),

            //contains
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                //lists container
                Padding(
                  padding:  EdgeInsets.only(left: 50),
                  child: Container(
                    height: 185,
                    width: 700,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //Long container designs
                        Container(
                          height: 260,
                          width: 125,
                          decoration: BoxDecoration(
                              color: Color(0xffce2449),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:Image.asset("assets/Rectangle 1.png",fit: BoxFit.contain,)

                        ),

                        //two contaibner designs

                        Padding(
                          padding:  EdgeInsets.only(top: 25.0),
                          child: SizedBox(
                            width: 130,
                            height: 110,
                            child: Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width:100,
                                  margin: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                        image: AssetImage("assets/Rectangle 5.png",)
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ),
                                Positioned(
                                    left:70,
                                    child: Image.asset("assets/New.png")),

                              ],
                            ),
                          ),
                        ),

                        Container(
                          width: 140,
                          height: 140,
                          child: Stack(
                            children: [
                              Container(
                                height: 100,
                                width:100,
                               margin: EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage("assets/Rectangle 6.png",)
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              Positioned(
                                  left:50,
                                  top: -13,
                                  child: Image.asset("assets/—Pngtree—red hot button label sticker_6400061 1.png",
                                  height: 90,
                                    width: 90,
                                  )),

                            ],
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(top: 25.0),
                          child: Container(
                            height: 100,
                            width:100,
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset("assets/Rectangle 5.png",fit: BoxFit.cover,)
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),

            Padding(
              padding:  EdgeInsets.only(top: 2.0),
              child: Container(
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(width: 2,),
                    Container(
                      height: 60,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/Rectangle 10.png",),
                        )
                      ),
                      child: Stack(
                        children: [

                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(width: 5,),
                                Image.asset("assets/Refer and Earn.png",fit: BoxFit.cover,),
                                Image.asset("assets/icons8-cash-96 1.png",fit: BoxFit.cover,),
                              ],
                            ),
                          )


                        ],
                      )
                    ),
                    SizedBox(width: 65,),

                    //menu items
                    Container(
                      height: 65,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         fit: BoxFit.contain,
                         image: AssetImage("assets/Rectangle 8.png")
                       )
                     ),
                      width: 510,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 68,),
                          //refer img
                          GestureDetector(
                            onTap: (){
                              print("Refer button");
                              },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child:Image.asset("assets/icons8-gold-64 1.png",fit: BoxFit.contain,)),
                                Text("Refer&Earn",style: GoogleFonts.montserrat(
                                  color: Color(0xffFFDE76),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),

                          //Activity img
                          GestureDetector(
                            onTap: (){
                              print("Activity");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset('assets/gift 1.png',fit: BoxFit.contain,)
                                ),
                                Text("Gifts",style: GoogleFonts.montserrat(
                                    color: Color(0xffFFDE76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),

                          //Wallet img
                          GestureDetector(

                           onTap: (){
                             print("Wallet");
                           },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/wal 1.png",fit: BoxFit.contain,)
                                ),
                                Text("Wallet",style: GoogleFonts.montserrat(
                                    color: Color(0xffFFDE76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),

                          //Email img
                          GestureDetector(

                           onTap: (){
                             print("Email");
                           },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/icons8-post-100 1.png",fit: BoxFit.contain,)
                                ),
                                Text("Mail",style: GoogleFonts.montserrat(
                                    color: Color(0xffFFDE76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),



                          //Feedback img
                          GestureDetector(
                            onTap: (){
                              print("feedback");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset("assets/feedback 1.png",fit: BoxFit.contain,),
                                ),
                                Text("Support",style: GoogleFonts.montserrat(
                                    color: Color(0xffFFDE76),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(width: 12,),

                          //Add cash button
                          GestureDetector(
                            onTap: (){
                              print("Add cash");
                            },
                            child: Container(
                              height: 65,
                              width: 180,
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/Rectangle 9.png",)
                                )
                              ),
                              child:Center(
                                child: Text("Add Cash",
                                  style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),),
                              ),
                            ),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}

class RPSCustomPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(size.width*0.1237500,size.height*0.9900000);
    path0.quadraticBezierTo(size.width*0.1740625,size.height*0.6925000,size.width*0.2512500,size.height*0.7000000);
    path0.lineTo(size.width*0.9375000,size.height*0.7000000);
    path0.lineTo(size.width*0.9987500,size.height*0.6960000);
    path0.lineTo(size.width*0.9987500,size.height*0.9920000);
    path0.quadraticBezierTo(size.width*0.7800000,size.height*0.9915000,size.width*0.1237500,size.height*0.9900000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip,
    return true;
  }
}



