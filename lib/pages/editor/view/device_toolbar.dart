import 'package:device_frame/device_frame.dart';
import 'package:device_frame/src/devices/ios/devices.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:device_frame/device_frame.dart';
import 'package:device_frame/src/devices/ios/devices.dart';
import 'package:flutter/material.dart';

/// A toolbar widget that provides device selection and zoom controls
/// for the device preview frame
class DeviceToolbar extends StatefulWidget {
  static const double kMinZoom = 0.25;
  static const double kMaxZoom = 2.0;
  static const double kZoomIncrement = 0.25;
  static const double kDefaultZoom = 1.0;

  /// Currently selected device for preview
  final DeviceInfo selectedDevice;

  /// Callback when device selection changes
  final void Function(DeviceInfo)? onDeviceChanged;

  /// Current zoom level of the preview
  final double zoomLevel;

  /// Callback when zoom level changes
  final ValueChanged<double> onZoomLevelChanged;

  const DeviceToolbar({
    super.key,
    required this.selectedDevice,
    this.onDeviceChanged,
    this.zoomLevel = kDefaultZoom,
    required this.onZoomLevelChanged,
  });

  @override
  State<DeviceToolbar> createState() => _DeviceToolbarState();
}

class _DeviceToolbarState extends State<DeviceToolbar> {
  static const double _minZoom = 0.25;
  static const double _maxZoom = 2.0;
  static const double _zoomIncrement = 0.25;

  void _handleZoomIn() {
    final newZoom = widget.zoomLevel + _zoomIncrement;
    if (newZoom <= _maxZoom) {
      widget.onZoomLevelChanged(newZoom);
    }
  }

  void _handleZoomOut() {
    final newZoom = widget.zoomLevel - _zoomIncrement;
    if (newZoom >= _minZoom) {
      widget.onZoomLevelChanged(newZoom);
    }
  }

  void _handleFitScreen() {
    widget.onZoomLevelChanged(1.0); // Reset to default zoom
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      height: 64, // Slightly reduced height
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isDark ? Colors.grey[800]!.withOpacity(0.5) : Colors.grey[200]!,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _buildIconGroup([
            _buildToolButton(
              FluentIcons.arrow_undo_20_regular,
              'Undo',
            ),
            _buildToolButton(
              FluentIcons.arrow_redo_20_regular,
              'Redo',
            ),
          ]),
          _buildVerticalDivider(),
          _buildDeviceControls(isDark),
          _buildIconGroup([
            _buildToolButton(
              FluentIcons.zoom_out_20_regular,
              'Zoom Out',
              onTap: _handleZoomOut,
            ),
            Text(
              '${(widget.zoomLevel * 100).toInt()}%',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[700],
                fontSize: 13,
              ),
            ),
            _buildToolButton(
              FluentIcons.zoom_in_20_regular,
              'Zoom In',
              onTap: _handleZoomIn,
            ),
          ]),
          const Spacer(),
          FilledButton.icon(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(FluentIcons.play_20_filled, size: 18),
            label: const Text(
              'Preview',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolButton(IconData icon, String tooltip,
      {VoidCallback? onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              size: 20,
              color: isDark ? Colors.grey[400] : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconGroup(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: children),
    );
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 32,
        width: 1,
        color: Colors.grey[200],
      ),
    );
  }

  Widget _buildDeviceControls(bool isDark) {
    var device = widget.selectedDevice;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            widget.selectedDevice.identifier.platform == TargetPlatform.iOS
                ? Icons.apple
                : Icons.android,
            size: 20,
            color: isDark ? Colors.grey[300] : Colors.grey[700],
          ),
          const SizedBox(width: 8),
          PopupMenuButton<DeviceInfo>(
            initialValue: widget.selectedDevice,
            onSelected: (value) {
              widget.onDeviceChanged?.call(value);
            },
            offset: const Offset(0, 40),
            constraints: const BoxConstraints(
              maxHeight: 400,
              maxWidth: 300,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: isDark ? Colors.grey[850] : Colors.white,
            child: Row(
              children: [
                Text(
                  '${device.name} ${device.screenSize.width} × ${device.screenSize.height}',
                  style: TextStyle(
                    color: isDark ? Colors.grey[300] : Colors.grey[700],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_drop_down,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ],
            ),
            itemBuilder: (context) => [
              ...[...Devices.ios.ios].map((device) {
                return _buildDeviceMenuItem(device, isDark);
              }),
              const PopupMenuDivider(),
              ...[...Devices.ios.android].map((device) {
                return _buildDeviceMenuItem(device, isDark);
              }),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<DeviceInfo> _buildDeviceMenuItem(
    DeviceInfo device,
    bool isDark,
  ) {
    return PopupMenuItem<DeviceInfo>(
      value: device,
      child: Row(
        children: [
          Icon(
            device.identifier.platform == TargetPlatform.iOS
                ? Icons.apple
                : Icons.android,
            size: 18,
            color: isDark ? Colors.grey[300] : Colors.grey[700],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                device.name,
                style: TextStyle(
                  color: isDark ? Colors.grey[300] : Colors.grey[800],
                ),
              ),
              Text(
                '${device.screenSize.width} × ${device.screenSize.height}',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[500] : Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension on IosDevices {
  List<DeviceInfo> get ios => Devices.ios.all;
  List<DeviceInfo> get android => Devices.android.all;
}
