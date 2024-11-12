import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../states/page/page_state.dart';
import '../../error/error_page.dart';
import '../view/device_preview.dart';
import '../view/device_toolbar.dart';
import '../view/editor_config.dart';
import '../view/empty_page.dart';

class MainContentArea extends ConsumerStatefulWidget {
  const MainContentArea({super.key});

  @override
  ConsumerState<MainContentArea> createState() => _MainContentAreaState();
}

class _MainContentAreaState extends ConsumerState<MainContentArea> {
  DeviceInfo selectedDevice = Devices.ios.iPhone13;
  double _currentZoom = 1.0;

  void onDeviceChanged(DeviceInfo device) {
    setState(() {
      selectedDevice = device;
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = EditorConfig.of(context).data;
    final data = ref.watch(pageList);

    return data.when(
      data: (data) {
        if (data == null || data.isEmpty) {
          return Expanded(
              child: EmptyContentPage(
            appID: config.appID,
            device: selectedDevice,
            isFrameVisible: true,
            orientation: Orientation.portrait,
            zoomLevel: _currentZoom,
          ));
        }

        return Column(
          children: [
            DeviceToolbar(
              selectedDevice: selectedDevice,
              onDeviceChanged: onDeviceChanged,
              zoomLevel: _currentZoom,
              onZoomLevelChanged: (newZoom) {
                setState(() {
                  _currentZoom = newZoom;
                });
              },
            ),
            Preview(
              device: selectedDevice,
              isFrameVisible: true,
              orientation: Orientation.portrait,
              zoomLevel: _currentZoom * 100,
            ),
          ],
        );
      },
      error: (error, stackTrace) => const ErrorNotFound(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
