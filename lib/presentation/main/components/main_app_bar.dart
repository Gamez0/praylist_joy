import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Text("Puzzleleaf", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Color(0xff2b3044),
              borderRadius: BorderRadius.circular(20),
            ),
              child: Text("My Account",
                style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
            backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/20354164'),
            radius: 18,
          )
        ],
      ),
    );
  }
}
