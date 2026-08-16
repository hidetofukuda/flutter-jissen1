// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get startScreenTitle => '写真加工アプリ';

  @override
  String helloWorldOn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'こんにちは！\n今日は$dateStringです';
  }

  @override
  String get pushButton => 'スタートボタン';

  @override
  String get imageSelectScreenTitle => '画像を選択';

  @override
  String get imageSelect => '画像を選ぶ';

  @override
  String get imageEdit => '画像を編集する';
}
