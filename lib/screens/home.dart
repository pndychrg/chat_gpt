import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  var _data = '';
  List<Widget> chatList = [];
  Widget chatContainer(dynamic data, bool isSent) {
    if (isSent == true) {
      return Align(
        alignment: Alignment.centerRight,
        child: Card(
          elevation: 5,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            //margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(12),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              data.trim(),
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.centerLeft,
        child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: EdgeInsets.all(12),
              //margin: EdgeInsets.only(left: 10, right: 10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                data.trim(),
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blue),
              ),
            )),
      );
    }
  }

  List<Widget> retChatList() {
    return chatList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          // margin:
          //     EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width - 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kElevationToShadow[3],
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 100,
                  minLines: 1,
                  controller: _controller,
                ),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.02,
              // ),
              Card(
                elevation: 5,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () async {
                    setState(() {
                      chatList
                          .add(chatContainer(_controller.text.trim(), true));
                    });
                    String url =
                        "http://edugpt1-env.eba-kmqxi8ub.us-east-1.elasticbeanstalk.com/send?message=${_controller.text.trim()}";

                    // try {
                    //   http.Response response = await http.get(Uri.parse(url));
                    //   if (response.statusCode == 200) {
                    //     var data = jsonDecode(response.body);
                    //     print(_data.toString());
                    //     setState(() {
                    //       _data = data['data'];
                    //       chatList.add(chatContainer(_data.trim(), false));
                    //     });
                    //
                    //     _controller.clear();
                    //   } else {
                    //     print(response.statusCode.toString());
                    //   }
                    // } catch (e) {
                    //   print(e.toString());
                    // }
                    setState(() {
                      _data =
                          "There is a general consensus that safety is an important factor in decisions about motorcycle safety. Many factors must be considered in order to ensure the motorcycle is safe, including the rider's age, sex";
                      chatList.add(chatContainer(_data.trim(), false));
                    });
                  },
                  icon: const Icon(
                    Icons.send,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("CHAT"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 8, right: 10, left: 10),
          child: Column(
            children: [
              Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ...retChatList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
