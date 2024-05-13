import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../bloc/add_note/add_note_bloc.dart';
import '../pages/main_page.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late final TextEditingController titleController;
  late final TextEditingController descController;

  @override
  void initState() {
    titleController = TextEditingController();
    descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan Baru'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: [
          CustomTextField(
            controller: titleController,
            label: 'Judul',
            maxLines: 1,
          ),
          const SpaceHeight(10),
          CustomTextField(
            controller: descController,
            label: 'Deskripsi',
            maxLines: 7,
          ),
        ],
      ),
      bottomNavigationBar: BlocConsumer<AddNoteBloc, AddNoteState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: AppColors.red,
                ),
              );
            },
            loaded: () {
              titleController.clear();
              descController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notes added successfully'),
                  backgroundColor: AppColors.primary,
                ),
              );
              context.pushReplacement(const MainPage());
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Button.filled(
                  onPressed: () {
                    context.read<AddNoteBloc>().add(
                          AddNoteEvent.addNotes(
                            title: titleController.text,
                            description: descController.text,
                          ),
                        );
                  },
                  label: 'Simpan Catatan',
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
