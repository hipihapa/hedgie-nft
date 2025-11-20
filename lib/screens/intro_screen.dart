import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft/components/intro_image_carousel.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:nft/resources/resources.dart';
import 'package:nft/screens/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const IntroImageCarousel(),

                SizedBox(height: 30),

                Text(
                  "Find, Collect and Sell",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Amazing NFTs",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  textAlign: TextAlign.center,
                  "Explore the top collection of NFT's and",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "buy and sell your NFTs as well",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                // Swipe button
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: SwipeButton.expand(
                    thumbPadding: const EdgeInsets.all(4),
                    thumb: const Icon(Icons.lock_outlined, color: Colors.white),
                    activeThumbColor: Colors.black,
                    activeTrackColor: Colors.grey[500],
                    borderRadius: BorderRadius.circular(30),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80.0, right: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                      
                          Image.asset(Assets.right, width: 14, height: 14),
                        ],
                      ),
                    ),
                    onSwipe: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
