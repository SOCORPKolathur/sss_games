

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchSort extends StatefulWidget {
  const SearchSort({Key? key}) : super(key: key);

  @override
  State<SearchSort> createState() => _SearchSortState();
}

class _SearchSortState extends State<SearchSort> {
  
  List <Map<String,dynamic>>User=[];

  
  Userdata()async{
    
   var details=await FirebaseFirestore.instance.collection("User Details").get();
   print(User);
   for(int i=0;i<details.docs.length;i++){
      setState(() {
        User.add(details.docs[i]["name"],);
      });
      print(User);
    }
    
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Userdata();
  }
  String Username="";
  bool search=false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Container(
          height: 35,
         width: 100,
        child: TextField(
    decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search here"
    ),
    onTap: (){
      setState((){
        search=true;
      });

    },
    onChanged: (value){
      setState(() {
        Username=value;
      });

    },
  ),
), 
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("User Details").snapshots(),
        builder: (context, snapshot) {

          return search?
          ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;

              if(data['name'].toString().toLowerCase().startsWith(Username.toLowerCase())){
                return ListTile(
                  title: Text(data['name'].toString()),
                  subtitle: Text(data['age'].toString()),
                );
               };

              if(data['age'].toString().toLowerCase().startsWith(Username.toLowerCase())){
                return ListTile(
                  title: Text(data['name'].toString()),
                  subtitle: Text(data['age'].toString()),
                );
              };
              return Container();

          },):Container();
        },
      )
    );
  }
}
