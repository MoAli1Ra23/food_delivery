import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/shared/error/auth_failure.dart';
import 'package:food_delivery/shared/error/connection_failure.dart';
import 'package:food_delivery/shared/error/failuer.dart';

void showFailureMsg(Failure f, BuildContext context) {
  final snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'خطاءا !',
      message: message(f),

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.warning,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String message(Failure f) {
  if (f is InValideEmailPassWordCombnie) {
    return "البريد الالكتروني غير صحيح";
  } else if (f is UserNotFound) {
    return "2البريد الالكتروني غير صحيح";
  } else if (f is WrongPassWord) {
    return "كلمة المرور غير صحيحة";
  } else if (f is TooManyRequests) {
    return "محاولات عديدة يرجي المحاولة في وقت لاحق";
  } else if (f is OperationNotAllowed) {
    return "غير مدعوم";
  } else if (f is UserDisabled) {
    return "تم ايقاف حسابك";
  } else if (f is ConnectionsFailure) {
    return " فشل الاتصال";
  } else {
    return "حدث خطا ما يرجي اعادة المحاولة";
  }
}
