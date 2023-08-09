import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_plaza_vendor/utils/const.dart';
import 'package:e_plaza_vendor/utils/helper.dart';
import 'package:e_plaza_vendor/values/dimen.dart';
import 'package:e_plaza_vendor/values/strings.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:e_plaza_vendor/widgets/widgets.dart';

// ignore: must_be_immutable
class MyAppBar extends StatefulWidget {
  final String title;
  final bool enableBackButton;
  final bool showBellButton;
  final bool enableSearch;
  final bool enableClearButton;
  final void Function(String text)? searchCallBack;
  final void Function()? backCallBack;
  bool searchExpanded;
   TextEditingController? searchController;
  final bool searchReadOnly;
  final Function()? onSearchClick;

  MyAppBar(this.title,
      {Key? key,
      this.enableBackButton = true,
      this.showBellButton = false,
      this.enableSearch = false,
      this.searchCallBack,
      this.backCallBack,
      this.searchExpanded = false,
      this.enableClearButton = true,
      this.searchController,
      this.searchReadOnly = false,
      this.onSearchClick})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  _MyAppBarState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.searchController = widget.searchController ?? TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: const BoxDecoration(color: ThemeColors.colorPrimary),
      child: widget.searchExpanded
          ? _searchBar
          : Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _backButton,
                _toolbarTitle,
                Helper.spaceHorizontal(5),
                _searchIcon,
                _bellIcon,
                Helper.spaceHorizontal(8),
              ],
            ),
    );
  }

  Widget get _toolbarTitle => Expanded(
      child: Text(widget.title ?? Strings.get('appName'),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
          style:  MyTextStyle(
              color: Colors.white,
              fontSize: fontSizeLarge,
              fontWeight: FontWeight.w600)));

  Widget get _searchBar => Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: MyFlatButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
                child: const Icon(Icons.search,
                    color: ThemeColors.colorPrimary, size: 18),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (txt) {
                  if (widget.searchCallBack != null) {
                    widget.searchCallBack!.call(txt);
                  }
                },
                onTap: widget.onSearchClick,
                cursorWidth: 1.4,
                readOnly: widget.searchReadOnly,
                autofocus: true,
                cursorColor: ThemeColors.colorPrimary,
                controller: widget.searchController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintText: ' ' + Strings.get('search') + '...',
                    hintStyle: MyTextStyle(
                      fontSize: fontSizeMedium,
                      color: ThemeColors.colorPrimary,
                    ),
                    isDense: true,
                    border: InputBorder.none),
                textInputAction: TextInputAction.search,
                // onSubmitted: (str) => searchCallBack.call(str),
                style: MyTextStyle(
                  fontSize: fontSizeMedium,
                  color: ThemeColors.colorPrimary,
                ),
              ),
            ),
            _clearButton
          ],
        ),
      );

  Widget get _searchIcon => widget.searchCallBack != null
      ? Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            width: 30,
            height: 30,
            child: MyFlatButton(
              onPressed: () => setState(() => widget.searchExpanded = true),
              color: Colors.white.withAlpha(50),
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              child: const Icon(Icons.search, color: Colors.white, size: 18),
            ),
          ),
        )
      : empty();

  Widget get _bellIcon => widget.showBellButton
      ? Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6, top: 6, bottom: 6),
              child: SizedBox(
                width: 30,
                height: 30,
                child: MyFlatButton(
                  // onPressed: () => Get.to(() => NotificationsScreen()),
                  // onLongPress: () => Get.to(() => LogScreen()),
                  onPressed: () {},
                  color: Colors.white.withAlpha(50),
                  padding: EdgeInsets.zero,
                  shape: const CircleBorder(),
                  child: assetImage('assets/icons/notification_outline.png',
                      color: Colors.white, width: 18, height: 18),
                ),
              ),
            ),
            Obx(
              () => Const.notificationCount.value > 0
                  ? Container(
                      width: 36,
                      height: 36,
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            Const.notificationCount.value.toString(),
                            style: MyTextStyle(
                                color: Colors.red,
                                fontSize: fontSizeMini,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(width: 18, height: 18),
            )
          ],
        )
      : empty();

  Widget get _clearButton => SizedBox(
        width: 40,
        height: 40,
        child: MyFlatButton(
          onPressed: () {
            if (widget.searchController!.text.isNotEmpty) {
              widget.searchController!.clear();
              widget.searchCallBack!.call('');
            } else {
              setState(() => widget.searchExpanded = false);
            }
          },
          color: Colors.white.withAlpha(50),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          child: const Icon(Icons.close,
              color: ThemeColors.colorPrimary, size: 18),
        ),
      );

  // Widget get _backButton=> enableBackButton
  //          ?IconButton(
  //     onPressed: backCallBack != null ? backCallBack : Get.back,
  //     icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 18),
  //   ):Container(width: 20);

  Widget get _backButton => widget.enableBackButton
      ? SizedBox(
          width: 40,
          height: 40,
          child: MyFlatButton(
            onPressed: widget.backCallBack ?? Get.back,
            // onPressed: () {
            //   if (backCallBack != null) {
            //     backCallBack.call();
            //   } else {
            //     Get.back();
            //   }
            // },
            padding: EdgeInsets.zero,
            shape: const CircleBorder(),
            child: const Icon(Icons.arrow_back_ios_rounded,
                color: Colors.white, size: 18),
          ),
        )
      : Container(width: 20);
}
