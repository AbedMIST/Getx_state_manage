import 'package:get/get.dart';

class HomePageController extends GetxController {

  // final count = 0.obs;         //making it observable
  final count = Rx<int>(0);
  increment() => count.value++;
}