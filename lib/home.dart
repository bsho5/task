import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  final List<Widget> _tabs = [
    const Items(),
  ];

  @override
  Widget build(BuildContext context) {
    int screenWidth = MediaQuery.of(context).size.width.toInt();
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              screenWidth > 1000
                  ? const SizedBox(width: 80.0)
                  : Row(
                      children: [
                        SizedBox(width: 40.0),
                        SvgPicture.asset("icons/menu.svg", semanticsLabel: 'Acme Logo'),
                        SizedBox(width: 10.0),
                      ],
                    ),
              SvgPicture.asset("icons/logo.svg", semanticsLabel: 'Acme Logo'),
            ],
          ),
          title: screenWidth > 1000
              ? TabBar(
                  indicatorWeight: 3,
                  indicatorColor: Color.fromRGBO(255, 194, 104, 1),
                  tabs: [
                    Tab(height: 76, text: 'Items'),
                    Tab(height: 76, text: 'Pricing'),
                    Tab(height: 76, text: 'Info'),
                    Tab(height: 76, text: 'Tasks'),
                    Tab(height: 76, text: 'Analytics'),
                  ],
                )
              : SizedBox(),
          actions: const [
            _AppBar(),
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white54, border: Border(bottom: BorderSide(color: Colors.white54, width: 0.2))),
              )),
          backgroundColor: Colors.black,
          centerTitle: true,
          toolbarHeight: 76,
          titleSpacing: 100,
          automaticallyImplyLeading: false,
          leadingWidth: 170,
        ),
        backgroundColor: Colors.black,
        body: TabBarView(
          children: _tabs,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: const Padding(
        padding: EdgeInsets.only(right: 80.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  _VerticalDivider(),
                  _Buttons(),
                  _VerticalDivider(),
                  _Info(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white, image: DecorationImage(image: AssetImage("images/image_1.png"))),
        ),
        const SizedBox(
          width: 12,
        ),
        const Text(
          "John Doe",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset("icons/settings.svg", semanticsLabel: 'Acme Logo'),
        ),
        const SizedBox(
          width: 22,
        ),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset("icons/notifications.svg", semanticsLabel: 'Acme Logo'),
        )
      ],
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 22,
        ),
        VerticalDivider(
          thickness: 0.2,
          color: Colors.white54,
          width: 0.2,
        ),
        SizedBox(
          width: 22,
        ),
      ],
    );
  }
}
