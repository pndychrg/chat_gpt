import 'package:chat_gpt/constants.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  final String message;
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    // return Align(
    //   alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    //   child: Container(
    //     margin: EdgeInsets.only(top: 4, left: 3, right: 3),
    //     padding: EdgeInsets.symmetric(
    //         horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
    //     decoration: BoxDecoration(
    //       color: kPrimaryColor.withOpacity(isSender ? 1 : 0.1),
    //       borderRadius: isSender
    //           ? BorderRadius.only(
    //               topLeft: Radius.circular(10),
    //               bottomLeft: Radius.circular(10),
    //               bottomRight: Radius.circular(10),
    //             )
    //           : BorderRadius.only(
    //               topRight: Radius.circular(10),
    //               bottomRight: Radius.circular(10),
    //               bottomLeft: Radius.circular(10),
    //             ),
    //     ),
    //     child: Text(
    //       message,
    //       maxLines: 4,
    //       overflow: TextOverflow.ellipsis,
    //       style: TextStyle(
    //           color: isSender
    //               ? Colors.white
    //               : Theme.of(context).textTheme.bodyText1?.color),
    //     ),
    //   ),
    // );
    return Container(
      margin: EdgeInsets.only(top: 4, left: 3, right: 3),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(isSender ? 1 : 0.1),
        borderRadius: isSender
            ? BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            : BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
      ),
      child: Text(
        message,
        maxLines: 4,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: isSender
                ? Colors.white
                : Theme.of(context).textTheme.bodyText1?.color),
      ),
    );
  }
}
