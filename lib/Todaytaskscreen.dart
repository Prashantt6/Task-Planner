import 'package:flutter/material.dart';
import 'package:to_do_list/homescreen.dart';

class todaytaskscreen extends StatefulWidget {
  const todaytaskscreen({super.key});

  @override
  State<todaytaskscreen> createState() => _todaytaskscreenState();
}

class _todaytaskscreenState extends State<todaytaskscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
            ),

            Container(
              width: double.infinity,
              height: 1000,
              decoration: BoxDecoration(
                color: Color(0xFFE6E6FA),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width : double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color:  Color(0xFFE6E6FA),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Back Button on the left
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>homescreen()));
                                },
                                icon: Icon(Icons.arrow_back),
                                label: Text(""),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:Color(0xFFE6E6FA),
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                                ),
                              ),
                            ),

                            // Push the avatar to the right
                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/logo/avatar1.png'),
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ],
                        )

                      ],
                    ),

                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

}
