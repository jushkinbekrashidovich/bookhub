import 'package:bookhubuz/base/base_controller.dart';

class DetailController extends BaseController {
  int _count = 0;

  void setCount(int index) {
    _count = index;
    update();
  }

  int get count => _count;
}
