import 'dart:io';


import 'package:get/get.dart';

import '../utils/shared_prefs.dart';

class ApiParamModel {

  dynamic myEarningsParams(String uid) async {

    return {
      "uid":uid,
    };
  }
  dynamic getTambolaCreateGame(String uid, String game_name,String game_date,String game_time,String game_amount) async {

    return {
      "uid":uid,
      "cat_id":"1",
      "game_name":game_name,
      "game_date":game_date,
      "game_time":game_time,
      "game_amount":game_amount,
    };
  }

  dynamic getTambolaJoinGame(String uid, String game_id) async {

    return {
      "uid":uid,
      "game_id":game_id,
    };
  }

  dynamic getTambolaBuyGameTicket(String uid, String game_id) async {

    return {
      "uid":uid,
      "game_id":game_id,
    };
  }

  dynamic getTambolaMyTicket(String uid, String game_id) async {

    return {
      "uid":uid,
      "game_id":game_id,
    };
  }
  dynamic getTambolaClaim(String uid, String game_id,String ticket_id,String ticket_number,String running_number,String claim_type) async {

    return {
      "uid":uid,
      "game_id":game_id,
      "ticket_id": ticket_id,
      "ticket_number":ticket_number,
      "running_number":running_number,
      "claim_type":claim_type

    };
  }
  dynamic startTambolaGame(String uid, String game_id,String ticket_id) async {

    return {
      "uid":uid,
      "game_id":game_id,
      "ticket_id": ticket_id,
    };
  }

  dynamic getCuurentNoTambolaGame(String uid, String game_id,String ticket_id) async {

    return {
      "uid":uid,
      "game_id":game_id,
      "ticket_id": ticket_id,
    };
  }
  dynamic allTambolaGameList(String uid) async {

    return {
      "uid":uid,
    };
  }

  dynamic getGameClubsCategoryParams() async {

    return {
    };
  }

  dynamic loginRequestParams(String email,String password) async {

    return {
      "email":email,
      "password":password
    };
  }

  dynamic getAllCategoryParams() async {

    return {
    };
  }

  dynamic getHomeMainBannerParams() async {

    return {
    };
  }


  dynamic signUpRequestParams(String fname,String lname,String email,String password,String phone,String userType,String zipcode) async {
    print("signup_data_params:- "+fname+" "+lname+" "+email+" "+password+" "+phone+" userdata:-"+userType+" "+zipcode);

    return {
    "first_name":fname,
    "last_name":lname,
    "email":email,
    "password":password,
    "mobile":phone,
    "user_type":userType,
    "Zip_code":zipcode,
      "social_id":"20",
    "citry":"dehradun",
    };
  }

  dynamic otpVerifyRequestParams(int id,String otp) async {

    return {
      "user_id":id.toString(),
      "otp":otp
    };
  }


  dynamic checkSocailRequestParams(String mobile,String socail_type,String socail_id) async {

    return {
      "phone":mobile,
      "type":socail_type,
      "social_id":socail_id
    };
  }

  dynamic loginSuccessRequestParams(String mobile) async {
    return {
      "phone":mobile,
    };
  }

  dynamic gamesClubCategoriesParams() async {

    return {
    };
  }

  dynamic allGamesClubParams(String cat_id) async {

    return {
      "cat_id":cat_id,
    };
  }

  dynamic getOtpRequestParams(String mobile, String ref_id) async {

    return {
      "phone":mobile,
      "ref": ref_id,
    };
  }

  dynamic getOtpVerifyRequestParams(String mobile, String otp) async {

    return {
      "phone":mobile,
      "otp": otp,
    };
  }

  dynamic getcoinsPaymentRequestParams(String mobile,String amount,String order_id,String payment_id,String p_time) async {

    return {
      "phone":mobile,
      "amount":amount,
      "order_id":order_id,
      "payment_id":payment_id,
      "p_time":p_time
    };
  }


  dynamic getLoginParam(String email, String password) async {
    String? fcmToken = await SharedPrefs().getFCMToken();
    String? voipToken = await SharedPrefs().getVoipToken();

    return {
      "email": email,
      "password": password,
      "device_type": Platform.isAndroid ? '1' : '2',
      "device_token": fcmToken ?? '',
      "device_token_voip_ios": voipToken ?? ''
    };
  }

  dynamic getUpdateTokenParam() async {
    String? fcmToken = await SharedPrefs().getFCMToken();
    String? voipToken = await SharedPrefs().getVoipToken();

    return {
      "device_type": Platform.isAndroid ? '1' : '2',
      "device_token": fcmToken ?? '',
      "device_token_voip_ios": voipToken ?? ''
    };
  }

  dynamic getSocialLoginParam(
      String name, String socialType, String socialId, String email,String phone) async {
    String? fcmToken = await SharedPrefs().getFCMToken();
    String? voipToken = await SharedPrefs().getVoipToken();

    return {
      "name": name,
      "phone": phone,
      "sponcer":"",
      "username": "",
      "social_type": socialType,
      "social_id": socialId,
      "email": email,
      "device_type": Platform.isAndroid ? '1' : '2',
      "device_token": fcmToken ?? '',
      "device_token_voip_ios": voipToken ?? ''
    };
  }

  dynamic getSocialLoginParamNew(
      String name, String socialType, String socialId, String email,String phone,String sponcer) async {
    String? fcmToken = await SharedPrefs().getFCMToken();
    String? voipToken = await SharedPrefs().getVoipToken();

    return {
      "name": name,
      "phone": phone,
      "sponcer":sponcer,
      "username": "",
      "social_type": socialType,
      "social_id": socialId,
      "email": email,
      "device_type": Platform.isAndroid ? '1' : '2',
      "device_token": fcmToken ?? '',
      "device_token_voip_ios": voipToken ?? ''
    };
  }

  dynamic getSignUpParam(String name, String email, String password) async {
    String? fcmToken = await SharedPrefs().getFCMToken();
    String? voipToken = await SharedPrefs().getVoipToken();
    return {
      "username": name,
      "name": name,
      "email": email,
      "password": password,
      "device_type": Platform.isAndroid ? '1' : '2',
      "device_token": fcmToken ?? '',
      "device_token_voip_ios": voipToken ?? ''
    };
  }

  dynamic getForgotPwdParam(
      String email, String countyCode, String phoneNumber) {
    return {
      "verification_with": '1',
      "email": email,
      "country_code": countyCode,
      "phone": phoneNumber
    };
  }

  dynamic getResetPwdParam(String token, String password) {
    return {
      "token": token,
      "password": password,
    };
  }

  dynamic getVerifyOTPParam(String token, String otp) {
    return {
      "otp": otp,
      "token": token,
    };
  }

  dynamic getVerifyChangePhoneOTPParam(String token, String otp) {
    return {
      "otp": otp,
      "verify_token": token,
    };
  }

  dynamic getCheckUsernameParam(String username) {
    return {
      "username": username,
    };
  }

  dynamic getResendOTPParam(String token) {
    return {
      "token": token,
    };
  }

  dynamic getSupportRequestParam(
      String name, String email, String phone, String message) {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "request_message": message
    };
  }

  dynamic getNotificationSettingsParam(
      String likesNotificationStatus, String commentNotificationStatus) {
    return {
      "like_push_notification_status": likesNotificationStatus,
      "comment_push_notification_status": commentNotificationStatus
    };
  }

  dynamic createChatRoomParam(int opponentId) {
    return {"receiver_id": opponentId.toString(), "type": '1'};
  }

  dynamic createGroupChatRoomParam(
      {required String groupName, String? groupDescription, String? image}) {
    return {
      "type": '2',
      'receiver_id': '',
      'title': groupName,
      'image': image ?? '',
      'description': groupDescription ?? ''
    };
  }

  dynamic updateGroupChatRoomParam(
      {String? groupName,
      String? groupDescription,
      String? image,
      String? groupAccess}) {
    Map<String, String> data = {};

    if (groupName != null) {
      data['title'] = groupName;
    }
    if (groupDescription != null) {
      data['description'] = groupDescription;
    }
    if (image != null) {
      data['image'] = image;
    }
    if (groupAccess != null) {
      data['chat_access_group'] = groupAccess;
    }
    return data;
  }

  dynamic createClubParam(
      {required int categoryId,
      required int privacyMode,
      required int isOnRequestType,
      required int enableChatRoom,
      required String name,
      required String image,
      required String description}) {
    return {
      "category_id": categoryId.toString(),
      'privacy_type': privacyMode.toString(),
      'is_request_based': isOnRequestType.toString(),
      'is_chat_room': enableChatRoom.toString(),
      'name': name,
      'image': image,
      'description': description
    };
  }

  dynamic updateClubParam(
      {required int categoryId,
      required int privacyMode,
      required String name,
      required String image,
      required String description}) {
    return {
      "category_id": categoryId.toString(),
      'privacy_type': privacyMode.toString(),
      'name': name,
      'image': image,
      'description': description
    };
  }

  dynamic sendClubInvite({
    required int clubId,
    required String userIds,
    required String message,
  }) {
    return {
      "club_id": clubId.toString(),
      'user_ids': userIds,
      'message': message,
    };
  }

  dynamic sendClubJoinRequest({
    required int clubId,
    required String message,
  }) {
    return {
      "club_id": clubId.toString(),
      'message': message,
    };
  }


  dynamic removeFromClub({
    required int userId,
    required int clubId,
  }) {
    return {
      "club_user_id": userId.toString(),
      'id': clubId.toString(),
    };
  }

  dynamic sendGiftParam(
      {required int giftId,
      required int receiverId,
      required int source,
      required int? liveId,
      required int? postId}) {
    //send_on_type : live call =1, profile=2, post=3
    return {
      "gift_id": giftId.toString(),
      'reciever_id': receiverId.toString(),
      'send_on_type': source.toString(),
      'live_call_id': liveId == null ? '' : liveId.toString(),
      'post_id': postId == null ? '' : postId.toString()
    };
  }

  dynamic sendVerificationRequestParam({
    required String userMessage,
    required String documentType,
    required List<Map<String, String>> images,
  }) {
    return {
      "user_message": userMessage,
      'document': images,
      'document_type': documentType,
    };
  }

  dynamic cancelVerificationRequestParam({
    required int id,
    required String userMessage,
  }) {
    return {
      'user_message': userMessage,
      'id': id.toString(),
    };
  }

  dynamic paymentIntentParam({
    required double amount,
  }) {
    return {
      'amount': amount.toString(),
      'currency': 'USD',
    };
  }

  dynamic submitPaypalPaymentParam({
    required double amount,
    required String nonce,
    required String deviceData,
  }) {
    return {
      'amount': amount.toString(),
      'payment_method_nonce': nonce,
      'device_data': deviceData,
    };
  }
}
