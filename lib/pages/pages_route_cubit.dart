import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/menu_items.dart';

class PagesRoute extends Cubit<PageGeneral> {
  PagesRoute() : super(HomePage());

  void selection(PageGeneral page) => emit(page);
}
