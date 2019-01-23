import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GlobalToast {
  static void showToast(String msg) {
    Fluttertoast.instance.showToast(
        msg: msg,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT);
  }
}
