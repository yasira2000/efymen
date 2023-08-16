import 'package:efymen/models/QNote.dart';
import 'package:efymen/widgets/appbar.dart';
import 'package:flutter/material.dart';

class QuickNote extends StatelessWidget {
  const QuickNote(String s, {super.key});

  @override
  Widget build(BuildContext context) {
    List<QNote> notes = [
      QNote("have to get a red pen", 'red'),
      QNote("download Spiderman movie", 'blue'),
    ];
    // List<QNote> sheduled = [
    //   QNote("have to get a red pen", 'red'),
    //   QNote("download Spiderman movie", 'blue'),
    // ];
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "QuickNote",
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const CommonAppBar(
            textTitle: "Todo",
          ),
          backgroundColor: colorScheme.background,
        ),
      ),
    );
  }
}

Widget quickTabView(context, List<QNote> qlist) {
  List<QNote> qList = qlist;
  return GridView.count(
    crossAxisCount: 2,
    children: List.generate(100, (index) {
      return Center(
        child: Text(
          'Item $index',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
    }),
  );
}
