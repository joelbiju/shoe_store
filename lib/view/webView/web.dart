import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_store/view/mobileView/carousals.dart';
import 'package:shoe_store/view/webView/shoecard2.dart';

// ignore: must_be_immutable
class Web extends StatefulWidget {
  const Web({super.key});

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {

  // Initial theme mode: false = light, true = dark
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {

    // Get the total screen height
    final double screenHeight = MediaQuery.of(context).size.height;
    // Set the height of the phone based on the screen height (let's say 80% of screen height)
    final double phoneHeight = screenHeight * 0.9;
    // Calculate the width based on the iPhone aspect ratio (19.5:9 or 2.17:1)
    final double phoneWidth = phoneHeight / 2.05;



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? _darkTheme : _lightTheme,
      home: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: IconButton(
              icon: const Icon(Icons.menu),
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 14.h),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    ),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    onPressed: () {
                      // Toggle between dark and light mode
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        body: SafeArea(
          child: SizedBox(
            width: phoneWidth,
            height: phoneHeight,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        border: Border.all(color: isDarkMode ? (Colors.grey[700] ?? Colors.grey) : const Color.fromARGB(255, 220, 219, 219)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Search Product',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  //carousel
                  Carousals(),

                  const SizedBox(height: 15),

                  //categories
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      _categoryButton('All', isDarkMode),
                      SizedBox(width: 8),
                      _categoryButton('Running', isDarkMode),
                      SizedBox(width: 8),
                      _categoryButton('Sneakers', isDarkMode),
                      SizedBox(width: 8),
                      _categoryButton('Casual', isDarkMode),
                      SizedBox(width: 8),
                      _categoryButton('Formal', isDarkMode),
                      SizedBox(width: 8),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                //products
                GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.78,
                    children: [
                      ShoeCard2(
                        imageUrl: 'assets/shoe1.png',
                        title: 'Nike Air Max 270',
                        category: 'Running',
                        price: '\$149',
                      ),
                      ShoeCard2(
                        imageUrl: 'assets/shoe2.png',
                        title: 'Tatum Home Team',
                        category: 'Running',
                        price: '\$127',
                      ),
                      ShoeCard2(
                        imageUrl: 'assets/shoe3.png',
                        title: 'Sabrina Max',
                        category: 'Custom Shoes',
                        price: '\$170',
                      ),
                      ShoeCard2(
                        imageUrl: 'assets/shoe4.png',
                        title: 'KD Max 270',
                        category: 'Casual',
                        price: '\$139',
                      ),
                      ShoeCard2(
                        imageUrl: 'assets/shoe5.png',
                        title: 'Max 270',
                        category: 'Running',
                        price: '\$120',
                      ),
                      ShoeCard2(
                        imageUrl: 'assets/shoe6.png',
                        title: 'Jordan Max EP',
                        category: 'Running',
                        price: '\$150',
                      ),
                    ],
                  ),

                  SizedBox(height: 20),


                ],
              ),
            ),
          ),
        ),
      ),
      

    );
  }

  // Light theme
  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );

  // Dark theme
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
  );

  // Category button widget helper
  Widget _categoryButton(String label, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(
          color: isDarkMode ? (Colors.grey[600] ?? Colors.grey) : const Color.fromARGB(255, 220, 219, 219),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}