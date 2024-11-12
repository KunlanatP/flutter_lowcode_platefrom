import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/layouts/navbar_toolbar.dart';
import 'package:flutter_lowcode_plateform/states/home/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vrouter/vrouter.dart';

import '../../models/query/query.dart';
import '../../states/page/page_state.dart';
import '../error/error_page.dart';
import 'view/edit_content.dart';
import 'view/editor_config.dart';

const Color primaryBlue = Color(0xFF2563EB);
const Color lightBlue = Color(0xFFEFF6FF);

class PageEditor extends ConsumerWidget {
  const PageEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = VRouter.of(context);
    final appID = router.pathParameters['appID'];
    final pageID = router.queryParameters['page'];
    if (appID == null) {
      return const ErrorNotFound();
    }

    ref.read(pageController).fetchPages('', appID);
    ref.read(pageController).fetchPagesByID(
          pageID,
          QueryByApp(appId: appID),
        );

    return EditorPagePreview(
      appID: appID,
      pageID: pageID,
    );
  }
}

class EditorPagePreview extends ConsumerStatefulWidget {
  const EditorPagePreview({
    super.key,
    required this.appID,
    required this.pageID,
  });

  final String appID;
  final String? pageID;

  @override
  ConsumerState<EditorPagePreview> createState() => _EditorPagePreviewState();
}

class _EditorPagePreviewState extends ConsumerState<EditorPagePreview> {
  int _selectedToggleIndex = 1;

  @override
  void didChangeDependencies() {
    ref.read(appController).init();
    ref.read(pageController).init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final page = ref.watch(editorConfigData);
    return EditorConfig(
      key: ValueKey(widget.pageID),
      data: EditorConfigData(appID: widget.appID, pageID: page?.pageID),
      child: Scaffold(
        backgroundColor: lightBlue,
        body: Stack(
          children: [
            Expanded(
              child: IndexedStack(
                index: _selectedToggleIndex,
                children: const [
                  Center(
                    child: Text(
                      'Home Content',
                      style: TextStyle(fontSize: 24, color: primaryBlue),
                    ),
                  ),
                  EditContent(
                    primaryBlue: primaryBlue,
                    lightBlue: lightBlue,
                  ),
                  Center(
                    child: Text(
                      'Settings Content',
                      style: TextStyle(fontSize: 24, color: primaryBlue),
                    ),
                  )
                ],
              ),
            ),
            Navbar(
              modes: ToggleButtons(
                borderColor: Colors.transparent,
                selectedBorderColor: primaryBlue,
                selectedColor: Colors.white,
                fillColor: primaryBlue,
                color: primaryBlue,
                isSelected: [
                  _selectedToggleIndex == 0,
                  _selectedToggleIndex == 1,
                  _selectedToggleIndex == 2,
                ],
                onPressed: (int index) {
                  setState(() {
                    _selectedToggleIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(30),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.home),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.edit),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(Icons.settings),
                  ),
                ],
              ),
              menus: [
                IconButton(
                  icon: const Icon(Icons.logout, color: primaryBlue),
                  onPressed: () {
                    Navigator.of(context).pop(); // Go back to the home page
                  },
                  tooltip: 'Logout',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
