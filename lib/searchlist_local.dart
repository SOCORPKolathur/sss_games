import 'package:flutter/material.dart';

class Localsearch extends StatefulWidget {
  const Localsearch({Key? key}) : super(key: key);

  @override
  State<Localsearch> createState() => _LocalsearchState();
}

class _LocalsearchState extends State<Localsearch> {

  List loacluser = [
   "raja",
   "dhinesh",
   "john",
   "sri",
    "Rajkumar",
    "jo"
  ];


  user() {
    print(loacluser);
    for (var element in loacluser) {
      setState(() {
        loacluser.add(element);
      });
    }
    print(loacluser);
  }

  String Localsearch = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
        height: 35,
        child: TextField(
            decoration: InputDecoration(hintText: "serach here"),
            onChanged: (value){
              setState(() {
                Localsearch=value.toString();
              });
              print(Localsearch);
            }),
      )),
      body: ListView.builder(
        itemCount: loacluser.length,
        itemBuilder: (context, index) {

          if(loacluser[index].toString().toLowerCase().startsWith(Localsearch.toLowerCase())){
            return ListTile(
              title: Text(loacluser[index].toString()),
              subtitle: Text(loacluser[index].toString()),
            );
          }

          return Container();
        },
      ),
    );
  }


}
