import 'package:flutter_first_progect/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSource{
  Future<List<PersonModel>> getAllPersons(int page);
  searchPersons(String query);
}