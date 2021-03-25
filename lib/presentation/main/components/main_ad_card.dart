import 'package:flutter/material.dart';

class MainAdCard extends StatelessWidget {
  final String title;
  final String content;

  const MainAdCard({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(content, style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/20354164'),
            ),
          ]
        ),
      ),
    );
  }
}
