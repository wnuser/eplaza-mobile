
import 'package:connectivity/connectivity.dart';
import 'package:e_plaza/helper/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../helper/navigator_key.dart';

class AppUtil {
  static showToast(
      {required BuildContext context,
      required String message,
      required bool isSuccess}) {
    Get.snackbar(
        isSuccess == true
            ? LocalizationString.success
            : LocalizationString.error,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: isSuccess == true
            ? Colors.green
            : Theme.of(context).errorColor.lighten(),
        icon: Icon(Icons.error, color: Theme.of(context).iconTheme.color),
      messageText: Text(
      message,
      style: TextStyle(
        color: Colors.white, // Set the text color to white
      ),
    ),
    );

  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Widget addProgressIndicator(BuildContext context, double? size) {
    return Center(
        child: SizedBox(
      width: size ?? 50,
      height: size ?? 50,
      child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.black12,
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
    ));
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static void openSingleButtonAleartDailog(
      {required String title,
        required String subTitle,
        required String button2,
        required BuildContext cxt,
        required Color color,
        required VoidCallback shareHandler}
      ){
    showDialog(
        context: cxt,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Theme.of(context).primaryColor,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      decoration: InputDecoration(
                        hintText: subTitle,
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        button2,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      shareHandler();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  // static void openTambolaGameWinnersListDailog(
  //     {required String title,
  //       required String button_name,
  //       required List<AllWinnersListModel> tambola_winners_list,
  //       required bool isDarkTheme,
  //       required BuildContext cxt,
  //       required VoidCallback btnHandler}
  //     )
  // {
  //   showDialog(
  //       context: cxt,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //           contentPadding: EdgeInsets.only(top: 10.0),
  //           content: Container(
  //             width: 600.0,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //             Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Padding(
  //                   padding: EdgeInsets.only(left: 20,right: 00,top: 10),
  //                   child: SizedBox(
  //                       child: new Theme(
  //                         data: new ThemeData(
  //                           primaryColor: Theme.of(context).primaryColor,
  //                           primaryColorDark: Theme.of(context).primaryColor,
  //                         ),
  //                         child: new  Text(
  //                           "!!"+title+"!!",
  //                           style: TextStyle(
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.normal,
  //                             color: Theme.of(context).primaryColor,
  //                           ),
  //                         ),
  //                       )
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 10,left: 20),
  //                   child:  SizedBox( // <-- SEE HERE
  //                       width: 80,
  //                       height: 35,
  //                       child: ElevatedButton(
  //
  //                         child: Text('Close'),
  //                         style: ElevatedButton.styleFrom(
  //                           primary: Colors.indigo,
  //                           textStyle: const TextStyle(
  //                               color: Colors.white,
  //                               fontSize: 12,
  //                               fontStyle: FontStyle.normal),
  //                         ),
  //                         onPressed: () async {
  //                           btnHandler();
  //                         },
  //                       )),),
  //
  //               ]),
  //                 Padding(
  //                     padding: const EdgeInsets.only(top: 15),
  //                     child: Image.asset(
  //                       "assets/tambola/trophy.gif",
  //                       width: 400,
  //                       height: 180,
  //                       // fit: BoxFit.cover,
  //                     )
  //                 ),
  //                 Container(
  //                     constraints: BoxConstraints.expand(
  //                       height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 300.0,
  //                     ),
  //                     margin: const EdgeInsets.only(top: 0.0),
  //                     child:Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Center(
  //                               child:Padding(
  //                                   padding: EdgeInsets.only(left: 0, right: 0,top: 10),
  //                                   child:Text(
  //                                     "All winners list ",
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .titleSmall!
  //                                         .copyWith(fontWeight: FontWeight.w500),
  //                                   ))
  //                           ),
  //                           Padding(
  //                               padding: EdgeInsets.only(left: 0, right: 0,top: 5),
  //                               child: Divider(
  //                                 color: Colors.amber,
  //                                 height: 1,
  //                                 thickness: 1,
  //                                 indent: 20,
  //                                 endIndent: 20,
  //                               )),
  //                           Expanded(
  //                               child:ListView.builder(
  //                                   scrollDirection: Axis.vertical,
  //                                   padding: const EdgeInsets.all(10),
  //                                   itemCount: tambola_winners_list.length,
  //                                   itemBuilder: (context, index) {
  //                                     return Container(
  //                                       child:
  //                                       Row(
  //                                         mainAxisAlignment: MainAxisAlignment.start,
  //                                         children: [
  //                                           SizedBox(width: 30), // Optional spacing between the containers
  //                                           Padding(
  //                                               padding: const EdgeInsets.only(top: 10,left:10),
  //                                               child:CircleAvatar(
  //                                                 radius: 20.0,
  //                                                 backgroundImage: NetworkImage(
  //                                                     "http://kittyclub.in/uploads/user/"+tambola_winners_list[index].image.toString()),
  //                                                 backgroundColor: Colors.grey,
  //                                               )),
  //                                           SizedBox(width: 30), // Optional spacing between the containers
  //                                           Column(
  //                                               mainAxisAlignment: MainAxisAlignment.center,
  //                                               children: [
  //                                                 Padding(
  //                                             padding: const EdgeInsets.only(top:5,left:15),
  //                                             child:Text(
  //                                               tambola_winners_list[index].username.toString().toUpperCase(),
  //                                               style: TextStyle(
  //                                                 fontSize: 12,
  //                                                 fontWeight: FontWeight.normal,
  //                                                 color: isDarkTheme ? Colors.white :Colors.black,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                                 Padding(
  //                                                   padding: const EdgeInsets.only(top:5,left:15),
  //                                                   child:Text(
  //                                                     tambola_winners_list[index].gameName.toString().toUpperCase(),
  //                                                     style: TextStyle(
  //                                                       fontSize: 10,
  //                                                       fontWeight: FontWeight.w300,
  //                                                       color: isDarkTheme ? Colors.white :Colors.black,
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ]),
  //                                           SizedBox(width: 20), // Optional spacing between the containers
  //                                           Padding(
  //                                             padding: const EdgeInsets.only(top:5,left:15),
  //                                             child:Text(
  //                                               "₹"+tambola_winners_list[index].winningAmount.toString().toUpperCase(),
  //                                               style: TextStyle(
  //                                                 fontSize: 14,
  //                                                 fontWeight: FontWeight.bold,
  //                                                 color: Colors.amber,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //
  //                                     );
  //                                   }
  //                               )),
  //
  //                         ])
  //                 ),
  //
  //
  //               ],
  //             ),
  //           ),
  //         );
  //       }
  //   );
  // }
  static void openTambolaWinnerAleartDailog(
      {required String title,
        required String button_name,
        required BuildContext cxt,
        required VoidCallback btnHandler}
      ){
    showDialog(
        context: cxt,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              width: 300.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   mainAxisSize: MainAxisSize.min,
                  //   children: <Widget>[
                  //     Text(
                  //       title,
                  //       style: TextStyle(
                  //           color: Colors.blueAccent,
                  //           fontSize: 24.0),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 5.0,
                  // ),
                  // Divider(
                  //   color: Colors.white,
                  //   height: 4.0,
                  // ),
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 00,top: 10),
                    child: SizedBox(
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Theme.of(context).primaryColor,
                            primaryColorDark: Theme.of(context).primaryColor,
                          ),
                          child: new  Text(
                            "!!"+title+"!!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image.asset(
                        "assets/tambola/trophy.gif",
                        width: 400,
                        height: 200,
                        // fit: BoxFit.cover,
                      )
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: Text(
                        button_name,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      btnHandler();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  static void openTambolaClaimDailog(
      {required String title,
        required String subtitle,
        required BuildContext cxt,
        required VoidCallback firstRowHandler,
        required VoidCallback middleRowHandler,
        required VoidCallback lastRowHandler,
        required VoidCallback fullTicketRowHandler
      }) {
    showDialog(
        context: cxt,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.only(top: 10.0),

            content: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              width: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 22.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Divider(
                    color: Colors.black,
                    height: 4.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0,top: 10, right: 10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                      children: [
                              Text(
                              "Claim First Row",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12.0),
                            ),
                              Image.asset('assets/tambola/rule_first_line.png',
                                height: 50,
                                width: 150,
                              ),
                      ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20),
                              child:  SizedBox( // <-- SEE HERE
                                  width: 80,
                                  height: 35,
                                  child: ElevatedButton(

                                    child: Text('Claim'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    onPressed: () async {
                                      firstRowHandler();

                                    },
                                  )),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                children: [
                                  Text(
                                    "Claim Middle Row",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.0),
                                  ),
                                  Image.asset('assets/tambola/rule_middle_line.png',
                                    height: 50,
                                    width: 150,
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20),
                              child:  SizedBox( // <-- SEE HERE
                                  width: 80,
                                  height: 35,
                                  child: ElevatedButton(

                                    child: Text('Claim'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    onPressed: () async {
                                      middleRowHandler();
                                    },
                                  )),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                children: [
                                  Text(
                                    "Claim Last Row",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.0),
                                  ),
                                  Image.asset('assets/tambola/rule_last_line.png',
                                    height: 50,
                                    width: 150,
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20),
                              child:  SizedBox( // <-- SEE HERE
                                  width: 80,
                                  height: 35,
                                  child: ElevatedButton(

                                    child: Text('Claim'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    onPressed: () async {
                                   lastRowHandler();
                                    },
                                  )),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                                children: [
                                  Text(
                                    "Claim Full House",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12.0),
                                  ),
                                  Image.asset('assets/tambola/rule_house.png',
                                    height: 50,
                                    width: 150,
                                  ),
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,left: 20),
                              child:  SizedBox( // <-- SEE HERE
                                  width: 80,
                                  height: 35,
                                  child: ElevatedButton(

                                    child: Text('Claim'),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.indigo,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontStyle: FontStyle.normal),
                                    ),
                                    onPressed: () async {
                                     fullTicketRowHandler();
                                    },
                                  )),),
                          ],
                        ),

                        Padding(
                            padding: const EdgeInsets.only(top:0,left: 25,right: 25),
                            child:  SizedBox( // <-- SEE HERE
                                width: 500,
                                height: 10,
                                child:Divider(
                                    color: Colors.black
                                ))),
                      ],
                    )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  static void openShareGameAleartDailog(
      {required String title,
        required String subTitle,
        required String button1,
        required String button2,
        required BuildContext cxt,
        required Color color,
        required VoidCallback copyHandler,
        required VoidCallback shareHandler}
      ){
    showDialog(
          context: cxt,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 24.0),
                        ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:Colors.white,
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        copyHandler();
                      },
                      child: Text(button1),
                    )
                  ],
                ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 4.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        style: TextStyle(color: Colors.blueAccent),
                        decoration: InputDecoration(
                          hintText: subTitle,
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0)),
                        ),
                        child: Text(
                          button2,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      onTap: () {
                        shareHandler();
                      },
                    ),
                  ],
                ),
              ),
            );
    }
    );
  }



  static void showConfirmationAlert(
      {required String title,
      required String subTitle,
      required BuildContext cxt,
      required VoidCallback okHandler}) {
    showDialog(
      context: cxt,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 220,
            width: Get.width,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     SizedBox(
                    //       width: 100,
                    //       height: 40,
                    //       child: BorderButtonType1(
                    //           text: LocalizationString.yes,
                    //           onPress: () {
                    //             Get.back(closeOverlays: true);
                    //             okHandler();
                    //           }),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     SizedBox(
                    //       width: 100,
                    //       height: 40,
                    //       child: FilledButtonType1(
                    //           isEnabled: true,
                    //           text: LocalizationString.no,
                    //           onPress: () {
                    //             Get.back(closeOverlays: true);
                    //           }),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ).hP16,
          ).round(20),
        );
      },
    );
  }

  static void showExitAlert(
      {required String title,
        required String subTitle,
        required BuildContext cxt,
        required VoidCallback okHandler}) {
    showDialog(
      context: cxt,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 220,
            width: Get.width,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     SizedBox(
                    //       width: 100,
                    //       height: 40,
                    //       child: BorderButtonType1(
                    //           text: LocalizationString.yes,
                    //           onPress: () {
                    //             Get.back(closeOverlays: true);
                    //             okHandler();
                    //           }),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     SizedBox(
                    //       width: 100,
                    //       height: 40,
                    //       child: FilledButtonType1(
                    //           isEnabled: true,
                    //           text: LocalizationString.no,
                    //           onPress: () {
                    //             Get.back(closeOverlays: true);
                    //           }),
                    //     ),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ).hP16,
          ).round(20),
        );
      },
    );
  }

  static void showDemoAppConfirmationAlert(
      {required String title,
      required String subTitle,
      required BuildContext cxt,
      required VoidCallback okHandler}) {
    showDialog(
      context: cxt,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            height: 200,
            width: Get.width,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w900)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    // Row(
                    //   children: [
                    //     const Spacer(),
                    //     SizedBox(
                    //       width: 100,
                    //       height: 30,
                    //       child: BorderButtonType1(
                    //           text: LocalizationString.ok,
                    //           onPress: () {
                    //             Get.back(closeOverlays: true);
                    //             okHandler();
                    //           }),
                    //     ),
                    //   ],
                    // ),
                  ],
                )
              ],
            ).p16,
          ).round(20),
        );
      },
    );
  }
}
