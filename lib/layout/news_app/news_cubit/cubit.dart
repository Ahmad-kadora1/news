import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/modules/business/business_screen.dart';
import 'package:news/layout/modules/science/science_screen.dart';
import 'package:news/layout/modules/sports/sports_screen.dart';
import 'package:news/layout/news_app/news_cubit/steats.dart';

import '../../modules/setting/setting_screen.dart';
import '../../shared/network/remode/dio_halper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
  ];
  List<Widget> screens = [
    BusinesseScreen(),
    SportScreen(),
    ScienceScreen(),
    // SettingScreen()
  ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=80335548d4fd4a6c9bc6ff09d5718932
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLodingState());
    DioHalpe.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '80335548d4fd4a6c9bc6ff09d5718932',
      },
    ).then(
      (value) {
        business = value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLodingState());
    DioHalpe.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '80335548d4fd4a6c9bc6ff09d5718932',
      },
    ).then(
      (value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsGetScienceLodingState());
    DioHalpe.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '80335548d4fd4a6c9bc6ff09d5718932',
      },
    ).then(
      (value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> searsh = [];
  void getsearsh(String v) {
    emit(NewsGetSearshLodingState());
    DioHalpe.getData(
      url: 'v2/everything',
      query: {
        'q': '$v',
        'apikey': '80335548d4fd4a6c9bc6ff09d5718932',
      },
    ).then(
      (value) {
        searsh = value.data['articles'];
        print(searsh[0]['title']);
        emit(NewsGetSearshSuccessState());
      },
    ).catchError((error) {
      print(error.toString());
      emit(NewsGetSearshErrorState(error.toString()));
    });
  }
}
