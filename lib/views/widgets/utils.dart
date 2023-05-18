import 'package:flutter/material.dart';

showScaffoldMsg(BuildContext context, String msg, bool isError) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: isError ? Colors.redAccent : Colors.greenAccent,
  ));
}
