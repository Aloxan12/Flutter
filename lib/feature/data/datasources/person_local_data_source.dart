import 'dart:convert';

import 'package:flutter_first_progect/core/error/exception.dart';
import 'package:flutter_first_progect/feature/data/models/person_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
 Future<List<PersonModel>> getLastPersonsCache();

 Future<void> personToCache(List<PersonModel> persons);
}

const CACHED_PERSONS_LIST = 'CACHED_PERSONS_LIST';

class PersonLocalDataSourceImpl implements PersonLocalDataSource{
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsCache() {
    final jsonPersonsList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if(jsonPersonsList != null && jsonPersonsList.isNotEmpty){
      return Future.value(jsonPersonsList.map((person)=> PersonModel.fromJson(json.decode(person))).toList());
    }else{
      throw CacheException();
    }
  }

  @override
  Future<void> personToCache(List<PersonModel> persons) {
    final List<String> jsonPersonsList = persons.map((person)=> json.encode(person.toJson())).toList();
    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonsList);
    return Future.value(jsonPersonsList);
  }
}