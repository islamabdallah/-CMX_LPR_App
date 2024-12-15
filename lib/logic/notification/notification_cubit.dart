
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart';
import '../../data/models/notification_model/notification_model.dart';
import '../../data/repositories/home_repo.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  static NotificationCubit get(context) => BlocProvider.of(context);
  final HomeRepository homeRepository;

  NotificationCubit({required this.homeRepository}) : super(InitialNotificationState());


  List<NotificationModel>notifications=[];
  List<NotificationModel>notificationsList=[];
  Future<void> getNotification() async {
    emit( NotificationLoadingState());
    final result = await homeRepository.getNotification(
        userNumber: userNumber??0,
        languageCode:2);
    result.fold((failure) {
      emit(NotificationErrorState(failure.message));
    }, (getNotificationResponse) {
      notificationsList=getNotificationResponse.data;
      List<NotificationModel>notificationsListSorted=[];
      notificationsListSorted=List.from(notificationsList);
      notificationsListSorted.sort((a,b)=>a.date!.compareTo(b.date!));
      List<NotificationModel>notificationsListSortedReversed=[];
      notificationsListSortedReversed=notificationsListSorted.reversed.toList();
      notifications=notificationsListSortedReversed;
      emit(NotificationSuccessState());
    });
  }

}
