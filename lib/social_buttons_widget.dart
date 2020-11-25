import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_buttons/enums.dart';
import 'package:social_buttons/social_button_item.dart';
import 'package:url_launcher/url_launcher.dart';



class SocialButtons extends StatefulWidget {
  final List<SocialButtonItem> items;

  const SocialButtons({Key key, @required this.items}) : super(key: key);

  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        direction: Axis.horizontal,
        children: widget.items.map((item) {
          AnimationController _animationHandle = AnimationController(
            duration: const Duration(milliseconds: 3600),
            vsync: this,
          );
          return AnimatingItem(
            controller: _animationHandle,
            sbi: item,
          );
        }).toList(),
      ),
    );
  }
}

class AnimatingItem extends StatefulWidget {
  final AnimationController controller;
  final SocialButtonItem sbi;

  const AnimatingItem({Key key, @required this.controller, @required this.sbi})
      : super(key: key);
  @override
  _AnimatingItemState createState() => _AnimatingItemState();
}

class _AnimatingItemState extends State<AnimatingItem> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _child;

    if (widget.sbi.socialItem == socialItems.twitter) {
      _child = FaIcon(
        FontAwesomeIcons.twitter,
        size: widget.sbi.itemSize,
        color: widget.sbi.itemColor,
      );
    } else if (widget.sbi.socialItem == socialItems.instagram) {
      _child = FaIcon(
        FontAwesomeIcons.instagram,
        color: widget.sbi.itemColor,
        size: widget.sbi.itemSize,
      );
    } else if (widget.sbi.socialItem == socialItems.facebook) {
      _child = FaIcon(
        FontAwesomeIcons.facebook,
        size: widget.sbi.itemSize,
        color: widget.sbi.itemColor,
      );
    }
    else if (widget.sbi.socialItem == socialItems.github) {
      _child = FaIcon(
        FontAwesomeIcons.github,
        size: widget.sbi.itemSize,
        color: widget.sbi.itemColor,
      );
    }
    else if (widget.sbi.socialItem == socialItems.snapchat) {
      _child = FaIcon(
        FontAwesomeIcons.snapchat,
        size: widget.sbi.itemSize,
        color: widget.sbi.itemColor,
      );
    }
    else if (widget.sbi.socialItem == socialItems.website) {
      _child = FaIcon(
        FontAwesomeIcons.internetExplorer,
        size: widget.sbi.itemSize,
        color: widget.sbi.itemColor,
      );
    }


    return Container(
      child: Container(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () async {
            if (widget.controller.isAnimating) {
              widget.controller.stop();
              widget.controller.reset();
            } else {
              widget.controller.repeat(period: Duration(milliseconds: 500));
            }

            if (await canLaunch(widget.sbi.url)) {
              await Future.delayed(Duration(milliseconds: 500));
              widget.controller.stop();
              widget.controller.reset();
              await launch(widget.sbi.url);
            } else {
              throw 'Could not launch ${widget.sbi.url}';
            }
          },
          child: RotationTransition(turns: widget.controller, child: _child),
        ),
      ),
    );
  }
}
