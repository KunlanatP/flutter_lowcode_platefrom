import 'package:example/customwidget/scaffold_demo.dart';
import 'package:example/demos/demo_view.dart';
import 'package:example/demos/demos.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(child: Text('Custom Widget')),
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate.fixed([
              ListTile(
                title: const Text('Scaffold'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const PoCSliver();
                    },
                  ));
                },
              )
            ]),
            itemExtent: 50.0,
          ),
          const SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(child: Text('Render Engine')),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) {
                final el = demoList.elementAt(idx);
                return ListTile(
                  key: ValueKey(idx),
                  title: Text(el['title']),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return DemoViewer(
                          data: el['data']!,
                          title: el['title'],
                        );
                      },
                    ));
                  },
                );
              },
              childCount: demoList.length,
            ),
            itemExtent: 50.0,
          )
        ],
      ),
    );
  }
}
