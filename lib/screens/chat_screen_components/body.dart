import 'dart:convert';

import 'package:chat_gpt/constants.dart';
import 'package:chat_gpt/screens/chat_screen_components/chat_messagebox.dart';
import 'package:flutter/material.dart';
import 'text_message.dart';
import 'package:http/http.dart' as http;

class Body_Message extends StatefulWidget {
  const Body_Message({Key? key}) : super(key: key);

  @override
  State<Body_Message> createState() => _Body_MessageState();
}

class _Body_MessageState extends State<Body_Message> {
  var _data = '';
  List<Widget> chatList = [];
  List<Widget> getChatList() {
    return chatList;
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Column(
            children: chatList,
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
            ),
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding / 2, horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 22,
                    color: Color(0xFF087949).withOpacity(0.08)),
              ],
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.mic,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: kDefaultPadding / 3,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Type Message",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: kDefaultPadding / 2,
                        ),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                chatList.add(ChatMessageBox(
                                  message: _controller.text,
                                  isSender: true,
                                ));
                              });
                              String url =
                                  "http://edugpt1-env.eba-kmqxi8ub.us-east-1.elasticbeanstalk.com/send?message=${_controller.text.trim()}";

                              try {
                                http.Response response =
                                    await http.get(Uri.parse(url));
                                if (response.statusCode == 200) {
                                  var data = jsonDecode(response.body);
                                  setState(() {
                                    _data = data['data'];
                                    chatList.add(TextMessage(
                                      message: _data.trim(),
                                      isSender: false,
                                    ));
                                  });
                                  _controller.clear();
                                } else {
                                  print(response.statusCode.toString());
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                              // setState(() {
                              //   _data =
                              //       "a lot of data here                                                                                                                                       ";
                              //   chatList.add(ChatMessageBox(
                              //     message: _data,
                              //     isSender: false,
                              //   ));
                              // });
                            },
                            icon: Icon(
                              Icons.send,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.color
                                  ?.withOpacity(0.64),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
