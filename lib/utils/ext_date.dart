import 'package:dart_date/dart_date.dart';

String localRegion = 'id_ID';

extension DatetimeExt on DateTime {
  DateTime checkUtc() {
    if (isUtc) return toLocal();
    return this;
  }

  String toDateHuman() {
    DateTime res = checkUtc();
    return res.format('dd MMMM y');
  }

  String toyyyyMMdd() {
    DateTime res = checkUtc();
    return res.format('yyyy-MM-dd', localRegion);
  }
}
