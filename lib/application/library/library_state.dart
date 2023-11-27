part of 'library_bloc.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState({
    required bool isLoading,
    required bool isError,
    required List<DownloadsImage> downloads,
    required List<Map<String, dynamic>> myList,
  }) = _DownloadsState;

  factory LibraryState.initial() {
    return const LibraryState(
        isLoading: true, isError: false, downloads: [], myList: []);
  }
}
