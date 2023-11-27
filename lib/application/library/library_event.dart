part of 'library_bloc.dart';

@freezed
class LibraryEvent with _$LibraryEvent {
  const factory LibraryEvent.getDownloadsImages() = _GetDownloadsImages;
  const factory LibraryEvent.getMyList() = _GetMyList;
}
