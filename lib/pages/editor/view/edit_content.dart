// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../layouts/left_sidebar.dart';
import '../../../layouts/right_sidebar.dart';
import '../canvas/main_canvas_area.dart';
import 'pointer_event.dart';

class EditContent extends StatefulWidget {
  final Color primaryBlue;
  final Color lightBlue;

  const EditContent({
    super.key,
    required this.primaryBlue,
    required this.lightBlue,
  });

  @override
  State<EditContent> createState() => _EditContentState();
}

class _EditContentState extends State<EditContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Expanded(
          child: Row(
            children: [
              const LeftSidebar(),
              // Main Content Area
              const Expanded(
                child: DeSelectWidget(
                  child: MainContentArea(),
                ),
              ),
              // Properties Panel
              RightSidebar(
                primaryBlue: widget.primaryBlue,
                lightBlue: widget.lightBlue,
              )
            ],
          ),
        ),
      ],
    );
  }
}
