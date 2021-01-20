import 'package:flutter/material.dart';
import 'quotes.dart';
import 'package:share/share.dart';
class statefulpage extends StatefulWidget {
  @override
  _statefulpageState createState() => _statefulpageState();
}

class _statefulpageState extends State<statefulpage> {
  List<Quote> quotes = [
    Quote(author: 'APJ',text: 'No pain no gain'),
    Quote(author: 'Oscar',text: 'Suffer now live later'),
    Quote(author: 'RK',text: 'Mind is a wepon keep it loaded')

  ];

  Widget quoteTemplate(quote){
    return QuoteCard(quote:quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('StateFul Page'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body:Column(
        children:quotes.map((quote)=>QuoteCard(
            quote:quote,
        delete:(){
          setState(() {
            quotes.remove(quote);
          });
        }
        )).toList(),
      ) ,
    );
  }
}

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote,this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0) ,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Text(
            quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[850],
              ),
            ),
            SizedBox(height: 6.0,),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(onPressed:()=> share(context,quote),
              label: Text('Share quote'),
              icon: Icon(Icons.share_outlined),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(onPressed: delete,
              label: Text('Delete quote'),
              icon: Icon(Icons.delete_outline),
            ),

          ],
        ),
      ) ,
    );

  }
  void share(BuildContext context,Quote quote){
    final String text = '${quote.author}- ${quote.text}';
    Share.share(text);
  }
}
