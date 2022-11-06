import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/style/app_style.dart';



Widget noteCard(Function()? onTab,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTab,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc["color_id"]],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
           
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  FirebaseFirestore.instance.collection("Notes").doc(doc.id).delete();
                },
                child: Icon(Icons.cancel))
            ],
          ),
          Text(doc["note_title"],
          style: AppStyle.mainTitle,),
          SizedBox(height: 4,),
          Text(doc["creating_date"],
          style: AppStyle.dateTitle,),
          Divider(
            color: AppStyle.mainColor,
          ),
          
          Text(doc["note_content"],
          style: AppStyle.mainContent,),
        ],
      ),
    ),
  );
}