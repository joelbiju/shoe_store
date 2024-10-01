import 'package:flutter/material.dart';
import 'package:shoe_store/view/webView/web.dart'; // Import the Homeview

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the total screen height
    final double screenHeight = MediaQuery.of(context).size.height;
    // Set the height of the phone based on the screen height (let's say 80% of screen height)
    final double phoneHeight = screenHeight * 0.9;
    // Calculate the width based on the iPhone aspect ratio (19.5:9 or 2.17:1)
    final double phoneWidth = phoneHeight / 2.05;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 39, 210, 179),  // Starting color
              const Color(0xFF752183), // Ending color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: phoneWidth,
            height: phoneHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(40), // Curved corners like iPhone
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // Shadow effect
                ),
              ],
            ),
            child: Stack(
              children: [
                // iPhone screen area
                Positioned(
                  top: phoneHeight * 0.014, // Adjust to make space for notch and borders
                  left: phoneWidth * 0.014,
                  right: phoneWidth * 0.014,
                  bottom: phoneHeight * 0.014,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      color: Colors.white,
                      child: const Web(), // Render the Homeview directly
                    ),
                  ),
                ),

                // Dynamic Island (iPhone 14 Pro style)
                Positioned(
                  left: (phoneWidth - (phoneWidth * 0.35)) / 2, // Center the island horizontally
                  child: Container(
                    width: phoneWidth * 0.35, // Dynamic Island width (30% of the phone width)
                    height: 33, // Height of the Dynamic Island
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
