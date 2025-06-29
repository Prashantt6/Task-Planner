import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class CurrentDateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return Text(
      ' $currentDate',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'Bebas',
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
                    backgroundColor: Colors.grey,
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
