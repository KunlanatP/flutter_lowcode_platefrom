import 'package:flutter/material.dart';
import 'package:flutter_lowcode_plateform/models/application/apps_model.dart';
import 'package:flutter_lowcode_plateform/states/home/app_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAppDialog extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController versionController;
  final TextEditingController bundleController;
  final TextEditingController descController;
  final String selectedPlatform;
  final Function(String) onPlatformChanged;

  const CreateAppDialog({
    required this.nameController,
    required this.versionController,
    required this.bundleController,
    required this.descController,
    required this.selectedPlatform,
    required this.onPlatformChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Create New Application',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            _buildInputField(
              controller: nameController,
              label: 'Application Name (Optional)',
              icon: Icons.apps,
              context: context,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: versionController,
              label: 'Version',
              icon: Icons.numbers,
              context: context,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: bundleController,
              label: 'Bundle Identifier (Optional)',
              icon: Icons.folder,
              context: context,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: descController,
              label: 'Description',
              icon: Icons.description,
              context: context,
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedPlatform,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_drop_down,
                      color: Theme.of(context).primaryColor),
                  items: const [
                    DropdownMenuItem(
                        value: 'mobile', child: Text('Mobile App')),
                    DropdownMenuItem(value: 'web', child: Text('Web App')),
                    DropdownMenuItem(
                        value: 'desktop', child: Text('Desktop App')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      onPlatformChanged.call(value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Add creation logic here
                    var newApp = AppModel.create(
                      name: nameController.text,
                      version: versionController.text,
                      bundle: bundleController.text,
                      desc: descController.text,
                      platform: selectedPlatform,
                    );
                    ref
                        .read(appController)
                        .createApplication(newApp)
                        .then(
                          (value) => Navigator.pop(context),
                        )
                        .onError(
                          (error, stackTrace) => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    Text(error.toString()), // แสดงข้อความ error
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // ปิด dialog
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                  },
                  child: const Text('Create Application'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          icon: Icon(icon, color: Theme.of(context).primaryColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
