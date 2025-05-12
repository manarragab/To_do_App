import 'package:get/get.dart';
import 'package:to_do_app/core/enums/enums.dart';
import 'package:to_do_app/features/home/presentation/widget/custom_card.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  void onTap(int index) {
    currentIndex = index;
    update();

    switch (index) {
      case 0:
        print("all");
        break;
      case 1:
   CustomCard(status: Status.values[index].name,);

        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
}
