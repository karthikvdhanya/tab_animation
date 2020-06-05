import 'package:flutter/material.dart';
import 'package:tab_animation/utils/screen_cosntast.dart';

class SimpleTabView extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int> onSelectionChanged;
  SimpleTabView({Key key, @required this.items, this.onSelectionChanged})
      : super(key: key);

  @override
  _SimpleTabViewState createState() => _SimpleTabViewState();
}

class _SimpleTabViewState extends State<SimpleTabView> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _getWidgets(),
        ),
      ),
    );
  }

  List<Widget> _getWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.items.length; i++) {
      widgets.add(Expanded(
        child: CatagoryItem(
          isFirst: i == 0,
          isLast: i == widget.items.length - 1,
          isSelected: i == selectedItem,
          itemName: widget.items[i],
          onTap: () {
            setState(() {
              selectedItem = i;
              if (widget.onSelectionChanged != null)
                widget.onSelectionChanged(i);
            });
          },
        ),
      ));
    }
    return widgets;
  }
}

class CatagoryItem extends StatelessWidget {
  final bool isSelected;
  final bool isFirst;
  final bool isLast;
  final String itemName;
  final VoidCallback onTap;
  const CatagoryItem({
    Key key,
    this.isSelected = false,
    this.isFirst = false,
    this.isLast = false,
    this.onTap,
    this.itemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: isSelected ? 0.5 : 0,
                blurRadius: isSelected ? 4 : 0,
                offset: Offset(
                    isSelected ? (isFirst ? (-3.0) : (isLast ? 3.0 : 6)) : 0,
                    isSelected ? isFirst ? 4 : isLast ? 4 : 0 : 0),
                color: Colors.blueGrey.shade100)
          ],
          borderRadius: BorderRadius.only(
              bottomLeft:
                  isFirst ? ScreenConstants.radius : ScreenConstants.zeroRadius,
              bottomRight:
                  isLast ? ScreenConstants.radius : ScreenConstants.zeroRadius,
              topLeft:
                  isFirst ? ScreenConstants.radius : ScreenConstants.zeroRadius,
              topRight:
                  isLast ? ScreenConstants.radius : ScreenConstants.zeroRadius),
        ),
        child: Text(
          itemName,
          style: Theme.of(context).textTheme.body1.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }
}
