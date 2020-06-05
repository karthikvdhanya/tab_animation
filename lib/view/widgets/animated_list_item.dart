import 'package:flutter/material.dart';
import 'package:tab_animation/utils/delayed_list_item_publisher.dart';

class AnimatedListItem extends StatefulWidget {
  final int position;
  final Widget child;
  final Duration duration;
  AnimatedListItem({Key key, this.position, this.child, this.duration})
      : super(key: key);

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,

    );

    _offsetFloat = Tween<Offset>(
            begin: Offset(3.0, 0.0), end: Offset.zero)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: new DelayedListItemPublisher().listenAnimation,
      initialData: -1,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.data >= widget.position && snapshot.data > -1)
          _controller.forward();
        return SlideTransition(position: _offsetFloat, child: widget.child,textDirection: TextDirection.rtl,);
      },
    );
  }
}
