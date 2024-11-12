// ignore_for_file: unused_element

import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/focus_indicator/focus_state.dart';
import '../../../states/canvas/canvas_controller.dart';
import 'editor_config.dart';

class Preview extends ConsumerStatefulWidget {
  final DeviceInfo device;
  final bool isFrameVisible;
  final Orientation orientation;
  final double zoomLevel;

  const Preview({
    super.key,
    required this.device,
    required this.isFrameVisible,
    required this.orientation,
    required this.zoomLevel,
  });

  @override
  ConsumerState<Preview> createState() => _PreviewState();
}

class _PreviewState extends ConsumerState<Preview> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    ref.read(canvasController).dispose();
    super.didChangeDependencies();
  }

  void _onFocusRequest(PointerEnterEvent detail) {}

  void _onKeyPress(KeyEvent event) {}

  @override
  Widget build(BuildContext context) {
    final config = EditorConfig.of(context).data;

    ref.read(canvasController).init(config.appID, config.pageID);
    ref.read(canvasController).fetchLastContent(config.appID, config.pageID);
    debugPrint('rebuild:_PreviewState');

    return DevicePreview(
      device: widget.device,
      isFrameVisible: widget.isFrameVisible,
      orientation: widget.orientation,
      zoomLevel: widget.zoomLevel,
    );
  }
}

class DevicePreview extends ConsumerWidget {
  final DeviceInfo device;
  final bool isFrameVisible;
  final Orientation orientation;
  final double zoomLevel;

  const DevicePreview({
    super.key,
    required this.device,
    required this.isFrameVisible,
    required this.orientation,
    required this.zoomLevel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(canvasNotifier);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(focusState.notifier).refresh();
    });

    return data.when(
      data: (data) {
        return Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.all(70),
            child: Center(
              child: Transform.scale(
                scale: zoomLevel / 100,
                child: isFrameVisible
                    ? DeviceFrame(
                        device: device,
                        isFrameVisible: isFrameVisible,
                        orientation: orientation,
                        screen: _buildPreviewContent(),
                      )
                    : _buildPreviewWithoutFrame(),
              ),
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }

  Widget _buildPreviewContent() {
    return Container(
      color: Colors.white,
      child: Center(
        child: _buildContent(),
      ),
    );
  }

  Text _buildContent() => const Text('Mobile Preview Canvas');

  Widget _buildPreviewWithoutFrame() {
    return Container(
      width: orientation == Orientation.portrait
          ? device.screenSize.width - 56
          : device.screenSize.height - 180.5,
      height: orientation == Orientation.portrait
          ? device.screenSize.height - 180.5
          : device.screenSize.width - 56,
      color: Colors.white,
      child: Center(
        child: _buildContent(),
      ),
    );
  }
}
