

import 'address.dart';

class Transport{
  String? id;
  String? code;
  String? name;
  String? typeQuantity;
  int quantity = 0;

  double shippingFee = 0.0;
  double total = 0.0;
  double cod = 0.0;
  double mass = 0.0;
  int? statusId;
  int paymentMethod = 0;
  String? transportShippingMethod;
  String? stringStatus;
  String? note;
  String? updateAt;
  String? createAt;


  Address shippingAddress = Address();
  Address billingAddress = Address();



  Transport();

  Transport.fromJson(data){
    id = data['id'].toString();
    code = data['code'];
    name = data['name'];
    quantity = data['quantity'];
    if(data['shipping_fee'] != null){
      shippingFee = double.tryParse(data['shipping_fee'].toString())??0.0;
    }
    if(data['tongtien'] != null){
      total = double.tryParse(data['tongtien'].toString())??0.0;
    }
    if(data['cod'] != null){
      cod = double.tryParse(data['cod'].toString())??0.0;
    }
    if(data['mass'] != null){
      mass = double.tryParse(data['mass'].toString())??0.0;
    }

    if(data['status_code'] != null){
      statusId = data['status_code'];
    }
    else {
      statusId = data['status'];
    }

    stringStatus = data['status'].toString();
    paymentMethod = int.tryParse(data['payment_methods'].toString())??0;
    typeQuantity = data['type_quantity'];

    note = data['note'];
    if(data['transport_shipping_method'] != null){
      transportShippingMethod = data['transport_shipping_method']['name'];
      transportShippingMethod = transportShippingMethod?.replaceAll("</br>", '\n');
    }


    updateAt = data['updated_at'];
    createAt = data['created_at'];
    shippingAddress = Address.fromJsonShipping(data);
    billingAddress = Address.fromJsonBilling(data);

  }

}