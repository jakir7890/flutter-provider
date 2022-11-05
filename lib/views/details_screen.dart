import 'package:flutter/material.dart';
import 'package:flutter_provider/models/api_comments.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(
    this._comments,
  );

  var _comments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    width: double.maxFinite,
                    color: Colors.purple,
                    child: Text(_comments!.body.toString()),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
