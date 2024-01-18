import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:safety_companion/utils/safe_webview.dart';
import 'package:safety_companion/utils/text.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.3,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: List.generate(
              imageSliders.length,
              (index) => Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (index == 0) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  url:
                                      "https://www.nsc.org/community-safety/safety-topics/emergency-preparedness/fire-safety"));
                        } else if (index == 1) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  url:
                                      "https://www.worldpackers.com/articles/simple-travel-safety-tips"));
                        } else if (index == 2) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  url:
                                      "https://www.healthline.com/health/womens-health/self-defense-tips-escape"));
                        } else if (index == 3) {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  url:
                                      "https://www.webmd.com/first-aid/features/tip-sheet-what-to-keep-in-your-first-aid-kit"));
                        } else {
                          navigateToRoute(
                              context,
                              SafeWebView(
                                  url:
                                      "https://www.nationwide.com/lc/resources/emergency-preparedness/articles/catastrophe-preparation"));
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageSliders[index]),
                            )),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                              ])),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 8, left: 8),
                              child: Text(
                                articleTitle[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
