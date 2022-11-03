import '../../domain/entities/generes.dart';

class GenresModel extends Generes{
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json){ 
    return GenresModel(
      name: json['name'], 
      id: json['id'], 
      );
  }

}