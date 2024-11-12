import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';

// Modern light theme colors
const kModernLight = Color(0xFFFFFFFF); // Pure white background
const kModernPrimary = Color(0xFF6366F1); // Vibrant indigo
const kModernAccent = Color(0xFF0EA5E9); // Sky blue
const kModernText = Color(0xFF0F172A); // Slate dark
const kModernSubtle = Color(0XFFDCE2E8); // Slate light

class AppCard extends StatefulWidget {
  final AppModel app;
  const AppCard({required this.app, super.key});

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(begin: 0, end: isHovered ? 1 : 0),
        builder: (context, double value, child) {
          return Transform.scale(
            scale: 1 + (0.02 * value),
            child: Container(
              width: 280,
              height: 320,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: kModernLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: kModernPrimary.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
                border: Border.all(
                  color: Color.lerp(
                    kModernSubtle,
                    kModernPrimary,
                    value,
                  )!,
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kModernPrimary.withOpacity(0.1),
                          kModernAccent.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.apps_rounded,
                      size: 42,
                      color: Color.lerp(kModernPrimary, kModernAccent, value),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    widget.app.name,
                    style: const TextStyle(
                      color: kModernText,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: kModernSubtle,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'v${widget.app.version}',
                      style: TextStyle(
                        color: kModernText.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
