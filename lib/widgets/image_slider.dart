// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final List<String> urlImages;
  const ImageSlider({
    Key? key,
    required this.urlImages,
  }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  // index
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    aspectRatio() {
      double screenWidth = MediaQuery.of(context).size.width;
      if (screenWidth < 1366) {
        return 9 / 11;
      } else if (screenWidth < 500) {
        return 9 / 13;
      } else {
        return 9 / 16;
      }
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth < 500 ? 500 : null,
      child: CarouselSlider.builder(
        options: CarouselOptions(
            aspectRatio: aspectRatio(),
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) => setState(
                  (() => activeIndex = index),
                )),
        itemCount: widget.urlImages.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = widget.urlImages[index];
          return buildImage(urlImage, index);
        },
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => SizedBox(
        child: Image.asset(
          urlImage,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.urlImages.length,
      effect: const SlideEffect(dotHeight: 10, dotWidth: 10));
}
