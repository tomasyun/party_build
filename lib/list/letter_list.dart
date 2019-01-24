import 'package:flutter/material.dart';
import 'package:party_build/item/letter_item.dart';
import 'package:party_build/model/letter_model.dart';

// ignore: must_be_immutable
class LetterList extends StatelessWidget {
  Letter letter;

  LetterList({this.letter});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildMailList(),
    );
  }

  List<LetterItem> _buildMailList() {
    return letter.data
        .map((item) => LetterItem(
              model: item,
            ))
        .toList();
  }
}
