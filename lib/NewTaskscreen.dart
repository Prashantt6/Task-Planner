import 'package:flutter/material.dart';
import 'package:to_do_list/data/local/DBhelper.dart';
import 'package:to_do_list/homescreen.dart';
import 'package:intl/intl.dart';

class addnewtaskscreen extends StatefulWidget {
  const addnewtaskscreen({super.key});

  @override
  State<addnewtaskscreen> createState() => _addnewtaskscreenState();
}

class _addnewtaskscreenState extends State<addnewtaskscreen> {
  // icluding database
  DbHelper? dbRef;

  String? taskdate;
  String? prioritySet;
  bool high_priority = false;
  bool veryhigh_priority = false;
  bool low_priority = false;

  bool prev_pre = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _pretaskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    prioritySet = 'Normal';
    taskdate = 'Today';
    _priorityController.text = 'Normal';
    _pretaskController.text = 'Today';
   dbRef =  DbHelper.getInstance;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  void _handleoption(String? value) {
    setState(() {
      taskdate = value;
      prev_pre = value == 'Future';
    });
  }

  void _handlepriority(String? value) {
    setState(() {
      prioritySet = value;
      _priorityController.text = value ?? 'Normal';
      high_priority = value == 'High';
      veryhigh_priority = value == 'Very High';
      low_priority = value == 'Low';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE6E6FA),
            ),
            child: Column(
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(color: Color(0xFFE6E6FA)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 5.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => homescreen()),
                            );
                          },
                          icon: Icon(Icons.arrow_back),
                          label: Text(""),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE6E6FA),
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        'New Task',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          fontFamily: 'fonthead',
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 16.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/logo/avatar1.png'),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  title: Text(
                    '$taskdate',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  children: [
                    RadioListTile(
                      title: Text('Today'),
                      value: 'Today',
                      groupValue: taskdate,
                      onChanged: _handleoption,
                    ),
                    RadioListTile(
                      title: Text('Future'),
                      value: 'Future',
                      groupValue: taskdate,
                      onChanged: _handleoption,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            hintText: 'Enter the title of task',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 100,
                        child: TextField(
                          controller: _descController,
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintText: 'Enter the description about the task',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 60,

                        child: TextField(
                          controller: _dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Select Date",
                            border: OutlineInputBorder(),

                          ),

                          onTap: () => _selectDate(context),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Text(
                            "Select the priority",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          '${prioritySet ?? "None"}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          RadioListTile(
                            title: Text("High"),
                            value: 'High',
                            groupValue: prioritySet,
                            onChanged: _handlepriority,
                          ),
                          RadioListTile(
                            title: Text('Normal'),
                            value: 'Normal',
                            groupValue: prioritySet,
                            onChanged: _handlepriority,
                          ),
                          RadioListTile(
                            title: Text('Low'),
                            value: 'Low',
                            groupValue: prioritySet,
                            onChanged: _handlepriority,
                          ),
                          RadioListTile(
                            title: Text('Very High'),
                            value: 'Very High',
                            groupValue: prioritySet,
                            onChanged: _handlepriority,
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  side: BorderSide(
                                      width: 0.5,
                                      color: Colors.grey
                                  )
                              )),

                              onPressed: () {
                                dbRef!.addTask(
                                    tTitle: _titleController.text,
                                    tDate: _dateController.text,
                                    tdesc: _descController.text,
                                    priority: _priorityController.text);

                                Navigator.pop(context);
                                _titleController.clear();
                                _descController.clear();
                                _dateController.clear();
                                _priorityController.clear();

                                // Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                                child: Text("Add", style: TextStyle(fontSize: 18)),

                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey
                                )
                              )),
                              onPressed: () {
                                      Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                                child: Text("Cancel", style: TextStyle(fontSize: 18)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
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
