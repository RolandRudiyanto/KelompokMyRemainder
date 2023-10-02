import 'package:flutter/material.dart';
import 'package:uts2/data/data.dart';
import 'package:uts2/data/database.dart';
import 'package:async/async.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DBHelper? dbHelper;
  late Future<List<Data>> dataList;

  @override
  void initState(){
    super.initState();
    dbHelper = DBHelper();
    loadNotes();
  }

  loadNotes() async{
    dataList = dbHelper!.getDataList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Container(

              )
            ],
        ),
      ),
    );
  }
}
