// import '../general_exports.dart';

// String apiUrl = (currentMode == AppMode.dev || currentMode == AppMode.developer)
//     ? 'https://$domainName-dev.jigsawme.io/api'
//     : currentMode == AppMode.demo
//         ? 'https://$domainName-demo.jigsawme.io/api'
//         : 'https://$domainName-prod.jigsawme.io/api';

// String get domainName {
//   switch (currentTemplate) {
//     case Template.healthyAppTemplate:
//       return 'binge';
//     default:
//       return 'maqloba';
//   }
// }

// String baseUrl = '$apiUrl/v1';
// String apiPages = '$apiUrl/template/pages';
// const String healthySubscription = '/healthy-subscription';
// const String apiSendOtp = '/account/send-otp';
// const String apiHome = '/home';
// const String apiVerificationOtp = '/account/verify-otp';
// const String apiBranches = '/branches';
// const String apiAllBranches = '/branch/all';
// const String apiSettings = '/settings';
// const String apiCategories = '/categories';
// const String apiProducts = '/products';
// const String apiCart = '/cart';
// const String apiRegister = '/user/register';
// const String apiAddresses = '/addresses';
// const String apiDeleteAllOutOfStock = '/delete-array-of-item-cart';
// const String apiDeleteAllCart = '/delete-all-cart';
// const String apiAccountInfo = '/account/info';
// const String apiUserCards = '/user-cards';
// const String apiCheckPaymentStatus = '/payments/check-payment-status';
// const String apiNotification = '/notifications';
// const String apiCalculateBMI = '$healthySubscription/calculate-body-mass-index';
// const String apiPlanSubscription = '$healthySubscription/plan-subscription';
// const String apiPlanSubscriptionCheckout = '$healthySubscription/checkout';
// const String apiPlanSubOrders = '$healthySubscription/orders';

// const String apiOrders = '/orders';
// const String customerService = '/customer-service';
// const String createFeedback = '/customer-service/create-feedback';
// const String apiUpdateProfile = '/account/update';
// const String apiAccountDelete = '/account/delete';
// const String apiMaqloPoints = '/wallets';
// const String apiMaqloTransferPoints = '/wallets/transfare-points';
// const String apiSharingIsCaring = '/settings/invite-friend';
// const String apiReorder = '/re-order';
// const String apiRateOrderQuestions = '/rate-questions';
// const String apiRateOrder = '/rate-order';
// const String apiLogout = '/account/logout';
// const String apiPagesUrls = '/settings/pages-url';
// const String apiApplePay = '/payments/pay-by-apple';

// String branchById(dynamic id) => '/branches/$id';
// String branchByIdByLatLng(dynamic id, dynamic latitude, dynamic longitude) =>
//     '/branches/$id?latitude=$latitude&longitude=$longitude';
// String apiPlanMeals(dynamic id) =>
//     '$healthySubscription/plan-subscription/$id/meals';
