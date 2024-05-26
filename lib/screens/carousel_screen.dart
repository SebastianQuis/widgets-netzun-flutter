import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class CarouselScreen extends StatefulWidget {

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int activeIndex = 0;

  final List<String> listImages = [
    'https://images.freeimages.com/images/large-previews/d4f/www-1242368.jpg',
    'https://images.freeimages.com/images/large-previews/636/holding-a-dot-com-iii-1411477.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(

      body: SafeArea(
        child: Container(
          // color: Colors.grey,
          height: 500,
          child: Column(
            children: [
              
              SizedBox(height: 30,),

              CarouselSlider(
                          
                items: listImages
                  .map((url) => 
                    CustomImage( url))
                    .toList(),
                options: CarouselOptions(
                  // disableCenter: true,
                  enlargeCenterPage: true, // solo se vea 1 en todo
                  enableInfiniteScroll: false, // hijos exactos
                  // enlargeCenterPage: true,
                  // reverse: false,
                  height: size.height *0.39,
                  pageSnapping: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.linear,
                  autoPlayInterval: Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),



              SizedBox(height: 20,),


              AnimatedSmoothIndicator(
                activeIndex: activeIndex, 
                count: listImages.length,
                effect:  SlideEffect(
                  radius:  10.0,  
                  dotWidth:  20.0,  
                  dotHeight:  20.0,  
                  paintStyle:  PaintingStyle.fill,  
                  strokeWidth:  1.2, 
                ),  
              ),





            ],
          ),
        ),
      ),
   );
  }
}


class CustomImage extends StatelessWidget {
  final String urlImage;
  CustomImage(this.urlImage);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      // color: Colors.red,
      child: Image(
        // color: Colors.red,
        // height: double.infinity,
        // width: double.infinity,
        fit: BoxFit.cover,
        image: NetworkImage(urlImage)
      ),
    );
  }
}