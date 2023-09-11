import 'package:flutter/material.dart';
import 'package:login_register/utils/ext_text.dart';
import '../../utils/colors.dart';
import 'button_base.dart';

dialogBuilder({
  required bool barier,
  required BuildContext context,
  required String title,
  required Function() buttonLeft,
  required Function() buttonRight,
  required String leftTittle,
  required String rightTitle,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: barier,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ).p15m(),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 110,
                  child: BaseButton(
                    ontap: buttonLeft,
                    text: leftTittle,
                    textSize: 14,
                    textColor: OPrimaryColor,
                    color: Colors.white,
                    outlineColor: OPrimaryColor,
                  )),
              const SizedBox(
                width: 23,
              ),
              SizedBox(
                  width: 110,
                  child: BaseButton(
                    ontap: buttonRight,
                    text: rightTitle,
                    textSize: 14,
                    textColor: Colors.white,
                    width: 110,
                  ))
            ],
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      );
    },
  );
}
