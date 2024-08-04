import 'package:flutter/widgets.dart';

class FlutterNativeSplash {
  static void preserve({required WidgetsBinding widgetsBinding}) {
    // Dapatkan status rendering pertama kali (first frame)
    bool firstFrameRendered = false;

    // Tambahkan listener untuk mendeteksi perubahan status rendering
    widgetsBinding.addPostFrameCallback((_) {
      // Setel status rendering pertama kali menjadi true setelah rendering pertama kali selesai
      firstFrameRendered = true;
    });

    // Tambahkan listener untuk mendeteksi perubahan status aplikasi
    widgetsBinding.addPersistentFrameCallback((_) {
      // Tampilkan splash screen jika status rendering pertama kali sudah true
      if (firstFrameRendered) {
        // Tampilkan splash screen di sini
        // Contoh: Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
}
});
}
}