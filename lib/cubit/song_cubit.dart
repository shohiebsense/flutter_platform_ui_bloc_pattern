

import 'package:bloc/bloc.dart';
import 'package:ui_platform_design/model/song.dart';



class SongCubit extends Cubit<Song> {
  SongCubit() : super(Song());

  void refresh() => emit(Song());
}