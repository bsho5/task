import 'package:flutter/gestures.dart';
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
        const Items(),
            const Items(),
                const Items(),
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
                  : screenWidth>450? Row(
                      children: [
                        const SizedBox(width: 40.0),
                        SvgPicture.asset("icons/menu.svg", semanticsLabel: 'Acme Logo'),
                        const SizedBox(width: 10.0),
                      ],
                    ) : Row(
                      children: [
                        const SizedBox(width: 10.0),
                        SvgPicture.asset("icons/menu.svg", semanticsLabel: 'Acme Logo',width: 20,),
                        const SizedBox(width: 10.0),
                      ],
                    ),
             screenWidth<450? SvgPicture.asset("icons/logo.svg", semanticsLabel: 'Acme Logo',width:  60,):SvgPicture.asset("icons/logo.svg", semanticsLabel: 'Acme Logo',),
            ],
          ),
          title: screenWidth > 1000
              ? const TabBar(
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.label,
                  
                  indicatorColor: Color.fromRGBO(255, 194, 104, 1),
                  tabs: [
                    Tab(height: 76, text: 'Items'),
                    Tab(height: 76, text: 'Pricing'),
                    Tab(height: 76, text: 'Info'),
                    Tab(height: 76, text: 'Tasks'),
                    Tab(height: 76, text: 'Analytics'),
                  ],
                )
              : const SizedBox(),
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
          titleSpacing:screenWidth < 450 ?5: 100,
          automaticallyImplyLeading: false,
          leadingWidth:screenWidth < 450 ?100: 170,
        ),
        backgroundColor: Colors.black,
        body: TabBarView(
          children: _tabs,
          physics: NeverScrollableScrollPhysics(),
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
      int screenWidth = MediaQuery.of(context).size.width.toInt();
    return Container(
      height: 76,
      child:  Padding(
        padding: EdgeInsets.only(right:screenWidth>450? 80.0 : 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                 screenWidth>450?  _VerticalDivider() : SizedBox(),
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
     int screenWidth = MediaQuery.of(context).size.width.toInt();
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white, image: const DecorationImage(image: AssetImage("images/image_1.png"))),
        ),
        const SizedBox(
          width: 12,
        ),
       screenWidth > 450? const Text(
          "John Doe",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
        ):const SizedBox()
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
     int screenWidth = MediaQuery.of(context).size.width.toInt();
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: SvgPicture.asset("icons/settings.svg", semanticsLabel: 'Acme Logo'),
        ),
         SizedBox(
          width:screenWidth<450?12: 22,
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
     int screenWidth = MediaQuery.of(context).size.width.toInt();
    return  Row(
      children: [
        SizedBox(
           width:screenWidth<450?5: 22,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: const VerticalDivider(
            thickness: 0.2,
            color: Colors.white54,
            width: 0.2,
          ),
        ),
        SizedBox(
          width:screenWidth<450?5: 22,
        ),
      ],
    );
  }
}
