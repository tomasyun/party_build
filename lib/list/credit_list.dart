import 'package:flutter/material.dart';
import 'package:party_build/item/credit_item.dart';
import 'package:party_build/model/credit_model.dart';

// ignore: must_be_immutable
class CreditList extends StatelessWidget {
  Credit credit;

  CreditList({this.credit});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _buildCreditList(),
    );
  }

  List<CreditItem> _buildCreditList() {
    return credit.data.creditList
        .map((item) => CreditItem(data: item))
        .toList();
  }
}
