import 'package:riverpod_base/src/presentation/controller/todo_controller.dart';
import 'package:riverpod_base/src/translation/default_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/todo.dart';
import '../../../translation/app_localization.dart';
import '../../../translation/current_data.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}): super(key: key);

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }
  final DefaultData defaultData = DefaultData();
  @override
  Widget build(BuildContext context) {
    // We can also use "ref" to listen to a provider inside the build method
    final todoItemController = ref.watch(todoItemControllerProvider);
    final currentDataController = ref.read(currentDataProvider.notifier);
    final currentData = ref.watch(currentDataProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalization.of(context)!.translate('hello-world'),
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              Text(
                '${currentData.languageCode}',
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              Container(
                width: 100,
                padding: EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: DropdownButton<String>(
                  value: currentDataController.defineCurrentLanguage(context),
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  iconSize: 20,
                  elevation: 0,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(
                    height: 1,
                  ),
                  dropdownColor: Colors.indigo,
                  onChanged: (newValue) {
                    currentDataController.changeLocale(newValue!);
                  },
                  items: defaultData.languagesListDefault
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          ref.read(todoItemControllerProvider.notifier).addTodo(
              Todo(
                  title: 'todo 1',
                  description: 'todo2',
                  dueDate:  DateTime.now(),
                  isCompleted: false
              )
          );
        },
      ),
      body: ListView.builder(
        itemCount: todoItemController.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${todoItemController[index].title}'),
          );
        },
      )
    );
  }
}