import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class CourceType extends StatefulWidget {
  final String typeName;
  final String iconData;
  CourceType({Key key, @required this.typeName, @required this.iconData})
      : super(key: key);

  @override
  _CourceTypeState createState() => _CourceTypeState();
}

class _CourceTypeState extends State<CourceType> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ScreenConstants.dblPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          height: ScreenConstants.catagoryTypeTileSize,
          width: ScreenConstants.catagoryTypeTileSize,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: ScreenConstants.catagoryTypeTileSize,
                  child: Image.asset(
                    widget.iconData,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          widget.typeName,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
