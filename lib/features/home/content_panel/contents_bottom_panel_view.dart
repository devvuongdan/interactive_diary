import 'package:flutter/material.dart';
import 'package:interactive_diary/features/home/content_panel/widgets/content_card_view.dart';
import 'package:nartus_ui_package/dimens/dimens.dart';
import 'package:nartus_ui_package/nartus_ui.dart';

class ContentsBottomPanelController extends ChangeNotifier {
  bool _visible = false;

  void show() {
    _visible = true;
    notifyListeners();
  }

  void dismiss() {
    _visible = false;
    notifyListeners();
  }
}

class ContentsBottomPanelView extends StatefulWidget {
  final ContentsBottomPanelController controller;

  const ContentsBottomPanelView({required this.controller, Key? key})
      : super(key: key);

  @override
  State<ContentsBottomPanelView> createState() =>
      _ContentsBottomPanelViewState();
}

class _ContentsBottomPanelViewState extends State<ContentsBottomPanelView>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _draggedHeight = ValueNotifier<double>(0.0);
  final GlobalKey _initialHeight = GlobalKey();

  double minHeight = 0;

  // to animate initial bottom content
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    // initial offset is 100% below actual y position
    begin: const Offset(0.0, 1.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(
      () {
        if (widget.controller._visible == true) {
          _draggedHeight.value = 0;
          // start animation
          _controller.forward();
        } else {
          // revert animation
          _controller.reverse();
        }
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      // This height value is the initial height when the list height is 0
      minHeight = _initialHeight.currentContext?.size?.height ?? 0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        key: _initialHeight,
        decoration: const BoxDecoration(
          color: NartusColor.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(NartusDimens.padding24),
              topRight: Radius.circular(NartusDimens.padding24)),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // handler
                GestureDetector(
                  onVerticalDragUpdate: (DragUpdateDetails details) {
                    double height = _draggedHeight.value;
                    height -= (details.primaryDelta ?? details.delta.dy);

                    if (height <= constraints.maxHeight - minHeight &&
                        height >= 0) {
                      _draggedHeight.value = height;
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: NartusColor.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(NartusDimens.padding24),
                          topRight: Radius.circular(NartusDimens.padding24)),
                    ),
                    alignment: Alignment.center,
                    height: 8 /* padding top */ +
                        2 /* divider height */ +
                        16 /* padding bottom */,
                    child: Divider(
                      color: NartusColor.grey,
                      indent: (MediaQuery.of(context).size.width - 48) / 2,
                      endIndent: (MediaQuery.of(context).size.width - 48) / 2,
                      thickness: 2,
                    ),
                  ),
                ),
                // location view
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                  child: LocationView(
                    address:
                        'Shop 11, The Strand Arcade, 412-414 George St, Sydney NSW 2000, Australia',
                    latitude: 1.0,
                    longitude: 1.0,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                ValueListenableBuilder<double>(
                  valueListenable: _draggedHeight,
                  builder:
                      (BuildContext context, double value, Widget? child) =>
                          SizedBox(
                    height: value,
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return const Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: ContentCardView(screenEdgeSpacing: 16),
                          );
                        },
                        itemCount: 10,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
