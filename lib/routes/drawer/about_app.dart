import 'package:alice/common/util/tool_util.dart';
import 'package:flutter/material.dart';

///创建一个用于显示“关于”框的列表块。
///参数都是可选的。 应用程序名称（如果省略）将从最近的[Title]小部件派生。
///版本，图标和合法值默认为空字符串。

class AppAboutListTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      ///要为此抽屉项目显示的图标。
      ///默认情况下，不显示任何图标。
      ///这不一定与对话框本身中显示的图像相同； 由[applicationIcon]属性控制。
      icon: ImageIcon(
        AssetImage('assets/icons/icon_draw_about.png'),
        //size: ,
        //color: ,
      ),
      ///要在此抽屉项目上显示的标签。
      ///默认为显示“ About Foo”的文本小部件，其中“ Foo”是[applicationName]指定的应用程序名称。
      //child: Text('关于 Alice'),
      ///应用程序的名称。
      ///此字符串在此抽屉项目的默认标签中使用（请参见[child]），并显示为[AboutDialog]的标题。
      ///如果可以找到[Title]小部件，则默认为[Title.title]的值。 否则，默认为[Platform.resolvedExecutable]。
      applicationName: 'Alice',
      ///此应用程序版本的版本。
      ///此字符串显示在[AboutDialog]中的应用程序名称下。
      ///默认为空字符串。
      applicationVersion: '1.0.0',
      ///在[AboutDialog]中，在应用程序名称旁边显示的图标。
      ///默认情况下，不显示任何图标。
      ///通常，这将是一个[ImageIcon]小部件。 它应该尊重[IconTheme]的[IconThemeData.size]。
      ///这不一定与抽屉项本身上显示的图标相同，该图标由[icon]属性控制。
      applicationIcon: ImageIcon(
        AssetImage('assets/icons/icon_draw_about_wh.png'),
        size: 30,
        //color: ,
      ),
      ///在[AboutDialog]中以小字体显示的字符串。
      ///通常，这是版权声明。
      ///默认为空字符串。
      applicationLegalese: '版权声明',
      ///在名称，版本和法律条款之后添加到[AboutDialog]的小部件。
      ///这可能包括指向网站的链接，一些描述性文本，字幕或其他信息，这些信息显示在“关于”框中。
      ///默认为空。
      aboutBoxChildren: [
        SizedBox(height: 8),
        Text('github:',style: TextStyle(fontSize: 14),),
        SizedBox(height: 2),
        GestureDetector(
          onTap: ()=> ToolUtil.launchWebUrl('https://github.com/MHSgulu/Flutter_Alice'),
          child: Text(
            'https://github.com/MHSgulu/Flutter_Alice',
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 12,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
      ///此列表图块是否是垂直密集列表的一部分。
      ///如果此属性为null，则其值基于[ListTileTheme.dense]。
      ///密集列表图块默认设置为较小的高度。
      dense: false,  //默认 true
    );
  }

}