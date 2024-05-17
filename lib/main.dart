import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Papeleria Diego 0460',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor:
            const Color(0xfffffdd0), // Color de fondo amarillo claro
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/DDOrozco17/Img_FlutterFlow_IOS_6J/main/ImgDiaz/CuadernosArgollados.png",
    "https://raw.githubusercontent.com/DDOrozco17/Img_FlutterFlow_IOS_6J/main/ImgDiaz/CuadernosGrapados.png",
    "https://raw.githubusercontent.com/DDOrozco17/Img_FlutterFlow_IOS_6J/main/ImgDiaz/Folder.png",
    "https://raw.githubusercontent.com/DDOrozco17/Img_FlutterFlow_IOS_6J/main/ImgDiaz/MarcadoresVinilo.png",
    "https://raw.githubusercontent.com/DDOrozco17/Img_FlutterFlow_IOS_6J/main/ImgDiaz/PapelImpresora.png",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffffdd0), // Color de fondo amarillo claro
      appBar: AppBar(
        backgroundColor:
            const Color(0xffd4af37), // Color de la barra de aplicación dorado
        title: const Text(
          "Papeleria Diego 0460",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator(),
            const Text(
              "Prueba nuestra variedad de colores",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black), // Texto en negro
            )
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 0; i < imgList.length; i++)
        Container(
          margin: const EdgeInsets.all(5),
          height: i == _currentPage ? 7 : 5,
          width: i == _currentPage ? 7 : 5,
          decoration: BoxDecoration(
              color: i == _currentPage
                  ? const Color(
                      0xffffffff) // Color del indicador de la página seleccionada blanco
                  : const Color(
                      0xffefd807), // Color del indicador de la página no seleccionada dorado claro
              shape: BoxShape.circle),
        )
    ]);
  }
}
