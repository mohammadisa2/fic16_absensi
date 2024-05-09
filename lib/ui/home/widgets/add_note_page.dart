import 'package:flutter/material.dart';

import '../../../core/core.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final descController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Baru'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          CustomTextField(
            controller: descController,
            label: 'Deskripsi',
            maxLines: 7,
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Button.filled(
          onPressed: () {
            context.pop();
          },
          label: 'Simpan Catatan',
        ),
      ),
    );
  }
}
