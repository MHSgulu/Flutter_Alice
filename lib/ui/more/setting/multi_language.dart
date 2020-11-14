import 'package:alice/custom/my_appbar.dart';
import 'package:alice/provider/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiLanguage extends StatefulWidget {
  @override
  _MultiLanguageState createState() => _MultiLanguageState();
}

class _MultiLanguageState extends State<MultiLanguage> {
  Locale myLocale;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: MyAppBar(
        label: '语言环境',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(12, 40, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('当前主要语言标签: ${myLocale.languageCode}'), //语言环境的主要语言子标签。 不能为空。 它可能是“ und”，代表“ undefined”(未定义)。
            SizedBox(height: 8),
            Text('当前语言环境的区域标签: ${myLocale.countryCode}'), //语言环境的区域子标签。可以为null，表示没有指定的区域子标签。
            SizedBox(height: 8),
            Text('当前语言环境标识符: ${myLocale.toLanguageTag()}'), //返回语法上有效的Unicode BCP47语言环境标识符。
            SizedBox(height: 8),
            Text('当前语言环境: ${myLocale.toString()}'), //返回表示语言环境的字符串。
            SizedBox(height: 50),
            Card(
              child: ListTile(
                onTap: (){
                  Provider.of<AppThemeMode>(context, listen: false).switchLanguage('zh');
                },
                ///在标题之前显示的小部件。通常是[Icon]或[CircleAvatar]小部件。
                leading: Icon(Icons.language_rounded),
                ///列表图块的主要内容。通常是[Text]小部件。这不应该wrap。 要强制执行单行限制，请使用[Text.maxLines]。
                title: Text('中文(简体)',maxLines: 1,style: TextStyle(fontSize: 15),),
                ///标题后显示的小部件。通常是[Icon]小部件。
                trailing: Image.asset('assets/icons/icon_language_1.png',width: 35,height: 35,),
                selected: true,
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Provider.of<AppThemeMode>(context, listen: false).switchLanguage('en');
                },
                ///在标题之前显示的小部件。通常是[Icon]或[CircleAvatar]小部件。
                leading: Icon(Icons.language_rounded),
                ///列表图块的主要内容。通常是[Text]小部件。这不应该wrap。 要强制执行单行限制，请使用[Text.maxLines]。
                title: Text('英语',maxLines: 1,style: TextStyle(fontSize: 15),),
                ///标题后显示的小部件。通常是[Icon]小部件。
                trailing: Image.asset('assets/icons/icon_language_2.png',width: 35,height: 35,),
                selected: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
