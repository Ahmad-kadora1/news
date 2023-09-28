import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_app/steatstheam.dart';
import 'package:news/layout/shared/network/local/cash_helper.dart';

class CubitThem extends Cubit<NewsStatesThem> {
  CubitThem() : super(NewsInitialState());
  static CubitThem get(context) => BlocProvider.of(context);

  bool isdark = false;

  void changNewsMode({bool? frommod}) {
    if (frommod != null) {
      isdark = frommod;
      emit(NewsChangeModeState());
    } else {
      isdark = !isdark;
      CashHelper.putdata(key: 'isdark', value: isdark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
