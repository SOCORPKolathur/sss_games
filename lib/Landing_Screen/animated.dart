import 'package:flutter/material.dart';

class animated extends StatefulWidget {
  const animated({Key? key}) : super(key: key);

  @override
  State<animated> createState() => _animatedState();
}


class _animatedState extends State<animated>{


 double box=10;
 double box2=5;
 List<Widget>coins=List.generate(5, (index) =>Container(
   height: 50,
   width: 50,
   decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(12)
   ),
 ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(

             children: [

               coins[coins.length-2]

           ]
         )

    );
  }
}
