import 'package:dartz/dartz.dart';
import 'package:flutter_first_progect/core/error/failure.dart';
import 'package:flutter_first_progect/feature/domain/entities/person_entity.dart';
import 'package:flutter_first_progect/feature/domain/repositories/person_repository.dart';

class SearchPerson{
  final PersonRepository personRepository;

  SearchPerson(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(int page) async {
    return await personRepository.getAllPersons(page);
  }
}