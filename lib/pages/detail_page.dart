import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/app_text_large.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: place.length,
        itemBuilder: (context, index) {
          // DetailState detail = state as DetailState;

          return SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(place[index].placeimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 20.0,
                  right: 20.0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ShowUpAnimation(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                )),
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 310,
                  left: 0,
                  right: 0,
                  bottom: 60,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35.0, horizontal: 30.0),
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowUpAnimation(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextLarge(
                                    text: place[index].placename,
                                    color: Colors.black.withOpacity(0.8)),
                                AppTextLarge(
                                    text: place[index].placeprice,
                                    color: AppColors.mainColor),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          ShowUpAnimation(
                            child: Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: AppColors.mainColor),
                                const SizedBox(width: 5.0),
                                AppText(
                                    text: place[index].placehint,
                                    color: AppColors.mainColor),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ShowUpAnimation(
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(5, (index) {
                                    return Icon(Icons.star,
                                        color: index < place[index].placestars
                                            ? AppColors.starColor
                                            : AppColors.textColor2);
                                  }),
                                ),
                                const SizedBox(width: 8.0),
                                AppText(
                                    text: '(${place[index].placestars}.0)',
                                    color: AppColors.textColor2),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          ShowUpAnimation(
                            child: AppTextLarge(
                              text: 'الافراد',
                              color: Colors.black.withOpacity(0.8),
                              size: 22.0,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          ShowUpAnimation(
                            child: const AppText(
                              text: 'عدد افراد المجموعه',
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Wrap(
                            children: List.generate(5, (index) {
                              return ShowUpAnimation(
                                direction: Direction.horizontal,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: AppButtons(
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      size: 55,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 30.0),
                          ShowUpAnimation(
                            child: AppTextLarge(
                              text: 'الوصف',
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ShowUpAnimation(
                            child: AppText(
                              text: place[index].placedetials,
                              color: AppColors.mainTextColor,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1000.0),
                  child: ShowUpAnimation(
                    child: Row(
                      children: [
                        AppButtons(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_border,
                        ),
                        SizedBox(width: 20.0),
                        ResponsiveButton(isResponsive: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class detials extends StatelessWidget {
  const detials(
      {super.key,
      required this.photo,
      required this.name,
      required this.detalis,
            required this.price,
      required this.star
      });

  final String photo;
  final String name;
  final String detalis;
  final String price;
  final int star;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(children: [
              Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(photo),
                    fit: BoxFit.cover,
                  ),
                ),),
                ShowUpAnimation(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_rounded),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            )),
                        color: Colors.white,
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              
                 Positioned(
                top: 280,
                left: 0,
                right: 0,
                bottom: 60,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 35.0, horizontal: 30.0),
                  width: MediaQuery.of(context).size.width,
                  height: 650,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShowUpAnimation(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextLarge(
                                  text: name,
                                  color: Colors.black.withOpacity(0.8)),
                              AppTextLarge(
                                  text: price,
                                  color: AppColors.mainColor),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        ShowUpAnimation(
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: AppColors.mainColor),
                              const SizedBox(width: 5.0),
                              AppText(
                                  text: name,
                                  color: AppColors.mainColor),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ShowUpAnimation(
                          child: Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,
                                      color: index < place[index].placestars
                                          ? AppColors.starColor
                                          : AppColors.textColor2);
                                }),
                              ),
                              const SizedBox(width: 8.0),
                              AppText(
                                  text: star.toString(),
                                  color: AppColors.textColor2),
                            ],
                          ),
                        ),
                
                      
                        const SizedBox(height: 30.0),
                        ShowUpAnimation(
                          child: AppTextLarge(
                            text: 'الوصف',
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ShowUpAnimation(
                          child: AppText(
                            text:detalis,
                            color: AppColors.mainTextColor,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 600.0,bottom: 20,left: 20,right: 20),
                child: ShowUpAnimation(
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(width: 20.0),
                      ResponsiveButton(isResponsive: true),
                    ],
                  ),
                ),
              ),
          ],)
            
       ); }
        
      
    
  }

