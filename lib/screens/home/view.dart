import 'package:flutter/material.dart';

import 'presenter.dart';

abstract class AbstractHomeView {
  void onShowMessage(String msg);
}

class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements AbstractHomeView {
  final HomePresenter _presenter = HomePresenter();

  @override
  void initState() {
    super.initState();
    _presenter.onViewAttached(this);
  }

  @override
  void dispose() {
    _presenter.onViewDetached();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(),
    );
  }

  @override
  void onShowMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

}
