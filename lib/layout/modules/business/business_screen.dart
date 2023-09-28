import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/news_cubit/cubit.dart';
import 'package:news/layout/news_app/news_cubit/steats.dart';

import '../../shared/componants/componants.dart';

class BusinesseScreen extends StatelessWidget {
  const BusinesseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return bulidItemNews(list);
        });
  }
}
