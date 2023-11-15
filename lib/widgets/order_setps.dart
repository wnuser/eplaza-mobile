import 'package:flutter/material.dart';

import '../utils/helper.dart';

class OrderSteps extends StatelessWidget {
  final int active;

  OrderSteps({required this.active, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _w('Address', position: 0, active: active, leftLine: false),
            _w('Order Summary', position: 1, active: active, leftLine: true),
            _w('Payment', position: 2, active: active, rightLine: false),
          ],
        ),
      ),
    );
  }

  Widget _w(String title,
      {required int position, required int active, bool leftLine = true, bool rightLine = true}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: leftLine ? Container(height: 1.5, color: Colors.blue) : empty()),
              Helper.spaceHorizontal(12),
              _circle(active, position),
              Helper.spaceHorizontal(12),
              Expanded(child: rightLine ? Container(height: 1.5, color: Colors.blue) : empty()),
            ],
          ),
          Helper.spaceVertical(4),
          Text(
            title,
            style: MyTextStyle(
              fontSize: fontSizeSmall,
              fontWeight: position == active ? FontWeight.w600 : FontWeight.w500,
              color: position > active ? Colors.grey : Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _circle(int active, int pos) {
    if (pos < active) {
      return Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blue.shade100, shape: BoxShape.circle),
        child: Icon(
          Icons.check,
          color: Colors.blue,
          size: 18,
        ),
      );
    } else if (pos == active) {
      return Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: Text(
          (pos + 1).toString(),
          style: MyTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          (pos + 1).toString(),
          style: MyTextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }
  }
}
