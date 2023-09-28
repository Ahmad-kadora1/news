import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/modules/searsh/searsh.dart';
import 'package:news/layout/news_app/news_cubit/cubit-them.dart';
import 'package:news/layout/news_app/news_cubit/cubit.dart';
import 'package:news/layout/news_app/news_cubit/steats.dart';
import 'package:news/layout/shared/componants/componants.dart';
import 'package:news/layout/shared/network/remode/dio_halper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //  BlocProvider(
        //   create: (BuildContext context) => NewsCubit()
        //     ..getBusiness()
        //     ..getSports()
        //     ..getscience(),
        BlocConsumer<NewsCubit, NewsStates>(
            listener: (context, state) {},
            builder: (BuildContext context, state) {
              var cubit = NewsCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  title: Text('News App'),
                  actions: [
                    IconButton(
                      onPressed: () {
                        navigateTo(context, SearshScreen());
                      },
                      icon: Icon(Icons.search),
                    ),
                    IconButton(
                      icon: Icon(Icons.brightness_4_outlined),
                      onPressed: () {
                        CubitThem.get(context).changNewsMode();
                        myDivider(ca: HexColor('858484'));
                      },
                    ),
                  ],
                ),
                body: cubit.screens[cubit.currentIndex],
                bottomNavigationBar: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomNavBar(index);
                    },
                    items: cubit.bottomItem),
              );
            });
  }
}
