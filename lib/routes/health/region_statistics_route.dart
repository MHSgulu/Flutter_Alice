import 'package:alice/model/today_epidemic_data_entity.dart';
import 'package:alice/widgets/custom/custom_scroll_behavior.dart';
import 'package:alice/widgets/custom/my_appbar.dart';
import 'package:flutter/material.dart';

import 'domestic/paginated_data_table.dart';

class RegionStatisticsRoute extends StatelessWidget {
  final List<TodayEpidemicDataShowapiResBodyTodayDetailList> data;

  const RegionStatisticsRoute({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        label: '疫情数据',
        onPressedBack: () => Navigator.pop(context),
      ),
      body: ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '国内各地区疫情统计汇总',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '7:00-10:00为更新高峰，数据若滞后敬请谅解',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '(疑似病例数据可能未统计到)',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              VariousRegionsPaginatedDataTable(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
