
class TransportHistory{
  int? id;
  String? name;
  String? createdAt;
  String? updateAt;

  TransportHistory.fromJson(data){
    id = data['id'];
    // switch(data['name']){
    //   case '1' : name = 'waiting_get';
    //   break;
    //   case '2': name = 'gotten';
    //   break;
    //   case '3': name = 'shipped';
    //   break;
    //   case '4': name = 'owe_COD';
    //   break;
    //   case '5': name = 'cod_paid';
    //   break;
    //   case '6': name = 'not_ship';
    //   break;
    //   case '7': name = 'canceled';
    //   break;
    //   case '8': name = 'returning';
    //   break;
    //   case '9': name = 'returned';
    //   break;
    //   case '11': name = 'importedVN';
    //   break;
    //   case '12': name = 'exportedVN';
    //   break;
    //   case '13': name = 'importedIn';
    //   break;
    //   case '14': name = 'exportedIn';
    //   break;
    //   case '15': name = 'shipping';
    //   break;
    //   case '16': name = 'savedStorage';
    //   break;
    //   default: name = 'waiting_get';
    // }
    createdAt = data['created_at'];
    updateAt = data['updated_at'];
  }
}