import 'package:flutter_easyloading/flutter_easyloading.dart';

class SuitupMessage {
  /// Default message: Algo deu errado, tente novamente
  static error([String? msg]) => EasyLoading.showError(msg ?? 'Algo deu errado, tente novamente');

  /// Default message: Alterado com sucesso!
  static success(String? msg, {Duration? duration}) =>
      EasyLoading.showSuccess(msg ?? 'Alterado com sucesso!', duration: duration);

  static info(String msg) => EasyLoading.showInfo(msg);
  static toast(String msg) => EasyLoading.showToast(msg);
}
