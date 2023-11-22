import 'package:e_plaza/modals/slide.dart';
import 'package:e_plaza/modals/specific_store_products_model.dart';
import 'package:e_plaza/screens/cart_list/cart_controller.dart';
import 'package:e_plaza/screens/cart_list/cart_list_screen.dart';
import 'package:e_plaza/screens/store_product_details/slider.dart';
import 'package:e_plaza/utils/const.dart';
import 'package:e_plaza/values/dimen.dart';
import 'package:e_plaza/values/size_config.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modals/store_product.dart';
import '../../utils/helper.dart';
import '../../widgets/app_bar2.dart';
import '../../widgets/my_network_image.dart';
import '../../widgets/rating_reviews/percent_rating_review.dart';
import '../../widgets/rating_reviews/star_display.dart';
import '../../widgets/widgets.dart';
import '../components/global_product.dart';
import 'controller.dart';

class StoreProductDetailsScreen extends StatefulWidget {
  final int product_id;

  StoreProductDetailsScreen({required this.product_id, Key? key}) : super(key: key);

  @override
  State<StoreProductDetailsScreen> createState() => _StoreProductDetailsScreenState();
}

class _StoreProductDetailsScreenState extends State<StoreProductDetailsScreen> {
  final Controller _controller = Get.put(Controller(), tag: 'StoreProductDetailsScreenController');

  @override
  void initState() {
    print(widget.product_id);
    _controller.getSpecificPRoductDetails(widget.product_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          MyAppBar2(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                // Obx(() => _controller.slides.isNotEmpty
                //     ? ProductImageSlider(
                //         _controller.slides.map((element) => Slide('', element)).toList())
                //     : empty()),

                Obx(() => _controller.specificProductDetails.isEmpty 
                ? empty()
                : _controller.specificProductDetails[0].data == null  
                ? empty()
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      width: 100.w,
                      // height: 70.h,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.vertical(top: Radius.circular(8.w)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                                child: MyNetworkImage(
                                  path: '',
                                  imageName: _controller.specificProductDetails[0].data![0].image1.toString(),
                                  title: _controller.specificProductDetails[0].data![0].name.toString(),
                                  fit: BoxFit.fitWidth,
                                  errorWidget: Container(
                                    padding: const EdgeInsets.all(20),
                                    child: assetImage('assets/images/noImageplaceholder.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'MRP',
                                style: MyTextStyle(
                                  color: Colors.black54,
                                  fontSize: fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Helper.spaceHorizontal(8),
                              Text(
                                _controller.specificProductDetails[0].data![0].price.toString(),
                                style: MyTextStyle(
                                  color: Colors.red,
                                  fontSize: fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Helper.spaceHorizontal(5),
                              Text(
                                Const.currencySymbol + _controller.specificProductDetails[0].data![0].offerPrice.toString(),
                                style: MyTextStyle(
                                  color: Colors.black,
                                  fontSize: fontSizeExtraLarge,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),
                              smallIcon(Icons.favorite, () {}),
                            ],
                          ),
                          Helper.spaceVertical(16),
                          Text(
                            _controller.specificProductDetails[0].data![0].name.toString(),
                            style: MyTextStyle(
                              color: Colors.black,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Helper.spaceVertical(16),
                          Text(
                            _controller.specificProductDetails[0].data![0].description.toString(),
                            style: MyTextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Helper.spaceVertical(8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // StarDisplay(
                              //   starCount: 5,
                              //   rating: Helper.parseDouble(4),
                              //   size: 16.0,
                              //   color: ThemeColors.colorPrimary,
                              // ),
                              Helper.spaceHorizontal(4),
                              // Text(
                              //   '5.0',
                              //   style: MyTextStyle(
                              //       color: Colors.black,
                              //       fontSize: fontSizeSmall,
                              //       fontWeight: FontWeight.w600),
                              // ),
                              Helper.spaceHorizontal(8),
                              // Text(
                              //   '(158 Reviews) 12 Orders',
                              //   style: MyTextStyle(
                              //       color: Colors.black,
                              //       fontSize: fontSizeSmall,
                              //       fontWeight: FontWeight.w500),
                              // )
                            ],
                          ),
                          Divider(color: Colors.grey.shade300, height: 20, thickness: 0.6),
                          Text(
                            'Highlights',
                            style: MyTextStyle(
                              color: Colors.black,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Helper.spaceVertical(8),
                          ...[
                            'Type - Fresh',
                            'Enumerator - Test',
                            'Quantity - Fine',
                            'Stocks - Unlimited',
                          ].map((e) => _feature(e)).toList(),
                          Helper.spaceVertical(10),
                          _storeCard(),
                          _purchaseDetailsTile(),
                          _shippingTile(),
                          Helper.spaceVertical(4),
                          _paymentTile(),
                          Helper.spaceVertical(4),
                          _returnTile(),
                          Helper.spaceVertical(6),
                          Text('Similar Products',
                              style:
                                  MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
                          _products(_controller.storeProductsDynamic),
                          Divider(thickness: 0.7, height: 0),
                          Helper.spaceVertical(8),
                          Text('Hot products from this store',
                              style:
                                  MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
                          _products(_controller.storeProductsDynamic.reversed.toList()),
                          Helper.spaceVertical(8),
                          Text('Grammart mela product',
                              style:
                                  MyTextStyle(fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
                          _products(_controller.storeProductsDynamic),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(color: Colors.grey.shade400, height: 0),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('0 Ratings/ 0 Reviews',
                                    style: MyTextStyle(
                                        fontSize: fontSizeLarge, fontWeight: FontWeight.bold)),
                                Helper.spaceHorizontal(20),
                              ],
                            ),
                          ),
                          Helper.spaceVertical(2),
                          PercentRatingReviews(
                            average: 4.0,
                            rating: 4.0,
                            stars: [
                              'Star 5',
                              'Star 4',
                              'Star 3',
                              'Star 2',
                              'Star 1',
                            ],
                            values: [0, 0, 0, 0, 0],
                            totalRating: 5,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(12),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Text('Reviews',
                          //           style: MyTextStyle(
                          //               fontSize: fontSizeLarge, fontWeight: FontWeight.w600)),
                          //       Helper.spaceHorizontal(20),
                          //     ],
                          //   ),
                          // ),
                          Helper.spaceVertical(12),
                          _reviews(),
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          _bottomLayout(),
        ]),
      ),
    );
  }

  Widget _bottomLayout() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // color: ThemeColors.colorPrimary,
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.withOpacity(0.4),
          //       spreadRadius: 2,
          //       blurRadius: 4,
          //       offset: Offset(0, 2))
          // ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: CircleBorder(),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  assetImage('assets/icons/store.png', width: 20, height: 20, color: Colors.black),
                  Helper.spaceVertical(2),
                  Text(
                    'Store',
                    style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            // Helper.spaceHorizontal(8),
            Expanded(
              flex: 1,
              child: OutlinedButton(
                // height: 50,
                onPressed: () {
                  if (CartController.cartItems.containsKey(_controller.specificProductDetails[0].data![0].name.toString())) {
                    Get.to(() => CartListingScreen());
                  } else {
                    CartController.add(_controller.specificProductDetails[0].data![0] as Data);
                  }
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    side: BorderSide(color: Colors.grey, width: 1)),
                child: Obx(
                  () => _controller.specificProductDetails.isEmpty ?
                  empty() :
                  _controller.specificProductDetails[0].data!.isEmpty ? 
                  empty() :
                  Text(
                      CartController.cartItems.containsKey(_controller.specificProductDetails[0].data![0].name.toString())
                          ? 'Go to cart'
                          : 'Add to cart',
                      style: MyTextStyle(
                          fontSize: fontSizeLarge,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            Helper.spaceHorizontal(12),
            Expanded(
              flex: 1,
              child: TextButton(
                // height: 50,
                onPressed: () {
                  // CartController.cartItems.putIfAbsent(product.title, () => CartItem(product, 1));
                  // Get.to(() => CartListingScreen());
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: ThemeColors.colorPrimary,
                ),
                child: Text('Send inquiry',
                    style: MyTextStyle(
                        fontSize: fontSizeLarge, color: Colors.white, fontWeight: FontWeight.w500)),
              ),
            ),
            Helper.spaceHorizontal(12),
          ],
        ),
      );

  Widget _feature(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '❖  ',
            style: MyTextStyle(
              // color: Colors.white,
              fontSize: fontSizeMedium,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: MyTextStyle(
                // color: Colors.white,
                fontSize: fontSizeMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _reviews() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemReview(
            name: 'Manish',
            rating: 4.0,
            dateTime: '2 minutes ago',
            review: 'Good Product...',
            image: 'https://images.meesho.com/images/products/228753704/1dmmv_512.webp'),
        _itemReview(
            name: 'Manish',
            rating: 4.0,
            dateTime: '2 minutes ago',
            review: 'Good Product...',
            image: 'https://images.meesho.com/images/products/228753704/1dmmv_512.webp'),
        _itemReview(
            name: 'Manish',
            rating: 4.0,
            dateTime: '2 minutes ago',
            review: 'Good Product...',
            image: 'https://images.meesho.com/images/products/228753704/1dmmv_512.webp'),
      ],
    );
  }

  Widget _itemReview({
    required String name,
    required double rating,
    required String dateTime,
    required String review,
    required String image,
  }) {
    double imgWidth = 40.0;
    RxInt maxLines = 2.obs;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1))
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(imgWidth / 2),
                    child: MyNetworkImage(
                      path: '',
                      imageName: image,
                      width: imgWidth,
                      height: imgWidth,
                      errorWidget: imagePlaceholderByName(name, imgWidth / 1.6),
                    ),
                  ),
                ),
                Helper.spaceHorizontal(6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(name,
                          style: MyTextStyle(fontSize: fontSizeSmall, fontWeight: FontWeight.bold)),
                      Helper.spaceVertical(2),
                      Text(Helper.getTimeAgo(dateTime), style: MyTextStyle(fontSize: fontSizeMini)),
                      Helper.spaceVertical(2),
                      StarDisplay(
                          starCount: 5,
                          rating: Helper.parseDouble(rating),
                          size: 12.0,
                          color: ThemeColors.colorPrimary),
                    ],
                  ),
                ),
                Helper.spaceHorizontal(6),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.star, size: 14, color: Color.fromARGB(255, 255, 193, 7)),
                      Helper.spaceVertical(),
                      Text(
                        rating.toString(),
                        style: MyTextStyle(
                            color: Color.fromARGB(255, 255, 193, 7),
                            fontSize: fontSizeMedium,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Helper.spaceHorizontal(10),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Divider(color: Colors.grey, thickness: 0.4)),
            InkWell(
              onTap: () {
                maxLines.value = maxLines.value == 2 ? 60 : 2;
              },
              child: Obx(
                () => Text(
                  review,
                  style: MyTextStyle(color: Colors.grey.shade800, fontSize: fontSizeSmall),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: maxLines.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _products(List<SpecificStoreProducts> products) {
    return SizedBox(
      height: 200,
      width: 100.w,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(/*left: 16, right: 16, */ top: 12, bottom: 15),
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (c, i) {
          return GlobalProductItem(products[0].data![i],
           (p) {
            Get.to(() => StoreProductDetailsScreen(product_id: p.id!));
          }, 
          width: 140);
        },
      ),
    );
  }

  Widget _storeCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 202, 225, 251),
        // gradient: ThemeColors.gradient2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          assetImage('assets/icons/store.png', width: 24, height: 24, color: Colors.black87),
          Helper.spaceHorizontal(16),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pecific Mall',
                style: MyTextStyle(
                  color: Colors.black87,
                  fontSize: fontSizeLarge,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Shopping mall in Dehradun, Uttarakhand',
                style: MyTextStyle(
                  color: Colors.black87,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _shippingTile() {
    return ListTile(
      dense: true,
      leading: assetImage('assets/icons/fast.png', width: 28, height: 28),
      horizontalTitleGap: 0,
      title: Text(
        'Shipping',
        style: MyTextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'Contact supplier negotiable shipping detail!\nEnjoy one time dispatch guarantee',
        style: MyTextStyle(
          fontSize: fontSizeSmall,
          height: 1.2,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, size: 18),
    );
  }

  Widget _paymentTile() {
    return ListTile(
      dense: true,
      leading: assetImage('assets/icons/security.png', width: 22, height: 22),
      horizontalTitleGap: 0,
      title: Text(
        'Payments',
        style: MyTextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Helper.spaceVertical(2),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              assetImage('assets/icons/visa.jpeg', height: 10, fit: BoxFit.fitHeight),
              Helper.spaceHorizontal(12),
              assetImage('assets/icons/master_card.png', height: 10, fit: BoxFit.fitHeight),
              Helper.spaceHorizontal(12),
              assetImage('assets/icons/paypal.jpeg', height: 10, fit: BoxFit.fitHeight)
            ],
          ),
          Helper.spaceVertical(2),
          Text(
            'Enjoy encrypted & secure payment!',
            style: MyTextStyle(
              fontSize: fontSizeSmall,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, size: 18),
    );
  }

  Widget _returnTile() {
    return ListTile(
      dense: true,
      leading: assetImage('assets/icons/return.png', width: 20, height: 20),
      horizontalTitleGap: 0,
      title: Text(
        'Return & Refunds',
        style: MyTextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Eligible for return & refund',
        style: MyTextStyle(
          fontSize: fontSizeSmall,
          height: 1.2,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right_rounded, size: 18),
    );
  }

  Widget _purchaseDetailsTile() {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0,
      title: Text(
        'Purchase details',
        style: MyTextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Protection with 🛡️ Trade Assurance',
        style: MyTextStyle(
          fontSize: fontSizeSmall,
          height: 1.2,
        ),
      ),
    );
  }
}
