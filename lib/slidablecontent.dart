import 'package:flutter/material.dart';
import 'package:flutter_app3/chat.dart';
import 'package:flutter_app3/data.dart';
import 'package:flutter_app3/slidablewidget.dart';
import 'package:google_fonts/google_fonts.dart';
class slidablecontent extends StatefulWidget {
  @override
  _slidablecontentState createState() => _slidablecontentState();
}

class _slidablecontentState extends State<slidablecontent> {
  List<Chat> items = List.of(Data.chats);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slidable Content"),
      ),
      body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return SlidableWidget(child: buildListTile(item),
              onDismissed: (action)=>
              dismissableSlidableItem(context,index,action),
            );
          },
      ),
    );
  }

  void dismissableSlidableItem(BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });
    switch(action){
      case SlidableAction.archive:
        break;
      case SlidableAction.delete:
        break;
      case SlidableAction.report:
        break;
      case SlidableAction.markasread:
        break;
    }
  }
}

  Widget buildListTile(Chat item) =>
    ListTile(
      contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16
      ),
      leading: CircleAvatar(
        radius: 28,
        backgroundImage: AssetImage(item.imageUrl),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(item.username, style: TextStyle(
              fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(item.message,style:GoogleFonts.abel(),),
        ],
      ),
      onTap: () {},
    );


