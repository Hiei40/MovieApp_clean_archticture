import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
final String message;

  const Faliure(this.message);
@override
  // TODO: implement props
  List<Object?> get props =>[message] ;
}
class ServerFailure extends Faliure{
  const ServerFailure(super.message);


}
class DatabaseFailure extends Faliure{
  const DatabaseFailure(super.message);

}