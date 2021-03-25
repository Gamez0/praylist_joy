import 'package:flutter/material.dart';

class SavingsAccountCard extends StatelessWidget {
  final Color color;

  const SavingsAccountCard({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end, // 오른쪽 정렬
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 1234-56-123123 을 왼쪽 정렬 해줌
                  children: [
                    Text("Savings Account", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text('1234-56-123123', style: TextStyle(
                      fontSize: 11, color: Colors.black.withOpacity(0.4),
                    ),
                    ),
                  ],
                ),
                Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
            Text('\$ 1,234,567', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
            ),
            // Row(
            //   children: [
            //     Expanded(child: Text('Transfer', textAlign: TextAlign.center)), // expanded 늘려짐
            //     Text('|'),
            //     Expanded(child: Text('Details', textAlign: TextAlign.center)),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
