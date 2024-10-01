import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoeCard2 extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String category;
  final String price;

  const ShoeCard2({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.price,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ShoeCard2State createState() => _ShoeCard2State();
}

class _ShoeCard2State extends State<ShoeCard2> {
  // State variable to track if the shoe is favorited
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // Get current theme colors
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    // Calculate constants for width and height
    final double screenHeight = MediaQuery.of(context).size.height;
    final double phoneHeight = screenHeight * 0.9;
    final double phoneWidth = phoneHeight / 2.05;
    final double shoeCardWidth = phoneWidth; // Using phoneWidth
    final double shoeCardHeight = phoneHeight * 0.9; // Using phoneHeight * 0.9

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: shoeCardWidth,
        height: shoeCardHeight,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[800] : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(14)),
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
                  width: shoeCardWidth * 0.95, // Adjusting width for image
                  height: shoeCardHeight * 0.16, // Adjusting height for image
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.grey[700] : Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(widget.imageUrl),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
      
                // Star Rating Positioned at Top Left
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.white,
                      borderRadius: BorderRadius.circular(6),
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
                          size: 12,
                        ),
                        SizedBox(width: 2),
                        Text(
                          '4.5', // You might want to pass this as a parameter too
                          style: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      
            SizedBox(height: 8),
      
            // Shoe Title
            Text(
              widget.title,
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            // Shoe Category
            Text(
              widget.category,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 10,
              ),
            ),
      
      
            // Price and Wishlist Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes the price to left and icon to right
              children: [
                // Price
                Text(
                  widget.price,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
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
                    padding: EdgeInsets.all(6),
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
                      size: 18,
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
