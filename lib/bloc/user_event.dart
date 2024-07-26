import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent{

}