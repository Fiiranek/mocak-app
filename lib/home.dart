import 'package:flutter/material.dart';
import 'package:mocak_app/add_event.dart';
import 'package:mocak_app/events_list.dart';
import 'package:mocak_app/models/event.dart';
import 'package:mocak_app/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Image.asset('assets/mocaklogo.png',height: 20,),
              SizedBox(width: 10,),
              Text('Serwis Mocak'),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.more_horiz),
                text: 'W trakcie',
              ),
              Tab(
                icon: Icon(Icons.done),
                text: 'Ukończone',
              ),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TabBarView(
            children: <Widget>[
              StreamProvider<List<Event>>.value(
                value: DatabaseService(collection: 'currentEvents').events,
                child: EventsList(collection:'currentEvents'),
              ),
              StreamProvider<List<Event>>.value(
                value: DatabaseService(collection: 'finishedEvents').events,
                child: EventsList(collection: 'finishedEvents',),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff222222),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEvent()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
