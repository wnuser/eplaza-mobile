import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/helper.dart';
import '../widgets/app_bar.dart';

class HelpAndSupport extends StatelessWidget {
  HelpAndSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyAppBar(
              'Help & Support',
              enableSearch: true,
            ),
            Helper.spaceVertical(20),
            assetImage(
              'assets/icons/logo.png',
              width: 55.w,
              fit: BoxFit.fitWidth,
            ),
            Helper.spaceVertical(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'We Are Eager To Give You Best Service at ' + 'appName'.t,
                textAlign: TextAlign.center,
                style: MyTextStyle(
                  fontSize: fontSizeSmall,
                  color: ThemeColors.colorPrimary.shade800,
                ),
              ),
            ),
            Helper.spaceVertical(60),
            _item(
              'assets/icons/phone_outline.png',
              'Give Us Call',
              '+911234567890',
              () => call(),
            ),
            Helper.spaceVertical(10),
            _item(
              'assets/icons/mai_outline.png',
              'Send Us Message',
              'eplaza@gmail.com',
              () => openMail(),
            ),
            Helper.spaceVertical(10),
            _item(
              'assets/icons/location_outline.png',
              'Visit Our Location',
              'Nearby Gaytri Mandir, Opp.Appolo Farmacy, Vidya Nagar, Bilaspur Chhattisgarh,  India - 495001',
              () => launchMap(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(String asset, String label, String text, void Function() callback) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            assetImage(
              asset,
              width: 30,
              height: 30,
              color: ThemeColors.colorPrimary,
            ),
            Helper.spaceHorizontal(20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: MyTextStyle(fontWeight: FontWeight.w600),
                  ),
                  Helper.spaceVertical(4),
                  Text(
                    text,
                    style: MyTextStyle(),
                  ),
                  Helper.spaceVertical(6),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void call() async {
    var url = 'tel:1234567890';
    try {
      await launch(url);
    } catch (e) {}
  }

  void openMail() async {
    var url = 'mailto:eplaza@gmail.com?subject=&body=';
    try {
      await launch(url);
    } catch (e) {}
  }

  void launchMap() async {
    String query = Uri.encodeFull(
        'Nearby Gaytri Mandir, Opp.Appolo Farmacy, Vidya Nagar, Bilaspur Chhattisgarh,  India - 495001');
    String url = "https://www.google.com/maps/search/?api=1&query=$query";

    try {
      await launch(url);
    } catch (e) {}
  }

// void launchMap() async {
//   const url = 'https://www.google.com/maps/search/?api=1&query=30.106280,78.278894';
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// }
}
