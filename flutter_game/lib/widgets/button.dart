import 'package:flutter/material.dart';

const double inset = 35;
const double scale = 7;

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.asset, this.action}) : super(key: key);

  final asset;
  final action;

  @override
  Widget build(BuildContext context) {
    return Padding(
        child: TextButton(
            child: Image.asset(asset,
                height: MediaQuery.of(context).size.height / scale,
                width: MediaQuery.of(context).size.width / scale,
                fit: BoxFit.fitWidth),
            onPressed: action),
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / inset,
            right: MediaQuery.of(context).size.width / inset,
            top: MediaQuery.of(context).size.height / inset,
            bottom: MediaQuery.of(context).size.height / inset));
  }
}
