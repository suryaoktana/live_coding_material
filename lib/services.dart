import 'package:live_coding_material/models.dart';
import 'dart:math';

class DummyServices {
  ///
  ///DO NOT EDIT THIS FILE
  ///

  final List<PersonModel> _personCollection = [
    const PersonModel(name: 'Andi', age: 26),
    const PersonModel(name: 'Rani', age: 18),
    const PersonModel(name: 'Doni', age: 32),
    const PersonModel(name: 'Farhan', age: 21),
    const PersonModel(name: 'Alex', age: 14),
    const PersonModel(name: 'Dias', age: 22),
  ];

  final List<HobbyModel> _hobbyCollection = [
    const HobbyModel(name: 'Badminton'),
    const HobbyModel(name: 'Basketball'),
    const HobbyModel(name: 'Games'),
    const HobbyModel(name: 'Swimming'),
    const HobbyModel(name: 'Tennis'),
    const HobbyModel(name: 'Running'),
  ];

  Future<List<PersonModel>> fetchPersons() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(1000, (index) => _getRandomPerson);
  }

  Future<List<HobbyModel>> fetchHobbies() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.generate(1000, (index) => _getRandomHobby);
  }

  PersonModel get _getRandomPerson => _personCollection[Random().nextInt(5)];

  HobbyModel get _getRandomHobby => _hobbyCollection[Random().nextInt(5)];
}
