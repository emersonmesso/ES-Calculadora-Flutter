import 'package:flutter/material.dart';

class ItemClick extends StatelessWidget {
  const ItemClick(
      {super.key,
      required this.colorPrimary,
      required this.text,
      required this.colorText,
      required this.space,
      required this.actionClick,
      this.icone});

  final Color colorPrimary;
  final String text;
  final Color colorText;
  final double space;
  final Icon? icone;
  final Function actionClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        actionClick();
      },
      child: Container(
        margin: const EdgeInsets.all(0.5),
        color: colorPrimary,
        width: space - 1,
        height: space - 1,
        child: Center(
          child: (icone == null)
              ? Text(
                  text,
                  style: TextStyle(
                    color: colorText,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : icone,
        ),
      ),
    );
  }
}
