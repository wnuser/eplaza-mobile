import 'package:e_plaza/utils/helper.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  // final Controller _controller = Get.put(Controller(), tag: 'SearchScreenController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.w,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: .5,
                      blurRadius: .5,
                      offset: Offset(0, 0.5))
                ]),
                padding: const EdgeInsets.all(4.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Search Stores',
                      prefixIcon: Icon(Icons.search, size: 26, color: ThemeColors.defaultTextColor),
                      suffixIcon: Icon(Icons.close, size: 22, color: ThemeColors.defaultTextColor)),
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.restore),
                      title: Text('Keyboards'),
                      subtitle: Text('In Keyboards'),
                      onTap: () {},
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      trailing: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.restore),
                      title: Text('Keyboards'),
                      subtitle: Text('In Keyboards'),
                      onTap: () {},
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      trailing: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.restore),
                      title: Text('Keyboards'),
                      subtitle: Text('In Keyboards'),
                      onTap: () {},
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      trailing: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.restore),
                      title: Text('Keyboards'),
                      subtitle: Text('In Keyboards'),
                      onTap: () {},
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      trailing: Icon(
                        Icons.close,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
