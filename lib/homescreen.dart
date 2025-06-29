import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homescreen extends StatefulWidget {
  // final String Username;
  const homescreen({super.key });

  @override
  State<homescreen> createState() => _homescreenState();
}
class CurrentDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context ) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Text(
      'Date: $currentDate',
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,

     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Container(
           width: 1300,
           height: 300,
           decoration: BoxDecoration(
             color: Colors.grey,
             borderRadius: BorderRadius.circular(40)
           ),
           child: Padding(
             padding: const EdgeInsets.only(top: 200),
             child: Row(

               children: [
                 Text("Hi User",
                 style: TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.w600,
                   color: Colors.black
                 ),),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 80),
                   child: SizedBox(child: CurrentDateWidget()),
                 )

               ],
             ),
           ),
         )
       ],
     ),
    );
  }
}
