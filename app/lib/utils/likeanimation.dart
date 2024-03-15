import '/database/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class likeAnimation extends StatefulWidget {
  final snap;

  const likeAnimation({
    super.key,
    required this.snap,
  });

  @override
  State<likeAnimation> createState() => _likeAnimationState();
}

class _likeAnimationState extends State<likeAnimation> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await authMethod().likepost(widget.snap['userID'], widget.snap['like']);
      },
      icon: widget.snap['like'].contains(widget.snap['userID'])
          ? Icon(
              Icons.favorite,
              color: Colors.redAccent,
            )
          : Icon(
              Icons.favorite_border_outlined,
              color: Colors.grey,
            ),
    );
  }
}
