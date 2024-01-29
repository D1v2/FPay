class ApiConstants {
  static int TIME_OUT_DURATION = 2;
  static String baseUrl = "https://f-pay.in/Android";
  static String loginEndPoint = "/Home/Login";
  static String changeCredentialsEndPoint = "/Home/ChangePasswordPin";
  static String forgotCredentialsEndPoint = "/Home/ForgotPasswordPin";
  static String sendOTPEndPoint = "/Master/SendOTP";
  static String profileEndPoint = "/Home/CustomerProfile";
  static String homeIcons = "/Master/HomeIcon";
  static String currentBalanceEndPoint = "/Wallet/GetBalance";
  static String ticketHistoryEndPoint = "/Support/ComplaintTicketHistory";
  static String dropDownMasterEndPoint = "/Master/DropdownMaster";
  static String raisedTicketEndPoint = "/Support/RaiseComplaintTicket";
  static String allOperatorsEndPoint = "/Master/OperatorMaster";
  static String fetchBBPSDetailEndPoint = "/BBPS/FetchBill";
  static String payBBPSEndPoint = "/BBPS/PayBill";

  /* ---- Aeps -------*/
  static String doAepsEndPoint = "/Aeps/DoAeps";
  static String onBoardingEndPoint = "/Aeps/Onboarding";
  static String outLetStatus = "/Aeps/OutletLoginStatus";
  static String outLetLogin = "/Aeps/OutletLogin";

  /* ---- Aeps Pro -------*/

  static String checkOnBoardingAepsProEndPoint = "/Aeps/OnboardingAepsPro";
  static String completeOnBoardingAepsProEndPoint = "/Aeps/DoOnboardingAepsPro";
  static String completeAepsProEndPoint = "/Aeps/DoOnboardingAepsPro";

  /* ---- Report -------*/
  static String reportEndPoint = "/Report/ReportMaster";

  /*---- Payout -----*/
  static String payoutAccountsEndPoint = "/Payout/GetBeneficiary";
  static String payoutEndPoint = "/Payout/DoPayout";
  static String allPayoutAccountsEndPoint = "/Master/PayoutBankMaster";
  static String verifyAccountPayout = "/Payout/Verification";
  static String accountInformation = "/Payout/GetHolderNameByAccountNumber";
  static String deleteAccounts = "/Payout/DeleteBeneficiary";
  static String payoutChargeCalculate = "/Payout/CalculateCharge";
  static String creditCardBill = "/CreditCard/DoCreditCard";

  /*---- Money Transfer ------*/
  static String checkMoneyTransferNumber = "/MoneyTransfer/CheckRemitterNumber";
  static String addMoneyTransferNumber = "/MoneyTransfer/AddRemitterNumber";
  static String verifyOtpMoneyTransfer = "/MoneyTransfer/VerifyRemitterOTP";
  static String addBankMoneyTransfer = "/MoneyTransfer/AddBeneficiary";
  static String deleteBankMoneyTransfer = "/MoneyTransfer/DeleteBeneficiary";
  static String verifyDeleteBankMoneyTransfer =
      "/MoneyTransfer/VerifyDeleteBeneficiaryOTP";
  static String moneyTransfer = "/MoneyTransfer/DoMoneyTransfer";
  static String checkLimitMoneyTransfer = "/MoneyTransfer/RemitterNumberLimit";
  static String bankListMoneyTransfer = "/MoneyTransfer/GetBeneficiaryList";
  static String allBankListMoneyTransfer = "/Master/MoneyTransferBankMaster";
  static String limit = "/MoneyTransfer/RemitterNumberLimit";
  static String calculateChargesMoneyTransfer =
      "/MoneyTransfer/CalculateCharge";

  /*------ Recharge -------*/
  static String fetchRechargeEndPoint = "/Recharge/FetchPlanAndInfo";
  static String fetchOperatorName = "/Master/OperatorMaster";
  static String doRechargeEndPoint = "/Recharge/DoRecharge";

  /*------ Notification -------*/
  static String notificationListEndPoint = "/Home/Notification";

  /*------ Self Settlement -------*/
  static String selfBankList = "/Member/GetMemberBank";
  static String selfAddBank = "/Member/AddMemberBank";
  static String selfTransaction = "/Member/DoSettlement";

  /*----- Fund Request -----*/
  static String fundRequest = "/Wallet/AddFundRequest";
  static String fundRequestList = "/Wallet/ListFundRequest";


  /*----- Auto Collector ----- */
  static String autoCollectorList = "/AutoCollect/GetAutoCollect";
  static String doAutoCollector = "/AutoCollect/DoAutoCollect";


  /*----MATM---*/
  static String checkOnboardingMAtm = "/Aeps/OnboardingAepsPro";
  static String completeOnboardingMAtm = "/Aeps/DoOnboardingAepsPro";
  static String updateTransactionMAtm = "/Matm/DoMatm";


  /* ------- Hotel Apis -------*/
  static String hotelBaseUrl = "https://tripjack.com/hms/v1";
  static String hotelApiKey = "8106418247f4c442-7b18-450b-998e-309760a4433f";
  static String hotelList = "/hotel-search";
  static String hotelDetail = "/hotelDetail-search";

}
