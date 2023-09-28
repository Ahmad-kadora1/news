import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_app/news_cubit/cubit-them.dart';
import 'package:news/layout/news_app/news_cubit/cubit.dart';
import 'package:news/layout/news_app/news_cubit/steats.dart';
import 'package:news/layout/shared/network/local/cash_helper.dart';
import 'package:news/layout/shared/network/remode/dio_halper.dart';

import 'layout/news_app/news_layout.dart';
import 'layout/news_app/steatstheam.dart';
import 'layout/shared/observer.dart';
import 'layout/shared/them.dart';

//https://newsapi.org/v2/everything?q=tesla&apiKey=80335548d4fd4a6c9bc6ff09d5718932
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHalpe.init();
  await CashHelper.init();
  bool? isdark = CashHelper.getdata(key: 'isdark');
  runApp(MyApp(isdark ?? false));
}

class MyApp extends StatelessWidget {
  final bool isdark;
  MyApp(this.isdark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getscience(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                CubitThem()..changNewsMode(frommod: isdark)),
      ],
      child: BlocConsumer<CubitThem, NewsStatesThem>(
        listener: (BuildContext context, state) {
          // if (state is NewsChangeModeState) {}
        },
        builder: (BuildContext context, Object? state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: LightThem,
            darkTheme: DarkThem,
            themeMode: CubitThem.get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: NewsLayout()),
      ),
    );
  }
}
