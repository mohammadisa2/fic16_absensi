import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../widgets/add_note_page.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = [
      "First note",
      "Second note",
      "Third note",
    ];
    const notes = [
      'Quisque in turpis vel lectus varius lacinia. Vestibulum quis erat ac dolor maximus aliquet. Fusce lacinia tempor risus luctus venenatis. Duis vel maximus dolor. Mauris eu tortor finibus, finibus ipsum vitae, condimentum lacus. Maecenas at sem vel sem luctus cursus in vel ligula. Nulla sed leo tellus. Cras nec pretium purus, non posuere turpis. Proin nec nunc ante. In condimentum ipsum vel consequat iaculis. Praesent et eros efficitur, lacinia augue sed, faucibus ante. Maecenas vehicula eu massa id pellentesque. Mauris nec felis id justo commodo iaculis vitae mattis ipsum.\n\nQuisque sodales imperdiet sem, eget gravida tortor laoreet nec. Morbi semper eros sit amet sapien placerat, non bibendum arcu tincidunt. Etiam et purus quis justo finibus efficitur. In a urna eget dui posuere pharetra. Nunc feugiat gravida viverra. Etiam libero justo, placerat sed nisi quis, dapibus condimentum elit. Morbi in felis vel mauris semper lobortis at vitae eros.  Morbi in felis vel mauris semper lobortis at vitae eros. ',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget mauris aliquet, rutrum est sed, ultricies lacus. Ut ut convallis orci. Suspendisse facilisis justo sit amet maximus vulputate. Sed eu ligula nec tortor ullamcorper pellentesque at non erat. Nam eu ante ligula. Quisque placerat euismod lectus, ut ullamcorper quam finibus ut. Aenean lorem risus, vulputate vitae metus quis, convallis dapibus felis. Etiam semper lobortis nibh vel dignissim. Nullam pharetra non velit vel volutpat. Fusce sit amet justo at sem semper viverra. Aliquam erat volutpat. Ut tincidunt orci eget ante eleifend, eget dapibus arcu finibus. Proin at tempor turpis. Cras dictum dictum justo interdum iaculis.\n\nQuisque in turpis vel lectus varius lacinia. Vestibulum quis erat ac dolor maximus aliquet. Fusce lacinia tempor risus luctus venenatis. Duis vel maxim',
      'Quisque sodales imperdiet sem, eget gravida tortor laoreet nec. Morbi semper eros sit amet sapien placerat, non bibendum arcu tincidunt. Etiam et purus quis justo finibus efficitur. In a urna eget dui posuere pharetra. Nunc feugiat gravida viverra. Etiam libero justo, placerat sed nisi quis, dapibus condimentum elit. Morbi in felis vel mauris semper lobortis at vitae eros.',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: notes.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.emptyState.image(),
                  const Text(
                    'Saat ini catatan kosong. Anda akan melihat daftar catatan pada bagian ini',
                    textAlign: TextAlign.center,
                  ),
                  const SpaceHeight(100.0),
                ],
              )
            : ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: title[index],
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
                                  text: notes[index],
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
                              text: title[index],
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
                              text: notes[index],
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
                ),
                separatorBuilder: (context, index) => const SpaceHeight(10.0),
                itemCount: notes.length,
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
