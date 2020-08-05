import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mocak_app/models/event.dart';
import 'package:mocak_app/models/event_detail.dart';
import 'package:mocak_app/services/database.dart';

class FinishedEventTile extends StatefulWidget {
  @override
  _FinishedEventTileState createState() => _FinishedEventTileState();
  Event event;
  FinishedEventTile({this.event});
}

class _FinishedEventTileState extends State<FinishedEventTile> {
  
  @override
  Widget build(BuildContext context) {

    Event event = widget.event;
  return Slidable(
  actionPane: SlidableDrawerActionPane(),
  actionExtentRatio: 0.25,
  child: Container(
    color: Colors.white,
    child: ListTile(
      onTap: (){
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDetail(event: event,)),
            );
      },
      // leading: CircleAvatar(
        
      //   foregroundColor: Colors.white,
      // ),
      title: Text(event.title),
      subtitle: Text(event.declarantName),
    ),
  ),
  secondaryActions: <Widget>[
    IconSlideAction(
      caption: 'Usuń',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => DatabaseService(collection: 'finishedEvents').deleteFinishedEvent(event.id),
    ),
  ],
);

  }
}