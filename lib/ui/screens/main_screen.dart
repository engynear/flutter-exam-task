import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_task/ui/widgets/widget.dart';
import 'criteria_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _random = math.Random();
  List<int> _selectedIndexes = [-1, -1, -1];
  Set<int> _usedCombinations = Set<int>();

  @override
  void initState() {
    super.initState();
  }

  void _pickRandomOptions() {
    int newIndex;
    do {
      newIndex = _random.nextInt(3 * 2 * 3);
    } while (_usedCombinations.contains(newIndex));

    _usedCombinations.add(newIndex);
    if (_usedCombinations.length == 3 * 2 * 3) {
      _usedCombinations.clear();
    }

    setState(() {
      _selectedIndexes = [newIndex ~/ 6, (newIndex ~/ 3) % 2, newIndex % 3];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главный экран"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ButtonBarWidget(
              title: 'Основной цвет',
              buttonTexts: const ['Розовый', 'Желтый', 'Зеленый'],
              onSelected: (index) {},
              highlightedIndex: _selectedIndexes[0],
            ),
            ButtonBarWidget(
              title: 'Показ результата',
              buttonTexts: const ['Dialog', 'SnackBar'],
              onSelected: (index) {},
              highlightedIndex: _selectedIndexes[1],
            ),
            ButtonBarWidget(
              title: 'Переход между экранами',
              buttonTexts: const [
                'Снизу Вверх',
                'Сверху Вниз',
                'Справа Налево'
              ],
              onSelected: (index) {},
              highlightedIndex: _selectedIndexes[2],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _pickRandomOptions,
                    child: const Text('Случайный выбор'),
                  ),
                  ElevatedButton(
                    onPressed: _showCriteriaScreen,
                    child: const Text('Посмотреть критерии'),
                  ),
                ],
              ),
            ),
            if (_selectedIndexes[1] != -1)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedIndexes[1] == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Результат'),
                            content: Text('Цвет: ${[
                              'Розовый',
                              'Желтый',
                              'Зеленый'
                            ][_selectedIndexes[0]]}\n'
                                'Показ: ${[
                              'Dialog',
                              'SnackBar'
                            ][_selectedIndexes[1]]}\n'
                                'Переход: ${[
                              'Снизу Вверх',
                              'Сверху Вниз',
                              'Справа Налево'
                            ][_selectedIndexes[2]]}'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Закрыть'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Цвет: ${[
                            'Розовый',
                            'Желтый',
                            'Зеленый'
                          ][_selectedIndexes[0]]}\n'
                              'Показ: ${[
                            'Dialog',
                            'SnackBar'
                          ][_selectedIndexes[1]]}\n'
                              'Переход: ${[
                            'Снизу Вверх',
                            'Сверху Вниз',
                            'Справа Налево'
                          ][_selectedIndexes[2]]}'),
                          duration: const Duration(seconds: 5),
                          action: SnackBarAction(
                            label: 'Закрыть',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Показать результат'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showCriteriaScreen() {
    final transition = _selectedIndexes[2];

    PageRoute pageRoute;

    switch (transition) {
      case 0:
        pageRoute = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CriteriaScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
        break;
      case 1:
        pageRoute = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CriteriaScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, -1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
        break;
      case 2:
      default:
        pageRoute =
            MaterialPageRoute(builder: (context) => const CriteriaScreen());
        break;
    }

    Navigator.of(context).push(pageRoute);
  }
}
