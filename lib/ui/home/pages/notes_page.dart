import 'package:fic16_absensi/ui/home/bloc/get_note/get_note_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../widgets/add_note_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void initState() {
    // context.read<AddNoteBloc>().add(const AddNoteEvent.getNotes());
    context.read<GetNoteBloc>().add(const GetNoteEvent.getNotes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: BlocBuilder<GetNoteBloc, GetNoteState>(
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: Text("A"),
                );
              },
              error: (message) {
                return Center(
                  child: Text(message),
                );
              },
              empty: () {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.emptyState.image(),
                    const Text(
                      'Saat ini catatan kosong. Anda akan melihat daftar catatan pada bagian ini',
                      textAlign: TextAlign.center,
                    ),
                    const SpaceHeight(100.0),
                  ],
                );
              },
              loaded: (data) {
                final length = data.notes!.length;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    var notes = data.notes![index];
                    // print(notes.title);
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: SingleChildScrollView(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: notes.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '\n\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                    TextSpan(
                                      text: notes.note,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            maxLines: 5,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: notes.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: '\n\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: notes.note,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SpaceHeight(10.0),
                  itemCount: length,
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Button.filled(
          onPressed: () {
            context.push(const AddNote());
          },
          label: 'Tambah Catatan',
        ),
      ),
    );
  }
}
