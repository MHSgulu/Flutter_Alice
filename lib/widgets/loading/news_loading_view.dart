import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsLoadingView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      enabled: true,
      child: ListView.builder(
        itemBuilder: (_,__) => Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          width: double.infinity,
          height: 150,
        ),
        itemCount: 4,
      ),
    );
  }

}