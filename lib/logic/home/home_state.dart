
abstract class HomeStates {}

class InitialGetPendingLPRsState extends HomeStates {}

class GetPendingLPRsLoadingState extends HomeStates {}

class GetPendingLPRsSuccessState extends HomeStates {
  GetPendingLPRsSuccessState();
}

class GetPendingLPRsErrorState extends HomeStates {
  String? message;
  GetPendingLPRsErrorState(this.message);
}


class SearchInPendingLPRsLoadingState extends HomeStates {}

class SearchInPendingLPRsSuccessState extends HomeStates {
  SearchInPendingLPRsSuccessState();
}

class SearchInPendingLPRsErrorState extends HomeStates {
  String? message;
  SearchInPendingLPRsErrorState(this.message);
}


class UpdateFilterCamerasNameSuccessState extends HomeStates {}

class FilterLPRsSuccessState extends HomeStates {}

class FilterLPRsErrorState extends HomeStates {}

class ClearFilterSuccessState extends HomeStates {}


class ConfirmLPRLoadingState extends HomeStates {}

class ConfirmLPRSuccessState extends HomeStates {
  ConfirmLPRSuccessState();
}

class ConfirmLPRErrorState extends HomeStates {
  String? message;
  ConfirmLPRErrorState(this.message);
}

class SelectFeedBackSuccessState extends HomeStates {}
class SelectLPRImageSuccessState extends HomeStates {}

class RemoveLPRImageSuccessState extends HomeStates {}


class AddLPRLoadingState extends HomeStates {}

class AddLPRSuccessState extends HomeStates {
  AddLPRSuccessState();
}

class SelectCameraNameSuccessState extends HomeStates {}
class AddLPRErrorState extends HomeStates {
  String? message;
  AddLPRErrorState(this.message);
}