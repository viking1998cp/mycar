import 'package:flutter/cupertino.dart';
import 'package:mycar/common/widget/image_from_network.dart';

Widget imageRadius(String url ,double width, double height, double radius){
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(shape: BoxShape.circle),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: imageFromNetWork(url, width, height)),
  );
}