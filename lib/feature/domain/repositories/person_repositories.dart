import 'package:dartz/dartz.dart';
import 'package:flutter_first_progect/core/error/failure.dart';
import 'package:flutter_first_progect/feature/domain/entities/person_entity.dart';

abstract class PersonRepositories{
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}