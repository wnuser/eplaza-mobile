import 'package:e_plaza/utils/helper.dart';
import 'package:e_plaza/widgets/my_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StoreDetailsWidget extends StatelessWidget {
  final String shopName;
  final String? shopDescription;
  final String shopAddress;

  StoreDetailsWidget(this.shopName,this.shopDescription,this.shopAddress,{Key? key}) : super(key: key);

  ExpandableController con = ExpandableController(initialExpanded: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shopName,
            style: MyTextStyle(
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Colors.black87,
              ),
              Helper.spaceHorizontal(2),
              Expanded(
                child: Text(
                  shopAddress,
                  style: MyTextStyle(
                    fontSize: fontSizeSmall,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Helper.spaceVertical(8),
          Divider(color: Colors.grey.shade100, height: 0, thickness: 1),
          Helper.spaceVertical(8),
          // Row(
          //   mainAxisSize: MainAxisSize.max,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(25),
          //       child: MyNetworkImage(
          //         path: '',
          //         imageName: 'https://pbs.twimg.com/media/DeTjnSuW4AMm5Db.jpg',
          //         width: 50,
          //         height: 50,
          //       ),
          //     ),
          //     Helper.spaceHorizontal(12),
          //     Expanded(
          //         child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Mr. Tester',
          //           style: MyTextStyle(
          //             fontSize: fontSizeMedium,
          //             fontWeight: FontWeight.w500,
          //             color: Colors.black,
          //           ),
          //           maxLines: 1,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         Text(
          //           'Job Title : Sales manager',
          //           style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w400),
          //           maxLines: 1,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         Row(
          //           mainAxisSize: MainAxisSize.max,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Icon(Icons.call_outlined, size: 12, color: Colors.black),
          //             Helper.spaceHorizontal(4),
          //             Expanded(
          //               child: Text(
          //                 '1234567890',
          //                 style: MyTextStyle(
          //                   fontSize: fontSizeSmall,
          //                   fontWeight: FontWeight.w400,
          //                   color: Colors.black,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //     )),
          //     Helper.spaceHorizontal(12),
          //     assetImage('assets/icons/whatsapp_green.png', width: 40, height: 40),
          //   ],
          // ),
          Helper.spaceVertical(8),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Divider(color: Colors.grey.shade100, height: 0, thickness: 1),
          ),
          Helper.spaceVertical(10),
          ExpandablePanel(
            controller: con,
            header: Text(
              'Shop Highlights',
              style: MyTextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              shopDescription != null ? shopDescription! : '' ,
              style: MyTextStyle(
                fontSize: fontSizeLarge,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),
            collapsed: empty(),
            theme: ExpandableThemeData(
                tapHeaderToExpand: true, hasIcon: true, iconPadding: EdgeInsets.zero, iconSize: 22),
          ),
        ],
      ),
    );
  }
}
