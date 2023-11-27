import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/library/downloads/downloads_service.dart';
import 'package:movie_app/domain/library/downloads/models/downloads_image/downloads_image.dart';
import 'package:movie_app/domain/library/my_list/my_list_service.dart';

part 'library_event.dart';
part 'library_state.dart';
part 'library_bloc.freezed.dart';

@injectable
class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final DownloadsService _downloadsService;
  final MyListService _myListService;

  LibraryBloc(this._downloadsService, this._myListService)
      : super(LibraryState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      // Show loading in UI
      emit(
        state.copyWith(
          isLoading: true,
          isError: false,
        ),
      );

      //Get items from api
      final result = await _downloadsService.getDownloadsImages();

      // show to UI
      emit(
        result
            .fold((failure) => state.copyWith(isLoading: false, isError: true),
                (imageList) {
          return state.copyWith(
              isLoading: false, isError: false, downloads: imageList);
        }),
      );
    });

    on<_GetMyList>(
      (event, emit) async {
        emit(
          state.copyWith(
            myList: await _myListService.getMyList(),
          ),
        );
      },
    );

    // Refreshes the My List with updated values
    _myListService.changeNotifier.addListener(_updateMyList);
  }

  // Updates the My List by triggering the event
  void _updateMyList() {
    add(const _GetMyList());
  }

  @override
  Future<void> close() async {
    // Remove the listener
    _myListService.changeNotifier.removeListener(_updateMyList);
    super.close();
  }
}
