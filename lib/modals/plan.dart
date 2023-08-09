import 'package:e_plaza_vendor/screens/plan_details/controller.dart';
import 'package:expandable/expandable.dart';

import '../utils/const.dart';

class Plan {
  bool expanded = false;

  ExpandableController controller = ExpandableController();
  String planType = PlanType.Quarterly;

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


  Plan({this.id,
      this.name,
      this.quarterlyPrice,
      this.yearlyPrice,
      this.yearlyPriceDiscount,
      this.yearlyOff,
      this.facilities,
  });

  Plan.fromJson(dynamic json) {
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