import 'package:ateam_test/utils/color_constants.dart';
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

  int currentFloor = 0;
  List availableFloors = [3, 2, 1, 0, -1];
  List selectedFloors = [];
  double _bottomPadding = 65.0;
  Duration _duration = const Duration(seconds: 5);

  _buttonClick(int index) {
    setState(() {
      selectedFloors.add(availableFloors[index]);
      int gap = availableFloors.length - index - 1;
      _bottomPadding = gap * 65.0;
      if (index == availableFloors.length - 1) {
        _duration = const Duration(seconds: 5);
      } else {
        _duration = Duration(seconds: gap * 5);
      }
    });
  }

  _onAnimationEnd() {
    setState(() {});
  }

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
      backgroundColor: ColorConstants.colorMap[700],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Row(
      children: [
        Column(
          children: [
            _currentFloor(),
            Expanded(child: Center(child: _floorAnimation())),
          ],
        ),
        const SizedBox(width: 10),
        Expanded(child: _floorButtons()),
      ],
    );
  }

  Widget _floorAnimation() {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            availableFloors.length,
                (index) {
              return Container(
                height: 60,
                width: 40,
                margin: const EdgeInsets.only(bottom: 5.0),
                decoration: BoxDecoration(color: ColorConstants.black.withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("${availableFloors[index]}", style: const TextStyle(color: ColorConstants.white, fontSize: 20))),
              );
            },
          ),
        ),
        AnimatedPositioned(
          duration: _duration,
          bottom: _bottomPadding,
          onEnd: () => _onAnimationEnd(),
          child: Container(
            height: 60,
            width: 40,
            margin: const EdgeInsets.only(bottom: 5.0),
            decoration: BoxDecoration(color: ColorConstants.black.withOpacity(0.3), borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }

  Widget _floorButtons() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: ColorConstants.colorMap[200], borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 20, width: 20, decoration: BoxDecoration(color: ColorConstants.colorMap[400], borderRadius: BorderRadius.circular(100))),
                Container(
                    height: 20, width: 20, decoration: BoxDecoration(color: ColorConstants.colorMap[400], borderRadius: BorderRadius.circular(100))),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    availableFloors.length,
                        (index) {
                      return InkWell(
                        onTap: () => _buttonClick(index),
                        child: Container(
                          width: 90,
                          height: 90,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(color: ColorConstants.colorMap[400], borderRadius: BorderRadius.circular(100)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: selectedFloors.contains(availableFloors[index]) ? ColorConstants.green : ColorConstants.black,
                                    width: selectedFloors.contains(availableFloors[index]) ? 3.0 : 1.0),
                                borderRadius: BorderRadius.circular(100)),
                            child:
                            Center(child: Text("${availableFloors[index]}", style: const TextStyle(fontSize: 40, color: ColorConstants.black))),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 20, width: 20, decoration: BoxDecoration(color: ColorConstants.colorMap[400], borderRadius: BorderRadius.circular(100))),
                Container(
                    height: 20, width: 20, decoration: BoxDecoration(color: ColorConstants.colorMap[400], borderRadius: BorderRadius.circular(100))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentFloor() {
    return Container(
      width: 70,
      height: 50,
      decoration: BoxDecoration(color: ColorConstants.black, borderRadius: BorderRadius.circular(10)),
      child: Center(child: Text("$currentFloor", style: const TextStyle(fontSize: 40, color: ColorConstants.green))),
    );
  }

  @override
  void onShowMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

