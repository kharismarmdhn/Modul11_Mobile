import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodel/tasbih_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi Controller
    final TasbihController controller = Get.put(TasbihController());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145), // Warna Hijau
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TEXT COUNTER (Dibungkus Obx)
              Obx(
                () => Text(
                  '${controller.counter.value.round()}',
                  style: const TextStyle(
                    fontSize: 150,
                    color: Colors.white,
                  ), // Ukuran font disesuaikan
                ),
              ),

              // PROGRESS BAR (Dibungkus Obx)
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value:
                        controller.progress.value /
                        100, // Konversi 0-100 ke 0.0-1.0
                    backgroundColor: Colors.white54,
                    color: Colors.amberAccent.shade400,
                    minHeight: 15,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 75),

              // TOMBOL SIDIK JARI
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap:
                      controller.incrementCounter, // Panggil fungsi controller
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(30),
                    child: const Icon(
                      Icons.fingerprint,
                      size: 100,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // TOMBOL RESET
      floatingActionButton: FloatingActionButton(
        onPressed: controller.resetCounter, // Panggil fungsi reset
        backgroundColor: Colors.white,
        child: const Icon(Icons.refresh_outlined, color: Colors.black),
      ),
    );
  }
}
