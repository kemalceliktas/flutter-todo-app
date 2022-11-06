import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/app_style.dart';


class NoteReaderScreen extends StatefulWidget {
   NoteReaderScreen({super.key,required this.doc});
  QueryDocumentSnapshot doc;
  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  
  @override
  Widget build(BuildContext context) {
    int color_id=widget.doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,

      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc["note_title"],
            style: AppStyle.mainTitle,),
            SizedBox(height: 4,),
            Text(widget.doc["creating_date"],
            style: AppStyle.dateTitle,),
            Divider(
              color: AppStyle.mainColor,
            ),
            SizedBox(
            height: 30,
          ),
            Text(widget.doc["note_content"],
            style: AppStyle.mainContent,),
          ],
        ),
      ),

    );
  }
}