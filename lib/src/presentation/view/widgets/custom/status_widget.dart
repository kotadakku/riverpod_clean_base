import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StatusWidget extends StatelessWidget {
  final int _status;


  const StatusWidget({
    Key? key,
      required int status
  }) : _status = status,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    late Color _color;
    late String _stringStatus;
    switch(_status){
      case 1: _color = AppColor.statusWait;
        _stringStatus = 'waiting_get';
        break;
      case 2: _color = AppColor.statusGet;
        _stringStatus = 'gotten';
        break;
      case 3: _color = AppColor.statusComplete;
        _stringStatus = 'shipped';
        break;
      case 4: _color = AppColor.statusGet;
      _stringStatus = 'owe_COD';
      break;
      case 5: _color = AppColor.statusComplete;
      _stringStatus = 'cod_paid';
      break;
      case 6: _color = AppColor.statusError;
      _stringStatus = 'not_ship';
        break;
      case 7: _color = AppColor.statusCancel;
      _stringStatus = 'canceled';
      break;
      case 8: _color = AppColor.fillPositive;
      _stringStatus = 'returning';
      break;
      case 9: _color = AppColor.statusCancel;
      _stringStatus = 'returned';
      break;
      case 10: _color = AppColor.statusCancel;
      _stringStatus = 'trouble';
      break;
      case 11: _color = AppColor.statusError;
      _stringStatus = 'importedVN';
      break;
      case 12: _color = AppColor.statusError;
      _stringStatus = 'exportedVN';
      break;
      case 13: _color = AppColor.statusError;
      _stringStatus = 'importedIn';
      break;
      case 14: _color = AppColor.statusError;
      _stringStatus = 'exportedIn';
      break;
      case 15: _color = AppColor.statusError;
      _stringStatus = 'shipping';
      break;
      case 16: _color = AppColor.statusError;
      _stringStatus = 'savedStorage';
      break;
      default: _color = AppColor.statusGet;
      _stringStatus = 'waiting_get';
    }

    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(16)
      ),
      alignment: Alignment.center,
      child: Text(_stringStatus,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: AppColor.backgroundLight,
          fontSize: AppSize.textXs,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
