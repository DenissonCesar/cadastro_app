import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

   @override  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    late Animation<double> _fadeAnimation;

    @override
    void initState() {
      super.initState();

      _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        );

      _fadeAnimation = CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
        );

      _controller.forward();

      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, AppRoutes.register);
      });
    }  

    @override
    void dispose() {
      _controller.dispose();
      super.dispose;
    
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                SizedBox(height: 20),
                Text(
                  'Cadastro App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                CircularProgressIndicator(color: Colors.white),
              ],
            ),
          ),
          ),
      );
    }
  }

 
