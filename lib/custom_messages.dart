import 'package:timeago/timeago.dart';

class PersianLanguage implements LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => 'پیش';
  @override String suffixFromNow() => 'همین الان';
  @override String lessThanOneMinute(int seconds) => 'به تازگی';
  @override String aboutAMinute(int minutes) => '${minutes} دقیقه';
  @override String minutes(int minutes) => '${minutes} دقیقه';
  @override String aboutAnHour(int minutes) => '${minutes} دقیقه';
  @override String hours(int hours) => '${hours} ساعت';
  @override String aDay(int hours) => '${hours} ساعت';
  @override String days(int days) => '${days} روز';
  @override String aboutAMonth(int days) => '${days} ماه';
  @override String months(int months) => '${months} ماه';
  @override String aboutAYear(int year) => '${year} سال';
  @override String years(int years) => '${years} سال';
  @override String wordSeparator() => ' ';
}