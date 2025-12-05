import 'package:flutter/material.dart';
import 'package:budgetin_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Hanya AuthService yang diperlukan
  final auth = AuthService();

  Future<void> loginGoogle() async {
    try {
      // Panggil fungsi sign-in Google dari AuthService
      User? user = await auth.signInWithGoogle();

      if (user != null) {
        // Jika berhasil, navigasi ke home
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/home');
        }
      } else {
        // Jika user membatalkan atau gagal tanpa exception
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Google Sign-in dibatalkan atau gagal.")),
          );
        }
      }
    } catch (e) {
      // Tangani error umum
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Google Sign-in gagal: ${e.toString()}")),
        );
      }
    }
  }

  // Metode dispose tidak diperlukan lagi karena tidak ada Controller
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Budget In")),
      body: Center( // Menggunakan Center karena hanya ada satu tombol
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Selamat Datang di Budget In!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),

              // Tombol Login Google
              OutlinedButton.icon(
                onPressed: loginGoogle,
                icon: const Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
                label: const Text(
                  "Lanjutkan dengan Google",
                  style: TextStyle(fontSize: 18),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}