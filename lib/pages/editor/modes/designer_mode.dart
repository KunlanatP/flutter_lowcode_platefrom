// import 'package:device_frame/device_frame.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../layouts/left_sidebar.dart';

// class DesignerMode extends ConsumerStatefulWidget {
//   final Color primaryBlue;
//   final Color lightBlue;

//   const DesignerMode({
//     super.key,
//     required this.primaryBlue,
//     required this.lightBlue,
//   });

//   @override
//   ConsumerState<DesignerMode> createState() => _DesignerModeState();
// }

// class _DesignerModeState extends ConsumerState<DesignerMode> {
//   DeviceInfo defaultScreen = Devices.ios.iPhone13Mini;
//   double zoomLevel = 100;
//   bool isFrameVisible = false;
//   Orientation orientation = Orientation.portrait;

//   @override
//   Widget build(BuildContext context) {
//     // final router = VRouter.of(context);
//     // final appID = router.pathParameters['appID'];
//     // final pageID = router.queryParameters['page'];

//     // if (appID == null) {
//     //   VRouter.of(context).to('/error/404');
//     // }

//     // ref.read(pageController).fetchPages('', appID!);
//     // ref.read(pageController).fetchPagesByID(
//     //       pageID,
//     //       QueryByApp(appId: appID),
//     //     );

//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (HardwareKeyboard.instance.isControlPressed) {
//           if (event.logicalKey == LogicalKeyboardKey.equal) {
//             setState(() {
//               zoomLevel = (zoomLevel + 25).clamp(25, 200);
//             });
//           } else if (event.logicalKey == LogicalKeyboardKey.minus) {
//             setState(() {
//               zoomLevel = (zoomLevel - 25).clamp(25, 200);
//             });
//           }
//         }
//       },
//       child: Row(
//         children: [
//           // Left Sidebar with Icon-only Tabs in a 48x48 Container
//           LeftSidebar(primaryBlue: widget.primaryBlue),

//           Expanded(
//             child: Column(
//               children: [
//                 Container(
//                   height: 48,
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   decoration: BoxDecoration(
//                     color: widget.lightBlue.withOpacity(0.1),
//                     border: Border(
//                         bottom: BorderSide(
//                             color: widget.primaryBlue.withOpacity(0.1))),
//                   ),
//                   child: Row(
//                     children: [
//                       PopupMenuButton<DeviceInfo>(
//                         offset: const Offset(0, 40),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 12, vertical: 6),
//                           decoration: BoxDecoration(
//                             color: widget.primaryBlue.withOpacity(0.1),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Icon(Icons.devices,
//                                   size: 20, color: widget.primaryBlue),
//                               const SizedBox(width: 8),
//                               Text(
//                                 defaultScreen.name,
//                                 style: TextStyle(
//                                   color: widget.primaryBlue,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               Icon(Icons.expand_more,
//                                   size: 20, color: widget.primaryBlue),
//                             ],
//                           ),
//                         ),
//                         itemBuilder: (context) => [
//                           PopupMenuItem(
//                             value: Devices.ios.iPhone13,
//                             child: _buildDeviceMenuItem(
//                               icon: Icons.phone_iphone,
//                               label: 'iPhone 13',
//                               isSelected: defaultScreen == Devices.ios.iPhone13,
//                             ),
//                           ),
//                           PopupMenuItem(
//                             value: Devices.ios.iPhone13Mini,
//                             child: _buildDeviceMenuItem(
//                               icon: Icons.phone_iphone,
//                               label: 'iPhone 13 Mini',
//                               isSelected:
//                                   defaultScreen == Devices.ios.iPhone13Mini,
//                             ),
//                           ),
//                           PopupMenuItem(
//                             value: Devices.android.mediumPhone,
//                             child: _buildDeviceMenuItem(
//                               icon: Icons.android,
//                               label: 'Android Phone',
//                               isSelected:
//                                   defaultScreen == Devices.android.mediumPhone,
//                             ),
//                           ),
//                         ],
//                         onSelected: (device) =>
//                             setState(() => defaultScreen = device),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: Icon(Icons.rotate_90_degrees_ccw,
//                             color: widget.primaryBlue),
//                         onPressed: () {
//                           setState(() {
//                             orientation = orientation == Orientation.portrait
//                                 ? Orientation.landscape
//                                 : Orientation.portrait;

//                             if (isFrameVisible) {
//                               if (orientation == Orientation.landscape) {
//                                 zoomLevel = zoomLevel / 2;
//                               } else {
//                                 zoomLevel = zoomLevel;
//                               }
//                             }
//                           });
//                         },
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon:
//                                 Icon(Icons.zoom_out, color: widget.primaryBlue),
//                             onPressed: () {
//                               setState(() {
//                                 zoomLevel = (zoomLevel - 25).clamp(25, 200);
//                               });
//                             },
//                           ),
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Text(
//                               '${zoomLevel.toInt()}%',
//                               style: TextStyle(
//                                 color: widget.primaryBlue,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           IconButton(
//                             icon:
//                                 Icon(Icons.zoom_in, color: widget.primaryBlue),
//                             onPressed: () {
//                               setState(() {
//                                 zoomLevel = (zoomLevel + 25).clamp(25, 200);
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                       IconButton(
//                         icon: Icon(
//                             isFrameVisible
//                                 ? Icons.phone_iphone
//                                 : Icons.app_blocking,
//                             color: widget.primaryBlue),
//                         tooltip: isFrameVisible
//                             ? 'Hide device frame'
//                             : 'Show device frame',
//                         onPressed: () {
//                           setState(() {
//                             isFrameVisible = !isFrameVisible;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Canvas
//                 Expanded(
//                   child: Container(
//                     color: Colors.grey.shade300,
//                     padding: const EdgeInsets.all(40),
//                     child: Center(
//                       child: Transform.scale(
//                           scale: zoomLevel /
//                               100, // Convert percentage to scale factor
//                           child: (isFrameVisible)
//                               ? DeviceFrame(
//                                   device: defaultScreen,
//                                   isFrameVisible: isFrameVisible,
//                                   orientation: orientation,
//                                   screen: Container(
//                                     color: Colors.white,
//                                     child: const Center(
//                                       child: Text('Mobile Preview Canvas'),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   width: orientation == Orientation.portrait
//                                       ? defaultScreen.screenSize.width - 56
//                                       : defaultScreen.screenSize.height - 180.5,
//                                   height: orientation == Orientation.portrait
//                                       ? defaultScreen.screenSize.height - 180.5
//                                       : defaultScreen.screenSize.width - 56,
//                                   color: Colors.white,
//                                   child: const Center(
//                                     child: Text('Mobile Preview Canvas'),
//                                   ),
//                                 )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Right Sidebar
//           Container(
//             width: 100,
//             color: widget.primaryBlue.withValues(alpha: 0.1),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Icon(Icons.settings, color: widget.primaryBlue),
//                 const SizedBox(height: 20),
//                 Icon(Icons.analytics, color: widget.primaryBlue),
//                 const SizedBox(height: 20),
//                 IconButton(
//                   icon: Icon(Icons.rotate_90_degrees_ccw,
//                       color: widget.primaryBlue),
//                   onPressed: () {
//                     setState(() {
//                       orientation = orientation == Orientation.portrait
//                           ? Orientation.landscape
//                           : Orientation.portrait;
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDeviceMenuItem({
//     required IconData icon,
//     required String label,
//     required bool isSelected,
//   }) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//       decoration: BoxDecoration(
//         color: isSelected
//             ? widget.primaryBlue.withOpacity(0.1)
//             : Colors.transparent,
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, size: 18, color: widget.primaryBlue),
//           const SizedBox(width: 12),
//           Text(
//             label,
//             style: TextStyle(
//               color: widget.primaryBlue,
//               fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
