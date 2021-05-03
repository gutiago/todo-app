import 'package:flutter/material.dart';
import '../../resources/spacings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader(this.greetings, this.todayTasksCount, this.todayDate);

  final String greetings;
  final String todayTasksCount;
  final String todayDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacings.x5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: Spacings.x4),
            child: Icon(
              Icons.account_circle,
              size: 45.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacings.x1),
            child: Text(
              greetings,
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Text(
            todayTasksCount,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: Spacings.x7),
            child: Text(
              todayDate,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
