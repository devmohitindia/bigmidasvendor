import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

Widget getCustomDialog(
    BuildContext context,
    String title,
    String desc,
    DialogType dialogType,

    {String oktext,String cancelText,Function okFunc,Function canFunc})
{
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.BOTTOMSLIDE,
    title: '$title',
    desc: '$desc',
    btnCancelOnPress: canFunc,
    btnOkOnPress: okFunc,
    btnOkText: oktext,
    btnCancelText: cancelText
  )..show();
}