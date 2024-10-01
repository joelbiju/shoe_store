import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_store/view/mobileView/carousals.dart';
import 'package:shoe_store/view/mobileView/shoecard.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  // Initial theme mode: false = light, true = dark
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 12.w),
            child: IconButton(
              icon: const Icon(Icons.menu),
              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
              iconSize: 28.sp,
              onPressed: () {},
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border_outlined),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    iconSize: 28.sp,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    iconSize: 28.sp,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    ),
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                    iconSize: 28.sp,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // search bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      border: Border.all(color: isDarkMode ? (Colors.grey[700] ?? Colors.grey) : const Color.fromARGB(255, 220, 219, 219)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[400],
                          size: 25.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Search Product',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // carousal
                Carousals(),

                SizedBox(height: 20.h),

                // categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      SizedBox(width: 12.w),
                      _categoryButton('All', isDarkMode),
                      SizedBox(width: 8.w),
                      _categoryButton('Running', isDarkMode),
                      SizedBox(width: 8.w),
                      _categoryButton('Sneakers', isDarkMode),
                      SizedBox(width: 8.w),
                      _categoryButton('Casual', isDarkMode),
                      SizedBox(width: 8.w),
                      _categoryButton('Formal', isDarkMode),
                      SizedBox(width: 8.w),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // products grid
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14.h,
                    crossAxisSpacing: 0,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 0.8,
                    children: [
                      ShoeCard(
                        imageUrl: 'assets/shoe1.png',
                        title: 'Nike Air Max 270',
                        category: 'Running',
                        price: '\$149',
                      ),
                      ShoeCard(
                        imageUrl: 'assets/shoe2.png',
                        title: 'Tatum Home Team',
                        category: 'Running',
                        price: '\$127',
                      ),
                      ShoeCard(
                        imageUrl: 'assets/shoe3.png',
                        title: 'Sabrina Max',
                        category: 'Custom Shoes',
                        price: '\$170',
                      ),
                      ShoeCard(
                        imageUrl: 'assets/shoe4.png',
                        title: 'KD Max 270',
                        category: 'Casual',
                        price: '\$139',
                      ),
                      ShoeCard(
                        imageUrl: 'assets/shoe5.png',
                        title: 'Max 270',
                        category: 'Running',
                        price: '\$120',
                      ),
                      ShoeCard(
                        imageUrl: 'assets/shoe6.png',
                        title: 'Jordan Max EP',
                        category: 'Running',
                        price: '\$150',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
              ],
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
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        border: Border.all(
          color: isDarkMode ? (Colors.grey[600] ?? Colors.grey) : const Color.fromARGB(255, 220, 219, 219),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
