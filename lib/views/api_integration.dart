import 'package:flutter/material.dart';
import 'package:flutter_provider/helper/helper_comment.dart';
import 'package:flutter_provider/models/api_comments.dart';
import 'package:flutter_provider/views/details_screen.dart';

class APIScreen extends StatefulWidget {
  APIScreen({super.key});

  @override
  State<APIScreen> createState() => _APIScreenState();
}

class _APIScreenState extends State<APIScreen> {
  List<Comment>? comments;
  

  bool isLoaded = false;

  getData() async {
    comments = await CommentHelper().getComments();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Api Integration',
          ),
        ),
        body: Visibility(
          visible: isLoaded,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(comments![index].id.toString()),
                  ),
                  title: Text(comments![index].email),
                  textColor: Colors.green,
                  subtitle: Text(comments![index].body),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(comments![index]),
                      
                    )),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
