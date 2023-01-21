import 'package:ateam_test/screens/home/view.dart';

abstract class AbstractHomePresenter {
  void onViewAttached(AbstractHomeView view);

  void onViewDetached();
}

class HomePresenter implements AbstractHomePresenter {
  AbstractHomeView? _view;

  HomePresenter();

  @override
  void onViewAttached(AbstractHomeView view) {
    _view = view;
  }

  @override
  void onViewDetached() {
    _view = null;
  }
}
