import 'package:flutter/material.dart';
import 'package:party_build/bloc/password_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/password_model.dart';

class PasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PasswordState();
}

class PasswordState extends State<PasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _againPasswordController = TextEditingController();
  PasswordBloc _bloc = PasswordBloc.newInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "密码修改",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                _buildContainer(null, "原密码", "请输入原密码", _oldPasswordController),
                _buildContainer(EdgeInsets.only(top: 1.0), "新密码", "请输入新密码",
                    _newPasswordController),
                _buildContainer(EdgeInsets.only(top: 1.0), "确认密码", "请再次输入新密码",
                    _againPasswordController),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: _buildRaisedButton(),
                )
              ],
            ),
          ),
        ));
  }

  void submit() {
    _bloc.doSubmit(_oldPasswordController.text, _newPasswordController.text);
  }

  Widget _buildRaisedButton() {
    return _bloc.streamBuild(
        start: () {
          return RaisedButton(
              onPressed: submit,
              child: Text(
                "确认修改",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              color: Colors.red,
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 130.0, right: 130.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ));
        },
        success: (data) {
          return _changeRaisedButton(data);
        },
        error: (errorMsg) {
          GlobalToast.showToast(errorMsg);
        },
        empty: () {},
        finished: () {});
  }

  Widget _changeRaisedButton(PasswordModel model) {
    return RaisedButton(
        onPressed: () => {},
        child: Text(
          "修改成功",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        color: Colors.grey,
        padding:
            EdgeInsets.only(top: 15.0, bottom: 15.0, left: 130.0, right: 130.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ));
  }
}

Widget _buildContainer(EdgeInsetsGeometry edge, String text, String hintText,
    TextEditingController controller) {
  return Container(
    margin: edge,
    color: Colors.white,
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          flex: 3,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: 1,
            cursorColor: Colors.red,
            cursorWidth: 3.0,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
          ),
          flex: 8,
        )
      ],
    ),
  );
}
