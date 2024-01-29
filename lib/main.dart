import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpay/Pages/Authenication/LoginPage.dart';
import 'package:fpay/Pages/Authenication/SetPassword.dart';
import 'package:fpay/Pages/Common/FailedScreen.dart';
import 'package:fpay/Pages/Common/OTPScreen.dart';
import 'package:fpay/Pages/Common/PendingScreen.dart';
import 'package:fpay/Pages/Common/SuccessScreen.dart';
import 'package:fpay/Pages/Dashboard/Dashboard.dart';
import 'package:fpay/Pages/Dashboard/fundRequest/FundRequestList.dart';
import 'package:fpay/Pages/services/aeps/Aeps.dart';
import 'package:fpay/Pages/services/aeps/AepsBanks.dart';
import 'package:fpay/Pages/services/aeps/AepsFillDetail.dart';
import 'package:fpay/Pages/services/aeps/AepsOnboarding.dart';
import 'package:fpay/Pages/services/aeps/MiniStatement.dart';
import 'package:fpay/Pages/services/aepsPro/AepsPro.dart';
import 'package:fpay/Pages/services/aepsPro/AepsProOnBoarding.dart';
import 'package:fpay/Pages/services/bbps/BaseBBPS.dart';
import 'package:fpay/Pages/services/bbps/FetchBBPSDetail.dart';
import 'package:fpay/Pages/services/bus/BusDashboard.dart';
import 'package:fpay/Pages/services/bus/BusFilter.dart';
import 'package:fpay/Pages/services/bus/BusList.dart';
import 'package:fpay/Pages/services/bus/SelectSeat.dart';
import 'package:fpay/Pages/services/bus/TravellerDetails.dart';
import 'package:fpay/Pages/services/bus/TravellerInformation.dart';
import 'package:fpay/Pages/services/hotel/HotelDashboard.dart';
import 'package:fpay/Pages/services/matm/MAtm.dart';
import 'package:fpay/Pages/services/matm/MAtmOnboarding.dart';
import 'package:fpay/Pages/services/matm/MAtmRegistration.dart';
import 'package:fpay/Pages/services/moneytransfer/AddBankMoneyTransfer.dart';
import 'package:fpay/Pages/services/moneytransfer/AddNumber.dart';
import 'package:fpay/Pages/services/moneytransfer/CheckNumber.dart';
import 'package:fpay/Pages/services/moneytransfer/ConfirmMoneyTransfer.dart';
import 'package:fpay/Pages/services/moneytransfer/DMRBanks.dart';
import 'package:fpay/Pages/services/payout/AddBank.dart';
import 'package:fpay/Pages/services/payout/AddUpiId.dart';
import 'package:fpay/Pages/services/payout/BankPayment.dart';
import 'package:fpay/Pages/services/payout/CreditCardDashboard.dart';
import 'package:fpay/Pages/services/recharges/ContactNumber.dart';
import 'package:fpay/Pages/services/recharges/Recharge.dart';
import 'package:fpay/Pages/services/recharges/RechargePayment.dart';
import 'package:fpay/Pages/services/recharges/SelectMobilePlan.dart';
import 'package:fpay/Pages/services/recharges/SelectOperators.dart';
import 'package:fpay/SpalshScreen.dart';
import 'package:fpay/Utils/PreferenceManager.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'AppManager/ThemeColor.dart';
//import 'com.finopaytech.finosdk.helpers.FinoApplication';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceManager.init();
  // await FinoApplication.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MethodChannel platform = const MethodChannel('aeps')
    ..invokeMethod('Register');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'F-Pay Business',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: _buildPages(),
        theme: _themeData());
  }

  List<GetPage> _buildPages() {
    return [
      GetPage(name: '/', page: () => const SplashScreen()),
      GetPage(name: '/login', page: () => const LoginPage()),
      GetPage(name: '/otp', page: () => const OTPScreen()),
      GetPage(name: '/setPassword', page: () => const SetPassword()),
      GetPage(name: '/dashboard', page: () => const Dashboard()),
      GetPage(name: '/baseBBPS', page: () => const BaseBBPS()),
      GetPage(name: '/bbpsDetail', page: () => FetchBBPSDetail()),
      GetPage(name: '/aeps', page: () => const Aeps()),
      GetPage(name: '/aepsBank', page: () => AepsBanks()),
      GetPage(name: '/aepsDetail', page: () => AepsFillDetail()),
      GetPage(name: '/aepsOnBoarding', page: () => const AepsOnboarding()),
      GetPage(name: '/miniStatement', page: () => const MiniStatement()),
      GetPage(
          name: '/addBankMoneyTransfer',
          page: () => const AddBankMoneyTransfer()),
      GetPage(name: '/addNumberMoneyTransfer', page: () => const AddNumber()),
      GetPage(name: '/checkNumber', page: () => const CheckNumber()),
      GetPage(
          name: '/confirmMoneyTransfer',
          page: () => const ConfirmMoneyTransfer()),
      GetPage(name: '/dmrBank', page: () => const DMRBanks()),
      GetPage(name: '/addBankPayout', page: () => const AddBank()),
      GetPage(name: '/addUpiPayout', page: () => const AddUpiId()),
      GetPage(name: '/bankPaymentPayout', page: () => const BankPayment()),
      GetPage(name: '/creditCard', page: () => const CreditCardDashboard()),
      GetPage(name: '/contactNumber', page: () => const ContactNumber()),
      GetPage(name: '/recharge', page: () => const Recharge()),
      GetPage(name: '/rechargePayment', page: () => const RechargePayment()),
      GetPage(name: '/selectMobilePlan', page: () => const SelectMobilePlan()),
      GetPage(name: '/selectOperator', page: () => const SelectOperators()),
      GetPage(name: '/matm', page: () => const MAtm()),
      GetPage(name: '/matmOnboarding', page: () => const MAtmOnboarding()),
      GetPage(name: '/matmRegistration', page: () => const MAtmRegistration()),
      GetPage(name: '/busDashboard', page: () => const BusDashboard()),
      GetPage(name: '/busList', page: () => const BusList()),
      GetPage(name: '/busFilter', page: () => const BusFilter()),
      GetPage(name: '/busSelectSeat', page: () => const SelectSeat()),
      GetPage(
          name: '/busTravellerInformation',
          page: () => const TravellerInformation()),
      GetPage(
          name: '/busTravellerDetails', page: () => const TravellerDetails()),
      GetPage(name: '/hotelDashboard', page: () => const HotelDashboard()),
      GetPage(name: '/success', page: () => const SuccessScreen()),
      GetPage(name: '/failed', page: () => const FailedScreen()),
      GetPage(name: '/pending', page: () => const PendingScreen()),
      GetPage(name: '/fundRequestList', page: () => const FundRequestList()),
      GetPage(name: '/aepsPro', page: () => const AepsPro()),
      GetPage(name: '/aepsProOnboarding', page: () => const AepsProOnBoarding()),
    ];
  }

  ThemeData _themeData() {
    return ThemeData(
      primaryColor: AppColor.lightBlue800,
      backgroundColor: AppColor.whiteA700,
      primarySwatch: Colors.lightBlue,
      primaryColorDark: Colors.black,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: AppColor.lightBlue800),
    );
  }
}

// Share Button
/*keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA \
-keysize 2048 -validity 10000 -alias upload*/

//------------ Android Key ---------
// Fpay0893@$
// alis - fpay-key-alias
// flutter build appbundle --release

/*
1	  Prepaid Recharge
2	  DTH
3	  Landline
4	  Broadband
5	  Cable
6	  Datacard Prepaid
8	  Postpaid
9	  Electricity
10	Gas
11	Water
12	Insurance
13	EMI Payments
14	Traffic Challan
15	LPG Booking
16	Fastag
17	Hospital
18	Digital Voucher
19	Municipality Tax
20	LIC
21	Balance Enquiry
22	MiniStatement
23	CashWithdrawal
24	AadhaarPay
25	Bank Account
26	UPI
27	Credit Card
29	Wallet
30	OTT Subscription
31	Money Transfer
32	CMS
33	Credit Card Payment
34	Gift Voucher
35	Bank Account Verify
36	UPI Verify
37	Aadhar Verify
38	PAN Verify
39	Bus
40	Flight
41	Hotel
43	Bank Account SS
*/

// --------- Hotel Urls -------
// UAT
// host:-- tripjack.com
// apikey:-- 8106418247f4c442-7b18-450b-998e-309760a4433f

// Production
// host :-- apitest.tripjack.com
// apikey :- 4120520705d673-09fe-4ed3-9437-d825207f9e7e

// MA3CNC32SMD252102
// 8483000313
//20231208112134
// 20231208112255
//20231208113601

// Login Github Token
// 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