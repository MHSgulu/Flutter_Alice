import 'file:///E:/Alice_flutter/alice/lib/common/l10n/Localizations.dart';
import 'package:alice/common/global/theme_mode.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiLanguage extends StatefulWidget {
  @override
  _MultiLanguageState createState() => _MultiLanguageState();
}

class _MultiLanguageState extends State<MultiLanguage> {
  Locale myLocale;
  int _value;
  String languageCode;
  String scriptCode;
  List<bool> options = [true, false, false, false, false];
  List<String> languageList;
  List<String> languageIconList = [
    'assets/icons/icon_language_1.png',
    'assets/icons/icon_language_1_2.png',
    'assets/icons/icon_language_2.png',
    'assets/icons/icon_language_3.png',
    'assets/icons/icon_language_4.png',
  ];

  @override
  void initState() {
    initLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);

    languageList = [
      MyLocalizations.of(context).zhl,
      MyLocalizations.of(context).zhlHant,
      MyLocalizations.of(context).enl,
      MyLocalizations.of(context).frl,
      MyLocalizations.of(context).jal,
    ];

    return Scaffold(
      appBar: MyAppBar(
        label: MyLocalizations.of(context).intlPageTitle,
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('当前主要语言标签: ${myLocale.languageCode}'), //语言环境的主要语言子标签。 不能为空。 它可能是“ und”，代表“ undefined”(未定义)。
            SizedBox(height: 8),
            Text('当前语言环境的区域标签: ${myLocale.countryCode}'), //语言环境的区域子标签。可以为null，表示没有指定的区域子标签。
            SizedBox(height: 8),
            Text('当前语言环境标识符: ${myLocale.toLanguageTag()}'), //返回语法上有效的Unicode BCP47语言环境标识符。
            SizedBox(height: 8),
            Text('当前语言环境: ${myLocale.toString()}'), //返回表示语言环境的字符串。
            SizedBox(height: 20),
            Wrap(
              children: List<Widget>.generate(
                languageList.length,
                (int index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: ChoiceChip(
                      label: ListTile(
                        title: Text(
                          languageList[index],
                          maxLines: 1,
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: Image.asset(
                          languageIconList[index],
                          width: 35,
                          height: 35,
                        ),
                        selected: _value == index ? true : false,
                      ),
                      selected: _value == index,
                      onSelected: (bool selected) =>
                          switchLanguage(index, selected),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      //backgroundColor: Colors.white60,
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void initLanguage() {
    languageCode = AppThemeMode.language;
    scriptCode = AppThemeMode.script;
    switch (languageCode) {
      case 'zh':
        if (scriptCode == 'Hans') {
          _value = 0;
        } else if (scriptCode == 'Hant') {
          _value = 1;
        }
        break;
      case 'en':
        _value = 2;
        break;
      case 'fr':
        _value = 3;
        break;
      case 'ja':
        _value = 4;
        break;
    }
  }

  void switchLanguage(int index, bool selected) {
    switch (index) {
      case 0:
        Provider.of<AppThemeMode>(context, listen: false)
            .switchLanguage('zh', 'Hans');
        break;
      case 1:
        Provider.of<AppThemeMode>(context, listen: false)
            .switchLanguage('zh', 'Hant');
        break;
      case 2:
        Provider.of<AppThemeMode>(context, listen: false)
            .switchLanguage('en', '');
        break;
      case 3:
        Provider.of<AppThemeMode>(context, listen: false)
            .switchLanguage('fr', '');
        break;
      case 4:
        Provider.of<AppThemeMode>(context, listen: false)
            .switchLanguage('ja', '');
        break;
    }
    if (mounted) {
      setState(() {
        _value = selected ? index : null;
      });
    }
  }
}
