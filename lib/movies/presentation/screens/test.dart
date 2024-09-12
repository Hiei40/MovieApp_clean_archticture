import 'package:flutter/material.dart';
import 'package:movieapp/movies/presentation/screens/movies_screen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const MoviesScreen(),
              ),
            );
          },
          child: const Text("Navigate"),
        ),
      ),
    );
  }
}
