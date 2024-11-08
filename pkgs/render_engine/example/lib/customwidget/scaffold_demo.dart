import 'package:flutter/material.dart';
import 'package:render_engine/render_engine.dart';

class PoCSliver extends StatefulWidget {
  const PoCSliver({Key? key}) : super(key: key);

  @override
  State<PoCSliver> createState() => _PoCSliverState();
}

class _PoCSliverState extends State<PoCSliver> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return EngineEvent(
      onFocus: (rect) {},
      onHover: (rect, isHover) {},
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.mic),
          clipBehavior: Clip.antiAlias,
          onPressed: () {},
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomNavigatorBar(
          clipBehavior: Clip.antiAlias,
          notchMargin: 4,
          shape: const CircularNotchedRectangle(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: "Timer",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.approval),
              label: "Approval",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Available seats',
                  style: TextStyle(fontSize: 24),
                ),
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.indigo],
                    ),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {},
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 800,
                color: Colors.yellow.shade300,
                child: const Center(
                  child: HoverToolkit(
                    key: ValueKey('text'),
                    props: {},
                    type: 'text',
                    path: '',
                    group: 'leaf',
                    data: {
                      'type': 'text',
                      'props': {},
                    },
                    child: ColoredBox(
                      color: Colors.pink,
                      child: Text('Hello, World'),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomNavigatorBar extends StatelessWidget {
  int? currentIndex;
  Color? selectedItemColor;
  bool? enableFeedback;
  ValueChanged<int>? onTap;
  List<BottomNavigationBarItem> items;
  Color? backgroundColor;
  Clip clipBehavior;
  double notchMargin;
  NotchedShape? shape;
  CustomNavigatorBar({
    Key? key,
    this.shape,
    this.onTap,
    this.currentIndex,
    this.enableFeedback,
    this.backgroundColor,
    this.selectedItemColor,
    this.notchMargin = 4.0,
    this.clipBehavior = Clip.none,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: clipBehavior,
      notchMargin: notchMargin,
      shape: shape,
      child: SizedBox(
        height: 64,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: backgroundColor ?? Theme.of(context).bottomAppBarTheme.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildItems(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      if (i == items.length / 2 && shape != null) {
        list.add(const Spacer());
      }
      list.add(Expanded(
        key: ValueKey(i),
        child: IconButton(
          color: currentIndex == i ? Colors.white : Colors.grey,
          icon: currentIndex == i ? item.icon : item.icon,
          tooltip: item.label,
          onPressed: () {
            if (onTap != null) onTap!(i);
          },
        ),
      ));
    }
    return list;
  }
}
