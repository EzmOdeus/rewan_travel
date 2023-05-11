import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/app_text_large.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": " رحلات منطاد",
    "hiking.png": "تسلق",
    "kayaking.png": "تجديف",
    "snorkling.png": "غطس ",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: SafeArea(
        child: 
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowUpAnimation(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 32.0,
                            color: Colors.black45,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage('img/man.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: ShowUpAnimation(
                        child: const AppTextLarge(text: 'استكشاف')),
                  ),
                  const SizedBox(height: 40.0),
                  ShowUpAnimation(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding:
                            const EdgeInsets.only(left: 20.0, right: 20.0),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        controller: _tabController,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: const CircleTabIndicator(
                            color: AppColors.mainColor, radius: 4),
                        tabs: const [
                          Tab(text: 'الاماكن'),
                          Tab(text: 'تجارب'),
                          Tab(text: 'تقيمات'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    height: 310,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: place.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ShowUpAnimation(
                              direction: Direction.horizontal,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => detials(name: place[index].placename,detalis: place[index].placedetials,
                                      photo:   place[index].placeimage,price: place[index].placeprice,star: place[index].placestars, ),
                                      ));
                                },
                                child: Container(
                                  width: 200,
                                  margin: const EdgeInsets.only(
                                      right: 15.0, top: 20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image:
                                          AssetImage(place[index].placeimage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        bottom: 15,
                                        left: 10,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              size: 20,
                                              text: place[index].placename,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(height: 5.0),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                  size: 14.0,
                                                ),
                                                const SizedBox(width: 2.0),
                                                AppText(
                                                  text: place[index].placehint,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  size: 12.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const Text('inspiration tab'),
                        const Text('emotions tab'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: ShowUpAnimation(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          AppTextLarge(text: 'الانشطة', size: 22.0),
                          AppText(text: 'الكل', color: AppColors.textColor1),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: double.maxFinite,
                    height: 120,
                    margin: const EdgeInsets.only(left: 20.0),
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ShowUpAnimation(
                          direction: Direction.horizontal,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'img/${images.keys.elementAt(index)}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                AppText(
                                    text: images.values.elementAt(index),
                                    color: AppColors.textColor2),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ,
        ),
      )
    ;
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
