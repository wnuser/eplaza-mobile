import 'package:expandable/expandable.dart';

class Subscription {
  String? id;
  String? vendorId;
  String? planId;
  String? billingId;
  String? startDate;
  String? endDate;
  String? isPlanExpired;
  String? createdAt;
  String? updatedAt;
  SubscriptionPlan? subscriptionPlan;
  SubscriptionBilling? subscriptionBilling;

  Subscription();

  Subscription.fromJson(dynamic json) {
    id = json['id'].toString();
    vendorId = json['vendor_id'].toString();
    planId = json['plan_id'].toString();
    billingId = json['billing_id'].toString();
    startDate = json['start_date'].toString();
    endDate = json['end_date'].toString();
    isPlanExpired = json['is_plan_expired'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
    subscriptionPlan = json['subscription_plan'] != null
        ? SubscriptionPlan.fromJson(json['subscription_plan'])
        : null;
    subscriptionBilling = json['subscription_billing'] != null
        ? SubscriptionBilling.fromJson(json['subscription_billing'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['plan_id'] = planId;
    map['billing_id'] = billingId;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['is_plan_expired'] = isPlanExpired;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (subscriptionPlan != null) {
      map['subscription_plan'] = subscriptionPlan?.toJson();
    }
    if (subscriptionBilling != null) {
      map['subscription_billing'] = subscriptionBilling?.toJson();
    }
    return map;
  }
}

class SubscriptionBilling {
  String? id;
  String? vendorId;
  String? planId;
  String? purchaseDate;
  String? purchaseTime;
  String? planPrice;
  String? discountPrice;
  String? totalBillingAmount;
  String? duration;
  String? createdAt;
  String? updatedAt;

  SubscriptionBilling();

  SubscriptionBilling.fromJson(dynamic json) {
    id = json['id'].toString();
    vendorId = json['vendor_id'].toString();
    planId = json['plan_id'].toString();
    purchaseDate = json['purchase_date'].toString();
    purchaseTime = json['purchase_time'].toString();
    planPrice = json['plan_price'].toString();
    discountPrice = json['discount_price'].toString();
    totalBillingAmount = json['total_billing_amount'].toString();
    duration = json['duration'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['vendor_id'] = vendorId;
    map['plan_id'] = planId;
    map['purchase_date'] = purchaseDate;
    map['purchase_time'] = purchaseTime;
    map['plan_price'] = planPrice;
    map['discount_price'] = discountPrice;
    map['total_billing_amount'] = totalBillingAmount;
    map['duration'] = duration;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class SubscriptionPlan {
  String? id;
  String? name;
  String? quarterlyPrice;
  String? yearlyPrice;
  String? yearlyPriceDiscount;
  String? yearlyOff;
  String? facilities;
  String? isEplazaFullDelivery;
  String? status;
  String? createdAt;
  String? updatedAt;

  bool expanded = false;

  ExpandableController controller = ExpandableController();

  SubscriptionPlan();

  SubscriptionPlan.fromJson(dynamic json) {
    id = json['id'].toString();
    name = json['name'].toString();
    quarterlyPrice = json['quarterly_price'].toString();
    yearlyPrice = json['yearly_price'].toString();
    yearlyPriceDiscount = json['yearly_price_discount'].toString();
    yearlyOff = json['yearly_off'].toString();
    facilities = json['facilities'].toString();
    isEplazaFullDelivery = json['is_eplaza_full_delivery'].toString();
    status = json['status'].toString();
    createdAt = json['createdAt'].toString();
    updatedAt = json['updatedAt'].toString();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['quarterly_price'] = quarterlyPrice;
    map['yearly_price'] = yearlyPrice;
    map['yearly_price_discount'] = yearlyPriceDiscount;
    map['yearly_off'] = yearlyOff;
    map['facilities'] = facilities;
    map['is_eplaza_full_delivery'] = isEplazaFullDelivery;
    map['status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
