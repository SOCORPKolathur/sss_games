

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Stream2 extends StatefulWidget {
  const Stream2({Key? key}) : super(key: key);

  @override
  State<Stream2> createState() => _Stream2State();
}

class _Stream2State extends State<Stream2> {


  var coins=0;

  var totalamount=0;
  var userid=FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").where("user id",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (context, usersnapshot) {
          return Container(
            child: StreamBuilder<QuerySnapshot>(
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
                  children: [
                    Center(child: Text(snapshot.data!.docs[0]['status'].toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),)),

                    Center(child: Text(snapshot.data!.docs[0]['gameid'].toString(),style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),)),

                    Container(
                      height: 300,
                      width: 300,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("TotalBetting").
                        doc((snapshot.data!.docs[0]['gameid'].toString())).collection("Position").snapshots(),
                        builder: (context, snapshot2) {
                          return GridView.builder(
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                                childAspectRatio: 100/100
                            ),
                            itemCount: snapshot2.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: (){

                                    update(
                                        snapshot.data!.docs[0]['gameid'],

                                        snapshot2.data!.docs[index].id,

                                        snapshot2.data!.docs[index]['totalamount'],

                                        10,

                                        snapshot2.data!.docs[index]['coins'],

                                        snapshot2.data!.docs[index]['userid'],

                                        10,

                                        FirebaseAuth.instance.currentUser!.uid,

                                        snapshot2.data!.docs[index]['postion']
                                    );


                                    useridget(
                                        10,
                                        usersnapshot.data!.docs[0]["wallet amount"],
                                    );


                                    userpositionupdate(
                                        snapshot.data!.docs[0]['gameid'],
                                        snapshot2.data!.docs[index].id,
                                         10,
                                      snapshot2.data!.docs[index]['postion'],

                                    );





                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    color: index==0?Colors.red:
                                    index==1?Colors.yellow:
                                    index==2?Colors.blue:
                                    index==3?Colors.orange:
                                    index==4?Colors.indigo:
                                    index==5?Colors.teal:
                                    index==6?Colors.blue:
                                    index==7?Colors.brown:
                                    Colors.green,
                                    child: Center(child: Text(snapshot2.data!.docs[index]['postion'].toString()),),
                                  ),
                                ),
                              );
                            },);
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      )
    );
  }

  update(gameid,docid,totalamount,amount,List coin,List userid,currentcoin,currentuserid,postion) {

    coin.add(currentcoin);

    if (userid.contains(currentuserid)!=true) {
      userid.add(currentuserid);
    }
      FirebaseFirestore.instance.collection("TotalBetting").doc(gameid)
          .collection("Position").doc(docid)
          .update(
          {
            "coins": coin,
            "userid": userid,
            "postion": postion,
            "totalamount": totalamount + amount,

          }
      );

  }


  //wallet function
  useridget(coins,walletamount,){

    FirebaseFirestore.instance.collection("Users").doc(userid).update(
      {
        "wallet amount": walletamount-coins

      }
    );

  }


  userpositionupdate(gameid,positionid,investcoins,position) async {
    FirebaseFirestore.instance.collection("Users").doc(userid).collection(gameid).limit(1).get()
        .then((checkSnapshot) async {
      if (checkSnapshot.size == 0) {
        var  document = await FirebaseFirestore.instance.collection("TotalBetting").doc(gameid).collection("Position").get();
        for(int k=0;k<document.docs.length;k++) {
          FirebaseFirestore.instance.collection("Users").doc(userid).collection(gameid).doc(document.docs[k].id).set(
              {
                "totalamount": 0,
                "postion": document.docs[k]["postion"],

              }
          );
        }
      }
    });

    var  usergetid = await FirebaseFirestore.instance.collection("Users").doc(userid).collection(gameid).doc(positionid).get();

    Map<String, dynamic>? value = usergetid.data();

    FirebaseFirestore.instance.collection("Users").doc(userid).collection(gameid).doc(positionid).set(
      {
        "totalamount":value!["totalamount"]+investcoins,
        "postion":position,

      }
    );

  }



}
