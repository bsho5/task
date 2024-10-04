import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(width.toString()),
          _PageView(),
        ],
      )),
    );
  }
}

List<String> images = [
  "images/trees.png",
  "images/water.png",
  "images/city.png",
  "images/trees.png",
  "images/water.png",
  "images/city.png",
  "images/trees.png",
  "images/water.png",
  "images/city.png",
  "images/trees.png",
  "images/water.png",
  "images/city.png",
];

class _PageView extends StatelessWidget {
  _PageView();

  @override
  Widget build(BuildContext context) {
    int screenWidth = MediaQuery.of(context).size.width.toInt() - 160;
    int count = (screenWidth / 258).toInt();
    double gridWidth = (screenWidth / count) - 16;
    //width < 1200 && width > 600 ?4 : width < 600 && width > 300?2 : width < 300 ?1 : 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            crossAxisCount: count, crossAxisSpacing: 16, mainAxisSpacing: 20, height: 322.0, width: gridWidth),
        itemCount: images.length,
        itemBuilder: (context, index) => InkWell(
          child: Container(
            width: gridWidth,
            height: 322,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              // image: DecorationImage(image: AssetImage("images/image.png"),fit: BoxFit.cover,)
            ),
            child: Column(
              children: [
                SizedBox(
                  width: gridWidth,
                  height: 182,
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.cover,
                            height: 182,
                            width: gridWidth,
                          )),
                      Container(
                        width: gridWidth,
                        height: 182,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color.fromRGBO(23, 23, 23, 1)],
                          ),
                        ),
                      ),
                      Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black.withOpacity(0.5)),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ),
                          )),
                      Positioned(
                          left: 20,
                          bottom: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color.fromRGBO(174, 85, 47, 1).withOpacity(0.1),
                                border: Border.all(color: const Color.fromRGBO(174, 85, 47, 1))),
                            child: const Row(
                              children: [
                                Text(
                                  "Pending Approval",
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  width: gridWidth,
                  height: 140,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                    color: Color.fromRGBO(23, 23, 23, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Item Title",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.fade,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("icons/calendar.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Jan 16 - Jan 20, 2024",
                              style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: Colors.white54,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.white,
                                        image: DecorationImage(image: AssetImage("images/image_1.png"))),
                                  ),
                                  Positioned(
                                    left: 8.5,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.white,
                                          image: DecorationImage(image: AssetImage("images/image_2.png"))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "4 unfinshed Tasks",
                              style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight extends SliverGridDelegate {
  /// Creates a delegate that makes grid layouts with a fixed number of tiles in
  /// the cross axis.
  ///
  /// All of the arguments must not be null. The `mainAxisSpacing` and
  /// `crossAxisSpacing` arguments must not be negative. The `crossAxisCount`
  /// and `childAspectRatio` arguments must be greater than zero.
  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight({
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.height = 56.0,
    this.width = 56.0,
  })  : assert(crossAxisCount > 0),
        assert(mainAxisSpacing >= 0),
        assert(crossAxisSpacing >= 0),
        assert(height > 0),
        assert(height > 0);

  /// The number of children in the cross axis.
  final int crossAxisCount;

  /// The number of logical pixels between each child along the main axis.
  final double mainAxisSpacing;

  /// The number of logical pixels between each child along the cross axis.
  final double crossAxisSpacing;

  /// The height of the crossAxis.
  final double height;

  /// The width of the crossAxis.
  final double width;

  bool _debugAssertIsValid() {
    assert(crossAxisCount > 0);
    assert(mainAxisSpacing >= 0.0);
    assert(crossAxisSpacing >= 0.0);
    assert(height > 0.0);
    assert(width > 0.0);
    return true;
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    assert(_debugAssertIsValid());
    final double childCrossAxisExtent = width;
    final double childMainAxisExtent = height;
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: childMainAxisExtent + mainAxisSpacing,
      crossAxisStride: childCrossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: childMainAxisExtent,
      childCrossAxisExtent: childCrossAxisExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight oldDelegate) {
    return oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.height != height ||
        oldDelegate.width != width;
  }
}
