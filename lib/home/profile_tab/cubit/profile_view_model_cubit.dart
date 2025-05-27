import 'package:bloc/bloc.dart';
import 'package:e_comrece_app/core/shared_prefs/shared_prefs.dart';
import 'package:meta/meta.dart';

part 'profile_view_model_state.dart';

class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  ProfileViewModelCubit() : super(ProfileViewModelInitial());
  void getUser()async{
    emit(ProfileViewModeLoading());
    final name= await SharedPrefs.getData("name");
    final email= await SharedPrefs.getData("email");
    if(name!=null&&email!=null){
      emit(ProfileViewModelSuccess(name: name, email: email));
    }else{
      emit(ProfileViewModeError(message: "no found data"));
    }
  }
}
