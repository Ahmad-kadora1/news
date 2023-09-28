import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_app/news_cubit/cubit.dart';
import 'package:news/layout/news_app/news_cubit/steats.dart';
import 'package:news/layout/shared/componants/componants.dart';

class SearshScreen extends StatelessWidget {
  var searshcontrolar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, state) {
        var list = NewsCubit.get(context).searsh;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defultfromfild(
                  onchange: (value) {
                    NewsCubit.get(context).getsearsh(value);
                  },
                  controller: searshcontrolar,
                  type: TextInputType.text,
                  fin1: (String value) {},
                  valdidate: (value) {
                    if (value!.isEmpty) {
                      return 'searsh must not be empty';
                    }
                    return null;
                  },
                  text: 'Searsh',
                  prfix: Icons.search_sharp,
                  radius: 20.0,
                ),
              ),
              Expanded(
                child: bulidItemNews(list, isSearsh: true),
              ),
            ],
          ),
        );
      },
      listener: (BuildContext context, state) {},
    );
  }
}
