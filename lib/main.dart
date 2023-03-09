import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Viewer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = Directory("assets/")
      .listSync()
      .map((image) => image.path)
      .where((image) => image.endsWith(".jpg"))
      .toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 500) {
            return Center(
              child: slideViewer(context, images, 1.0, 0.5),
            );
          } else if (constraints.maxWidth < 1000) {
            return Center(
              child: slideViewer(context, images, 0.4, 0.2),
            );
          } else {
            return Center(
              child: slideViewer(context, images, 0.35, 0.175),
            );
          }
        },
      ),
    );
  }
}

Swiper slideViewer(
    context, List<String> images, double viewportFraction, double scale) {
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Image.asset(images[index]);
    },
    itemCount: images.length,
    viewportFraction: viewportFraction,
    scale: scale,
  );
}
