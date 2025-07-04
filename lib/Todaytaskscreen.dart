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
                    title: Text(alltasks[index][DbHelper.getInstance.COLUMN_TITLE]),
                    subtitle: Text(alltasks[index][DbHelper.getInstance.COLUMN_DESCRIPTION] ?? ''),
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
}
