import 'package:flutter/material.dart';
import 'package:party_build/model/exam_rst_info_model.dart';
import 'package:party_build/page/preview_options_page.dart';

// ignore: must_be_immutable
class QuesChipItem extends StatelessWidget {
  String index;

  ExamRstInfoModel model;

  QuesChipItem({this.index, this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PreviewOptionsPage(
                  index: index,
                  optionId: model.id,
                )));
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0, top: 10.0),
            child: Chip(
              label: Text(
                index,
                style: TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              padding: EdgeInsets.all(15.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0, top: 10.0),
            child: _buildIsTrueText(model.isTrue),
          )
        ],
      ),
    );
  }

  Widget _buildIsTrueText(String isTrue) {
    if (isTrue == "0") {
      return Image.asset(
        "images/ic_error.png",
        width: 18.0,
        height: 18.0,
      );
    } else {
      return Image.asset(
        "images/ic_correct.png",
        width: 18.0,
        height: 18.0,
      );
    }
  }
}
