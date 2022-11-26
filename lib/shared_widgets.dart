import 'package:flutter/material.dart';

import 'app_ui.dart';

class PlayRightAppBar extends StatelessWidget {
  const PlayRightAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('PlayRight.', style: PlayRightTextStyle.title),
      floating: true,
      snap: true,
      // expandedHeight: 200.0,
      // flexibleSpace: const FlexibleSpaceBar(
      //   title: Text('PlayRight.'),
      // ),
    );
  }
}
