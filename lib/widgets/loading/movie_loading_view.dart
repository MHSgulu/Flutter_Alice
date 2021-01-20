import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: Column(
        children: [
          /*Container(
            margin: EdgeInsets.fromLTRB(16, 10, 10, 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            width: double.infinity,
            height: 30,
          ),*/
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.55,
              mainAxisSpacing: 0,
              crossAxisSpacing: 10,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 265,
                    height: 150,
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: 100,
                    height: 20,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
