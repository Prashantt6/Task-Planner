import 'package:flutter/material.dart';
import 'package:to_do_list/data/local/DBhelper.dart';

class todaytaskscreen extends StatefulWidget {
  const todaytaskscreen({super.key});

  @override
  State<todaytaskscreen> createState() => _todaytaskscreenState();
}

class _todaytaskscreenState extends State<todaytaskscreen> {
  DbHelper? dbRef;
  List<Map<String, dynamic>> alltasks = [];

  @override
  void initState() {
    super.initState();
    dbRef = DbHelper.getInstance;
    getTasks();
  }

  void getTasks() async {
    alltasks = await dbRef!.getAllTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text(""),
                  ),
                ),
                Spacer(),
                Text(
                  "Today's Tasks",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'fonthead',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo/avatar1.png'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: alltasks.isNotEmpty
                  ? ListView.builder(
                itemCount: alltasks.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Text('${alltasks[index][DbHelper.getInstance.COLUMN_SNO]}') ,
                    title: Text(alltasks[index][DbHelper.getInstance.COLUMN_TITLE]),
                    subtitle: Text(alltasks[index][DbHelper.getInstance.COLUMN_DESCRIPTION] ),
                    trailing: SizedBox(
                      width: 70,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              // showModalBottomSheet(context: context, builder: (context){
                              //   // var title = alltasks[index][DbHelper.getInstance.COLUMN_TITLE];
                              //   // var desc = alltasks[index][DbHelper.getInstance.COLUMN_DESCRIPTION];
                              //   // var sno =  alltasks[index][DbHelper.getInstance.COLUMN_SNO];
                              //   // var prirority = alltasks[index][DbHelper.getInstance.COLUMN_PRIORITY];
                              //   //
                              //   // return getBottomsheet(title : title,desc : desc, sno: sno, prirority : prirority);
                              //
                              // });

                            },
                            child: Icon(Icons.edit),

                          ),
                          InkWell(
                            onTap: (){
                              
                            },
                            child: Icon(Icons.delete,color: Colors.red,),
                          ),
                         InkWell(
                           onTap: (){

                           },
                           child: Text(">>",style: TextStyle(color: Colors.black),),
                         )
                        ],
                      ),
                    ),
                  );
                },
              )
                  : Center(child: Text("No tasks added")),
            ),
          ],
        ),
      ),
    );
  }
  // Widget getBottomsheet({ required String title , required String desc,  required int sno, required String prirority}){
  //   return Container(
  //     height: 800,
  //     width: 500,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         ElevatedButton(onPressed: ()async{
  //           await dbRef!.update(
  //             tTitle: title,
  //             tdesc: desc,
  //             sno:  sno,
  //             prirority: prirority,
  //
  //           );
  //
  //         }, style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.blue,
  //             foregroundColor: Colors.white,
  //             elevation: 5,
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10)
  //             )
  //         ),
  //             child: Text("Update",style: TextStyle(
  //                 fontSize: 30
  //             ),)
  //
  //
  //         ),
  //       ],
  //     ),
  //   );
  //
  // }
}
