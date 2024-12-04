import 'package:flutter/material.dart';
import 'package:live_coding_material/models.dart';
import 'package:live_coding_material/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;
  late List<PersonModel> persons;
  late List<HobbyModel> hobbies;

  @override
  void initState() {
    ///DO NOT MAKE CHANGES ON INIT STATE FUNCTION
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Persons And Hobbies'),
        ),
        body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Person List'),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView(
                              children: persons.map(
                                (element)=>Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    color: Colors.red,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 12),
                                  child: Row(
                                    children: [
                                      Text(element.name),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(element.age.toString()),
                                    ],
                                  ),
                                ),
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Hobby List'),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: ListView(
                              children: hobbies
                                  .map((element) => Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          color: Colors.green,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 12),
                                        child: Row(
                                          children: [
                                            Text(element.name),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> _fetchData() async {
    isLoading = true;
    persons = await DummyServices().fetchPersons();
    hobbies = await DummyServices().fetchHobbies();
    isLoading = false;
    setState(() {});
  }
}
