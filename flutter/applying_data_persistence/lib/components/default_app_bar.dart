import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool? showLevel = false;
  double? currentLevel = 0;
  List<Widget>? actions;

  DefaultAppBar(
      {required this.title,
      this.showLevel,
      this.currentLevel,
      this.actions,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Padding(
        padding: EdgeInsets.all(8),
        child: showLevel == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: actions != null ? 200 : 260,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black26,
                          value: currentLevel != null && currentLevel! > 0
                              ? (currentLevel! / 10)
                              : 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                        ),
                        child: Text(
                            'Nivel ${(currentLevel != null ? currentLevel! * 10 : 0).truncateToDouble()}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              )
            : Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showLevel == true ? 60 : 50);
}
