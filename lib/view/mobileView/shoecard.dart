import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoeCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String price;

  const ShoeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  _ShoeCardState createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  // State variable to track if the shoe is favorited
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // Get current theme colors
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        width: 170.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(18.sp)),
          border: Border.all(
            color: isDarkMode ? (Colors.grey[700] ?? Colors.grey) : const Color.fromARGB(255, 189, 188, 188),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Shoe Image Container
                Container(
                  width: 160.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[700] : Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),

                // Star Rating Positioned at Top Left
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.white,
                      borderRadius: BorderRadius.circular(6.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.07),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 14.sp,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          '4.5', // You might want to pass this as a parameter too
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14.h),

            // Shoe Title
            Text(
              widget.title,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Shoe Category
            Text(
              widget.category,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
              ),
            ),

            SizedBox(height: 4.h),

            // Price and Wishlist Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes the price to left and icon to right
              children: [
                // Price
                Text(
                  widget.price,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Wishlist Icon Positioned at Bottom Right
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorited = !isFavorited; // Toggle the state
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.sp),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border, // Change icon based on state
                      color: isFavorited ? Colors.redAccent : Colors.grey[400], // Change color based on state
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
