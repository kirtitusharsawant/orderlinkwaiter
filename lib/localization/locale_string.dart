import 'package:get/get.dart';
import 'package:waiterbookadmin/constant/text_constant.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'appTitle': appTitle,
          'splashTitle': splashTitle,
          'splashSubTitle': splashSubTitle,
          'login': login,
          'signUp': signUp,
          'enterPhone': enterPhone,
          'plusNineOne': plusNineOne,
          'submit': submit,
          'enterOtp': enterOtp,
          'enterOtpSentTo': enterOtpSentTo,
          'verifyOtp': verifyOtp,
          'admin': admin,
          'getStarted': getStarted,
          'activities': activities,
          'paidOrders': paidOrders,
          'unpaidOrders': unpaidOrders,
          'manageKitchen': manageKitchen,
          'managerYourRestaurant': managerYourRestaurant,
          'statistics': statistics,
          'seeYourOrderHistory': seeYourOrderHistory,
          'pendingOrders': pendingOrders,
          'searchByTableNumber': searchByTableNumber,
          'tableNo': tableNo,
          'orderNumber': orderNumber,
          'markAsPaid': markAsPaid,
          'total': total,
          'areYouSureWantToMarkTableNumber': areYouSureWantToMarkTableNumber,
          'asPaidOrder': asPaidOrder,
          'yes': yes,
          'no': no,
          'orderDetails': orderDetails,
          'date': date,
          'time': time,
          'itemsOrdered': itemsOrdered,
          'paymentStatus': paymentStatus,
          'paid': paid,
          'notPaid': notPaid,
          'orderStatistics': orderStatistics,
          'weWillOverview': weWillOverview,
          'menuCard': menuCard,
          'menuItems': menuItems,
          'addItem': addItem,
          'searchByItemName': searchByItemName,
          'itemName': itemName,
          'itemPrice': itemPrice,
          'itemCategory': itemCategory,
          'availabilityStatus': availabilityStatus,
          'editItem': editItem,
          'deleteItem': deleteItem,
          'update': update,
          'areYouSureWantToDelete': areYouSureWantToDelete,
          'settings': settings,
          'tableSettings': tableSettings,
          'contactUs': contactUs,
          'aboutUs': aboutUs,
          'logout': logout,
          'editNumberOfTables': editNumberOfTables,
          'numberOfTables': numberOfTables,
          'pleaseEnterNoOfTables': pleaseEnterNoOfTables,
          'done': done,
          'pleaseContactUsFeature': pleaseContactUsFeature,
          'pleaseContactUsIssue': pleaseContactUsIssue,
          'typeYourCommentsHere': typeYourCommentsHere,
          'postComplaint': postComplaint,
          'weHaveReceivedYourComments': weHaveReceivedYourComments,
          'takeNewOrder': takeNewOrder,
          'selectTable': selectTable,
          'searchByTableNo': searchByTableNo,
          'selectItems': selectItems,
          'categories': categories,
          'items': items,
          'searchItemByName': searchItemByName,
          'takeOrder': takeOrder,
          'placeOrder': placeOrder,
          'nointernet': noInternet,
          'orderSuccessMessage': orderSuccessMessage,
          'selectMoreItems': selectMoreItems,
          'aboutUsText': aboutUsText,
          'noOrderAvailable': noOrderAvailable,
          'paneerBhurji': paneerBhurji,

          // new
          'splashScreenSubtitle': splashScreenSubtitle,
          'dashboardScreenSubTitle': dashboardScreenSubTitle,
        },
        'hi_IN': {
          'appTitle': appTitleHindi,
          'splashTitle': splashTitleHindi,
          'splashSubTitle': splashSubTitleHindi,
          'login': loginHindi,
          'signUp': signUpHindi,
          'enterPhone': enterPhoneHindi,
          'plusNineOne': plusNineOneHindi,
          'submit': submitHindi,
          'enterOtp': enterOtpHindi,
          'enterOtpSentTo': enterOtpSentToHindi,
          'verifyOtp': verifyOtpHindi,
          'admin': adminHindi,
          'getStarted': getStartedHindi,
          'activities': activitiesHindi,
          'paidOrders': paidOrdersHindi,
          'unpaidOrders': unpaidOrdersHindi,
          'manageKitchen': manageKitchenHindi,
          'managerYourRestaurant': managerYourRestaurantHindi,
          'statistics': statisticsHindi,
          'seeYourOrderHistory': seeYourOrderHistoryHindi,
          'pendingOrders': pendingOrdersHindi,
          'searchByTableNumber': searchByTableNumberHindi,
          'tableNo': tableNoHindi,
          'orderNumber': orderNumberHindi,
          'markAsPaid': markAsPaidHindi,
          'total': totalHindi,
          'areYouSureWantToMarkTableNumber':
              areYouSureWantToMarkTableNumberHindi,
          'asPaidOrder': asPaidOrderHindi,
          'yes': yesHindi,
          'no': noHindi,
          'orderDetails': orderDetailsHindi,
          'date': dateHindi,
          'time': timeHindi,
          'itemsOrdered': itemsOrderedHindi,
          'paymentStatus': paymentStatusHindi,
          'paid': paidHindi,
          'notPaid': notPaidHindi,
          'orderStatistics': orderStatisticsHindi,
          'weWillOverview': weWillOverviewHindi,
          'menuCard': menuCardHindi,
          'menuItems': menuItemsHindi,
          'addItem': addItemHindi,
          'searchByItemName': searchByItemNameHindi,
          'itemName': itemNameHindi,
          'itemPrice': itemPriceHindi,
          'itemCategory': itemCategoryHindi,
          'availabilityStatus': availabilityStatusHindi,
          'editItem': editItemHindi,
          'deleteItem': deleteItemHindi,
          'update': updateHindi,
          'areYouSureWantToDelete': areYouSureWantToDeleteHindi,
          'settings': settingsHindi,
          'tableSettings': tableSettingsHindi,
          'contactUs': contactUsHindi,
          'aboutUs': aboutUsHindi,
          'logout': logoutHindi,
          'editNumberOfTables': editNumberOfTablesHindi,
          'numberOfTables': numberOfTablesHindi,
          'pleaseEnterNoOfTables': pleaseEnterNoOfTablesHindi,
          'done': doneHindi,
          'pleaseContactUsFeature': pleaseContactUsFeatureHindi,
          'pleaseContactUsIssue': pleaseContactUsIssueHindi,
          'typeYourCommentsHere': typeYourCommentsHereHindi,
          'postComplaint': postComplaintHindi,
          'weHaveReceivedYourComments': weHaveReceivedYourCommentsHindi,
          'takeNewOrder': takeNewOrderHindi,
          'selectTable': selectTableHindi,
          'searchByTableNo': searchByTableNoHindi,
          'selectItems': selectItemsHindi,
          'categories': categoriesHindi,
          'items': itemsHindi,
          'searchItemByName': searchItemByNameHindi,
          'takeOrder': takeOrderHindi,
          'placeOrder': placeOrderHindi,
          'nointernet': noInternetHindi,
          'orderSuccessMessage': orderSuccessMessageHindi,
          'selectMoreItems': selectMoreItemsHindi,
          'aboutUsText': aboutUsTextHindi,
          'noOrderAvailable': noOrderAvailableHindi,
          // new
          'splashScreenSubtitle': splashScreenSubtitleHindi,
          'dashboardScreenSubTitle': dashboardScreenSubTitleHindi,
        },
        'mar_IN': {
          'appTitle': appTitleMarathi,
          'splashTitle': splashTitleMarathi,
          'splashSubTitle': splashSubTitleMarathi,
          'login': loginMarathi,
          'signUp': signUpMarathi,
          'enterPhone': enterPhoneMarathi,
          'plusNineOne': plusNineOneMarathi,
          'submit': submitMarathi,
          'enterOtp': enterOtpMarathi,
          'enterOtpSentTo': enterOtpSentToMarathi,
          'verifyOtp': verifyOtpMarathi,
          'admin': adminMarathi,
          'getStarted': getStartedMarathi,
          'activities': activitiesMarathi,
          'paidOrders': paidOrdersMarathi,
          'unpaidOrders': unpaidOrdersMarathi,
          'manageKitchen': manageKitchenMarathi,
          'managerYourRestaurant': managerYourRestaurantMarathi,
          'statistics': statisticsMarathi,
          'seeYourOrderHistory': seeYourOrderHistoryMarathi,
          'pendingOrders': pendingOrdersMarathi,
          'searchByTableNumber': searchByTableNumberMarathi,
          'tableNo': tableNoMarathi,
          'orderNumber': orderNumberMarathi,
          'markAsPaid': markAsPaidMarathi,
          'total': totalMarathi,
          'areYouSureWantToMarkTableNumber':
              areYouSureWantToMarkTableNumberMarathi,
          'asPaidOrder': asPaidOrderMarathi,
          'yes': yesMarathi,
          'no': noMarathi,
          'orderDetails': orderDetailsMarathi,
          'date': dateMarathi,
          'time': timeMarathi,
          'itemsOrdered': itemsOrderedMarathi,
          'paymentStatus': paymentStatusMarathi,
          'paid': paidMarathi,
          'notPaid': notPaidMarathi,
          'orderStatistics': orderStatisticsMarathi,
          'weWillOverview': weWillOverviewMarathi,
          'menuCard': menuCardMarathi,
          'menuItems': menuItemsMarathi,
          'addItem': addItemMarathi,
          'searchByItemName': searchByItemNameMarathi,
          'itemName': itemNameMarathi,
          'itemPrice': itemPriceMarathi,
          'itemCategory': itemCategoryMarathi,
          'availabilityStatus': availabilityStatusMarathi,
          'editItem': editItemMarathi,
          'deleteItem': deleteItemMarathi,
          'update': updateMarathi,
          'areYouSureWantToDelete': areYouSureWantToDeleteMarathi,
          'settings': settingsMarathi,
          'tableSettings': tableSettingsMarathi,
          'contactUs': contactUsMarathi,
          'aboutUs': aboutUsMarathi,
          'logout': logoutMarathi,
          'editNumberOfTables': editNumberOfTablesMarathi,
          'numberOfTables': numberOfTablesMarathi,
          'pleaseEnterNoOfTables': pleaseEnterNoOfTablesMarathi,
          'done': doneMarathi,
          'pleaseContactUsFeature': pleaseContactUsFeatureMarathi,
          'pleaseContactUsIssue': pleaseContactUsIssueMarathi,
          'typeYourCommentsHere': typeYourCommentsHereMarathi,
          'postComplaint': postComplaintMarathi,
          'weHaveReceivedYourComments': weHaveReceivedYourCommentsMarathi,
          'takeNewOrder': takeNewOrderMarathi,
          'selectTable': selectTableMarathi,
          'searchByTableNo': searchByTableNoMarathi,
          'selectItems': selectItemsMarathi,
          'categories': categoriesMarathi,
          'items': itemsMarathi,
          'searchItemByName': searchItemByNameMarathi,
          'takeOrder': takeOrderMarathi,
          'placeOrder': placeOrderMarathi,
          'nointernet': noInternetMarathi,
          'orderSuccessMessage': orderSuccessMessageMarathi,
          'selectMoreItems': selectMoreItemsMarathi,
          'aboutUsText': aboutUsTextMarathi,
          'noOrderAvailable': noOrderAvailableMarathi,
          // new
          'splashScreenSubtitle': splashScreenSubtitleMarathi,
          'dashboardScreenSubTitle': dashboardScreenSubTitleMarathi,
        }
      };
}
