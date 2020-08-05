import 'package:flutter/material.dart';
import 'package:mocak_app/models/event.dart';
import 'package:mocak_app/models/current_event_tile.dart';
import 'package:mocak_app/models/finished_event_tile.dart';
import 'package:provider/provider.dart';

class EventsList extends StatefulWidget {
  @override
  _EventsListState createState() => _EventsListState();
  String collection;
  EventsList({this.collection});
}

class _EventsListState extends State<EventsList> {
  @override
  Widget build(BuildContext context) {
     final events = Provider.of<List<Event>>(context) ?? [];
    return ListView.builder(itemCount: events.length,
    itemBuilder: (context, index) {
      if(widget.collection=='currentEvents'){
         return
       CurrentEventTile(event: events[index]);
      }
     else if(widget.collection=='finishedEvents'){
return
       FinishedEventTile(event: events[index]);
     }
    });
  }
}