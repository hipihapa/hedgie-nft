import 'package:flutter/material.dart';
import 'package:nft/resources/resources.dart';

class IntroImageCarousel extends StatefulWidget {
  const IntroImageCarousel({super.key});

  @override
  State<IntroImageCarousel> createState() => _IntroImageCarouselState();
}

class _IntroImageCarouselState extends State<IntroImageCarousel> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 1;
  double _scrollOffset = 0.0;

  final List<String> _images = [Assets.i2, Assets.i1, Assets.i3];
  final List<Color> _backgroundColors = [
    Color(0xFFD973B2),
    Color(0xFFBFB5B2),
    Color(0xFF3B7A3E),
  ];
  static const double itemWidth = 280.0;
  static const double itemMargin = 8.0;
  static const double totalItemWidth = itemWidth + (itemMargin * 2);
  static const double verticalOffset = 30.0;
  static const double minScale = 0.85;
  static const double maxScale = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        final double viewportWidth = MediaQuery.of(context).size.width - 40.0;
        final double centerPosition =
            (totalItemWidth * 1) - (viewportWidth / 2) + (itemWidth / 2);
        _scrollController.animateTo(
          centerPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final double scrollPosition = _scrollController.position.pixels;

    setState(() {
      _scrollOffset = scrollPosition;
    });

    final int newIndex = (scrollPosition / totalItemWidth).round();

    if (newIndex != _currentIndex &&
        newIndex >= 0 &&
        newIndex < _images.length) {
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }

  double _getNormalizedDistance(int index) {
    if (!_scrollController.hasClients) {
      return index == 1 ? 0.0 : 1.0;
    }

    final double viewportWidth = MediaQuery.of(context).size.width - 40.0;
    final double centerX = viewportWidth / 2;

    final double cardCenterX =
        (index * totalItemWidth) + (itemWidth / 2) - _scrollOffset;

    final double distanceFromCenter = (cardCenterX - centerX).abs();
    final double maxDistance = viewportWidth / 2;

    return (distanceFromCenter / maxDistance).clamp(0.0, 1.0);
  }

  double _getVerticalOffset(int index) {
    final double normalizedDistance = _getNormalizedDistance(index);

    return verticalOffset - (2 * verticalOffset * normalizedDistance);
  }

  double _getScale(int index) {
    final double normalizedDistance = _getNormalizedDistance(index);

    return maxScale - ((maxScale - minScale) * normalizedDistance);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            bottom: 6.0,
            left: 10.0,
            right: 10.0,
          ),
          child: SizedBox(
            height: 370,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _images.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final String imagePath = entry.value;
                  final double verticalOffset = _getVerticalOffset(index);
                  final double scale = _getScale(index);

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Transform.translate(
                      offset: Offset(0, verticalOffset),
                      child: Transform.scale(
                        scale: scale,
                        child: Container(
                          width: itemWidth,
                          height: 340,
                          decoration: BoxDecoration(
                            color: _backgroundColors[index],
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),

        // Dot indicator
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_images.length, (index) {
              final bool isActive = _currentIndex == index;
              return Container(
                width: isActive ? 12.0 : 8.0,
                height: isActive ? 12.0 : 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? Colors.transparent : Colors.black,
                  border: isActive
                      ? Border.all(color: Colors.black, width: 1.0)
                      : null,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
