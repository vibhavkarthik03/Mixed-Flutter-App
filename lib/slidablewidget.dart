import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction{archive,delete,report,markasread}

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
   @required this.child,
    @required this.onDismissed,
    Key key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(actionPane: SlidableDrawerActionPane(),
    child: child,
    actionExtentRatio: 0.25,
    //left side
    actions: <Widget>[
      IconSlideAction(
        caption: 'Archive',
        color: Colors.red,
        icon: Icons.archive,
        onTap: ()=>onDismissed(SlidableAction.archive),
      ),
    IconSlideAction(
      caption: 'Delete',
      color: Colors.blue,
      icon: Icons.delete_outline,
      onTap: ()=>onDismissed(SlidableAction.delete),
    ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Share',
        color: Colors.red,
        icon: Icons.share_outlined,
        onTap: ()=>onDismissed(SlidableAction.delete),
      ),
      IconSlideAction(
        caption: 'Mark as unread',
        color: Colors.blue,
        icon: Icons.mark_chat_unread_outlined,
        onTap: ()=>onDismissed(SlidableAction.markasread),
      ),
    ],
  );
}
