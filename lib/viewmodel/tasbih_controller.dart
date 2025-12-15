import 'package:get/get.dart';

class TasbihController extends GetxController {
  // Variabel reaktif (tambahkan .obs)
  var counter = 0.0.obs;
  var progress = 0.0.obs;

  final double maxCount = 33;

  void incrementCounter() {
    if (counter.value < maxCount) {
      counter.value++;
      // Hitung persentase (0-100)
      progress.value = (counter.value / maxCount) * 100;
    }
  }

  void resetCounter() {
    counter.value = 0.0;
    progress.value = 0.0;
  }
}
