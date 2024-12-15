import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../data/models/car_number_model/car_number_model.dart';
import '../../data/repositories/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepository homeRepository;

  HomeCubit({required this.homeRepository})
      : super(InitialGetPendingLPRsState());

  TextEditingController searchByCarNumberController = TextEditingController();

  List<String> feedBacks = [];
  List<String> camerasName = [];
  List<CarNumberModel> pendingLPRsCars = [];
  List<String> filterCamerasName = [];
  List<bool> radioValues = [];
  int notificationCount = 0;
  Future<void> getPendingLPRs() async {
    emit(GetPendingLPRsLoadingState());
    final result = await homeRepository.getPendingLPRs(
        userNumber: userNumber ?? 0, languageCode: 2);
    result.fold((failure) {
      emit(GetPendingLPRsErrorState(failure.message));
    }, (getPendingLPRsResponse) {
      camerasName = getPendingLPRsResponse.data.camerasName;
      feedBacks = getPendingLPRsResponse.data.feedBacks;
      List<CarNumberModel> lPRs=List.from(getPendingLPRsResponse.data.lPRs);
      lPRs.sort((a,b)=>a.date!.compareTo(b.date!));
      List<CarNumberModel> lPRsReversed=lPRs.reversed.toList();
      pendingLPRsCars=lPRsReversed;
      notificationCount = getPendingLPRsResponse.data.notificationCount ?? 0;
      for (int i = 0; i < camerasName.length; i++) {
        radioValues.add(false);
      }
      emit(GetPendingLPRsSuccessState());
    });
  }

  List<CarNumberModel> searchPendingLPRsCarsResult = [];
  void searchInPendingLPRs() async {
    searchPendingLPRsCarsResult = [];
    emit(SearchInPendingLPRsLoadingState());
    for (int i = 0; i < pendingLPRsCars.length; i++) {
      String? carOcr = pendingLPRsCars[i].ocr;
      if (carOcr!.contains(searchByCarNumberController.text)) {
        searchPendingLPRsCarsResult.add(pendingLPRsCars[i]);
      }
    }
    if (searchPendingLPRsCarsResult.isNotEmpty) {
      emit(SearchInPendingLPRsSuccessState());
    } else {
      emit(SearchInPendingLPRsErrorState(AppStrings.noDataAvailable));
    }
  }

  void updateFilterCamerasName(String cameraName, int index) {
    if (radioValues[index] == true) {
      filterCamerasName.add(cameraName);
    } else {
      filterCamerasName.remove(cameraName);
    }
    emit(UpdateFilterCamerasNameSuccessState());
  }

  void updateRadioValues(int index, bool value) {
    radioValues[index] = value;
  }

  List<CarNumberModel> filteredPendingLPRsCars = [];

  void filterLPRs() {
    filteredPendingLPRsCars = [];
    for (int j = 0; j < filterCamerasName.length; j++) {
      for (int i = 0; i < pendingLPRsCars.length; i++) {
        if (filterCamerasName[j] == pendingLPRsCars[i].camera_name) {
          filteredPendingLPRsCars.add(pendingLPRsCars[i]);
        }
      }
    }
    emit(FilterLPRsSuccessState());
  }

  clearFilter() {
    for (int i = 0; i < radioValues.length; i++) {
      radioValues[i] = false;
    }
    filterCamerasName.clear();
    emit(ClearFilterSuccessState());
  }

  TextEditingController ocr = TextEditingController();
  String selectedFeedBack = "Matched";

  void selectFeedBack(String? value) {
    selectedFeedBack = value ?? "";

    emit(SelectFeedBackSuccessState());
  }

  setInitialValueToOcrController(String value) {
    ocr.text = value;
  }

  Future<void> confirmLPR(int carId) async {
    emit(ConfirmLPRLoadingState());
    final result = await homeRepository.confirmLPR(
        userNumber: userNumber ?? 0,
        languageCode: 2,
        cardId: carId,
        feedBack: selectedFeedBack,
        ocr: ocr.text.toString());
    result.fold((failure) {
      emit(ConfirmLPRErrorState(failure.message));
    }, (confirmLPRResponse) {
      emit(ConfirmLPRSuccessState());
    });
  }

  removeActivationFromItemInFilter(String cameraName) {
    for (int i = 0; i < camerasName.length; i++) {
      if (cameraName == camerasName[i]) {
        radioValues[i] = false;
      }
    }
  }

  clearLPrData() {
    selectedFeedBack = "Matched";
    ocr.clear();
  }

  String selectedImage = "";
  String selectedCameraName = "";
  TextEditingController inputOCR = TextEditingController();
  File? imageFile;
  XFile? image;
  pickImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imageFile = File(image!.path);
      Uint8List bytes = imageFile!.readAsBytesSync();
      String img64 = base64Encode(bytes);
      selectedImage = img64;
      emit(SelectLPRImageSuccessState());
    }
  }

  removeImage() {
    selectedImage = "";
    imageFile = null;
    image = null;
    emit(RemoveLPRImageSuccessState());
  }


  void selectCameraName(String? value) {
    selectedCameraName= value ?? "";

    emit(SelectCameraNameSuccessState());
  }
  Future<void> addLPR()async
  {
    emit(AddLPRLoadingState());
    final result = await homeRepository.addLPR(
        userNumber: userNumber??0,
        cameraName: selectedCameraName,
        cardId: 0,
        imag: selectedImage,
        ocr:inputOCR.text ,
        date: DateTime.now(),
        languageCode: 2);
    result.fold((failure) {
      emit(AddLPRErrorState(failure.message));
    }, (confirmLPRResponse) {
      emit(AddLPRSuccessState());
    });
  }


  clearSearch()
  {
    searchByCarNumberController.clear();
    searchPendingLPRsCarsResult.clear();
    emit(SearchInPendingLPRsErrorState(AppStrings.noDataAvailable));
  }
}
