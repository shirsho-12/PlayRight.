import 'package:flutter/material.dart';

import 'app_ui.dart';
import 'models/prompt.dart';
import 'models/user.dart';

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

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            PlayRightColors.inactive.withOpacity(0.3),
            PlayRightColors.accent.withOpacity(0.3),
          ],
        ),
      ),
    ));
  }
}

class FooDecoration extends Decoration {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  const FooDecoration({
    this.insets = const EdgeInsets.all(12),
    this.color = Colors.grey,
    this.blurRadius = 8,
    this.inner = false,
  });
  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) =>
      _FooBoxPainter(insets, color, blurRadius, inner);
}

class _FooBoxPainter extends BoxPainter {
  final EdgeInsets insets;
  final Color color;
  final double blurRadius;
  final bool inner;

  _FooBoxPainter(this.insets, this.color, this.blurRadius, this.inner);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var rect = offset & configuration.size!;
    canvas.clipRect(rect);
    var paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.outer, blurRadius);

    var path = Path();
    if (inner) {
      path
        ..fillType = PathFillType.evenOdd
        ..addRect(insets.inflateRect(rect))
        ..addRect(rect);
    } else {
      path.addRect(insets.deflateRect(rect));
    }
    canvas.drawPath(path, paint);
  }
}

AppBar playRightAppBar() {
  return AppBar(
    title: Text('PlayRight.',
        style: PlayRightTextStyle.title, textAlign: TextAlign.center),
    centerTitle: true,
    // automaticallyImplyLeading: false,
  );
}

Drawer playRightDrawer(User user, BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: null,
          accountName: Text(user.name),
          accountEmail: Text(user.userName),
          currentAccountPicture: const CircleAvatar(
            // backgroundImage: NetworkImage(user.userAvatarLink),
            backgroundImage: AssetImage('assets/images/account.png'),
            backgroundColor: Colors.white,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text("TOOLS"),
        ),
        ListTile(
          // dense: true,
          leading: const Icon(Icons.lightbulb, color: Colors.black),
          title: const Text(
            'Prompt generator',
          ),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          // minLeadingWidth: 12,
          onTap: () {
            Navigator.popAndPushNamed(context, '/prompt');
          },
        ),
        ListTile(
          leading: const Icon(Icons.search, color: Colors.black),
          title: const Text('Explore prompts'),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.popAndPushNamed(context, '/explore');
          },
        ),
        ListTile(
          leading: const Icon(Icons.collections_bookmark_rounded,
              color: Colors.black),
          title: const Text('Prompt Archive'),
          horizontalTitleGap: 0,
          minVerticalPadding: 0,
          onTap: () {
            Navigator.popAndPushNamed(context, '/idea-bank');
          },
        ),
        const Divider(
          color: Colors.black,
          indent: 12,
          endIndent: 12,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Text("ABOUT"),
        ),
        ListTile(
          title: const Text('About us'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Help'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Contact us'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Privacy and security'),
          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

class PromptDialog extends StatelessWidget {
  const PromptDialog({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<String> namePrompts = Prompt.presetData(name);
    return SizedBox(
        width: width / 2,
        height: height / 3,
        child: ListView.builder(
            itemCount: namePrompts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("• ",
                        style: PlayRightTextStyle.bodyText1
                            .copyWith(color: Colors.black)),
                    Expanded(
                      child: Text(namePrompts[index],
                          style: PlayRightTextStyle.bodyText1
                              .copyWith(color: Colors.black)),
                    ),
                  ],
                ),
              );
            }));
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(
      {Key? key, required this.text, this.color = Colors.white})
      : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• ", style: PlayRightTextStyle.headline6.copyWith(color: color)),
        Expanded(
          child: Text(text,
              style: PlayRightTextStyle.headline6.copyWith(color: color)),
        ),
      ],
    );
  }
}

extension TitleCase on String {
  String toTitleCase() {
    return toLowerCase().replaceAllMapped(
        RegExp(
            r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
        (Match match) {
      return "${match[0]![0].toUpperCase()}${match[0]!.substring(1).toLowerCase()}";
    }).replaceAll(RegExp(r'(_|-)+'), ' ');
  }
}
