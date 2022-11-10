class Address{
  String? name;
  String? address;
  String? phone;
  String? email;

  Address();

  Address.fromJsonShipping(data){
    name = data['shipping_name'];
    address = data['shipping_address'];
    phone = data['shipping_tel'];
    email = data['shipping_email'];
  }

  Address.fromJsonBilling(data){
    name = data['billing_name'];
    address = data['billing_address'];
    phone = data['billing_tel'];
    email = data['billing_email'];
  }
}