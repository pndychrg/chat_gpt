import 'package:chat_gpt/constants.dart';
import 'package:flutter/material.dart';
import 'chat_screen_components/body.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 10),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Body_Message(),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          BackButton(),
          CircleAvatar(),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Chat GPT",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Online",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.volume_up),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.upload),
          onPressed: () {},
        ),
        SizedBox(
          width: kDefaultPadding / 4,
        )
      ],
    );
  }
}
