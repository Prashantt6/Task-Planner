import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class CurrentDateWidget extends StatelessWidget {
  String _getDayWithSuffix(int day){
    if (day>= 11 && day <= 13){
      return '${day}th';

    }
    switch (day % 10 ){
      case 1 :
        return '${day}st';
      case 2 :
        return '${day}nd';
      case 3 :
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
  @override
  Widget build(BuildContext context){
    final now = DateTime.now();
    final dayWithSuffix = _getDayWithSuffix(now.day);
    final month = DateFormat('MMMM').format(now);

    return Text(
      ' $dayWithSuffix $month',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'fonthead',
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
            width: 1000,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Stack(
              children: [

                Positioned(
                  top: 60,
                  left: 20,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/logo/avatar1.png' ),
                    backgroundColor: Colors.white,
                  ),
                ),

                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      Text(
                        "Hi Prashant",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'fonthead',
                        ),
                      ),
                      const Spacer(),
                      CurrentDateWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
