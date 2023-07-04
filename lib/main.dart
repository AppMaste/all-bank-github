import 'dart:convert';
import 'package:all_bank/Finance%20Calculator/Finance%20Calculator%20Screen.dart';
import 'package:all_bank/Get%20Started%20Screen/Logo%20Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Bank Holiday/Bank Holiday Screen.dart';
import 'Bank Holiday/Bank Holidays.dart';
import 'EMI in Advance/EMI in Advance Screen.dart';
import 'EMI in Advance/EMI in Advance result Screen.dart';
import 'EPF Balance & Passbook/EPF Balance & Passbook Screen.dart';
import 'FD Calculation/FD Calculation Result Screen.dart';
import 'FD Calculation/FD Calculation Screen.dart';
import 'Finance Calculator/Compare loan/Compare Loan Screen.dart';
import 'Finance Calculator/Compare loan/Compare Loan result.dart';
import 'Finance Calculator/EMI Calculator/EMI Calculator Bar Chart.dart';
import 'Finance Calculator/EMI Calculator/EMI Calculator Detaila.dart';
import 'Finance Calculator/EMI Calculator/EMI Calculator Pie Chart.dart';
import 'Finance Calculator/EMI Calculator/EMI Calculator Screen.dart';
import 'Finance Calculator/EMI Calculator/EMI Calculator result.dart';
import 'GST Calculator/GST Calculator Result Screen.dart';
import 'GST Calculator/GST Calculator Screen.dart';
import 'Get Started Screen/Get Started.dart';
import 'HomeScreen/HomeScreen.dart';
import 'IFSC & MICR Select Bank/IFSC & MICR Detail Screen.dart';
import 'IFSC & MICR Select Bank/IFSC & MICR Select Bank Screen.dart';
import 'IFSC & MICR Select Bank/IFSC All Detail.dart';
import 'Interest calculation/Interest Calculation Pie Chart Screen.dart';
import 'Interest calculation/Interest Calculation Result Screen.dart';
import 'Interest calculation/Interest Calculation Screen.dart';
import 'Interest calculation/interest Calculation Detail Screen.dart';
import 'Investment Calculate/Investment Calculate Screen.dart';
import 'Investment Calculate/Investment Calculation Result Screen.dart';
import 'Loan Calculator/Loan Calculator Detail Screen.dart';
import 'Loan Calculator/Loan Calculator Pie Chart Screen.dart';
import 'Loan Calculator/Loan Calculator Result Screen.dart';
import 'Loan Calculator/Loan Calculator Screen.dart';
import 'Loan Period/Loan Period Detail Screen.dart';
import 'Loan Period/Loan Period Pie Chart Screen.dart';
import 'Loan Period/Loan Period Result Screen.dart';
import 'Loan Period/Loan Period Screen.dart';
import 'Lumpsum Calculation/Lumpsum Calculation Result Screen.dart';
import 'Lumpsum Calculation/Lumpsum Calculation Screen.dart';
import 'Missed Call Bank List/Bank statement Detail Screen.dart';
import 'Missed Call Bank List/Missed Call Bank List Screen.dart';
import 'Near By place/Near By Place Screen.dart';
import 'Net Banking/Net Banking webview screen.dart';
import 'Net Banking/Net banking detail scren.dart';
import 'Net Banking/Net banking.dart';
import 'PPF Calculation/PPF Calculation Detail Screen.dart';
import 'PPF Calculation/PPF Calculation Pie Chart Screen.dart';
import 'PPF Calculation/PPF Calculation Result Screen.dart';
import 'PPF Calculation/PPF Calculation Screen.dart';
import 'RD Calculation/RD Calculation Result Screen.dart';
import 'RD Calculation/RD Calculation Screen.dart';
import 'SIP Calculation/SIP Calculation Result Screen.dart';
import 'SIP Calculation/SIP Calculation Screen.dart';
import 'SMS Banking Screen/Bank Balance/Bank Balance.dart';
import 'SMS Banking Screen/SMS Banking Screen.dart';
import 'SMS Banking Screen/SMS bank Detail Screen.dart';
import 'Setting/Privacy Screen.dart';
import 'Setting/Setting Screen.dart';
import 'Simple Calculation/Simple Calculation Detail Screen.dart';
import 'Simple Calculation/Simple Calculation Pie Chart Screen.dart';
import 'Simple Calculation/Simple Calculation Result Screen.dart';
import 'Simple Calculation/Sinple Calculation Screen.dart';
import 'USSD Screen/All Bank USSD Code.dart';
import 'USSD Screen/setup dial.dart';
import 'USSD Screen/ussd Screen.dart';

final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
RxMap remoteconfig = {}.obs;

Future initConfig() async {
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 1),
    minimumFetchInterval: const Duration(seconds: 10),
  ));
  await remoteConfig.fetchAndActivate();
}

AppOpenAd? appOpenAd;

loadAd() {
  AppOpenAd.load(
    // adUnitId: "/6499/example/app-open",
    adUnitId: remoteconfig.value['AppOpen AD'],
    orientation: AppOpenAd.orientationPortrait,
    request: const AdManagerAdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        print("Ad Loaded.................................");
        appOpenAd = ad;
        // isLoaded=true;
        ad.show();
      },
      onAdFailedToLoad: (error) {
        // loadAd();
        AppOpenAd.load(
          // adUnitId: "/6499/example/app-open",
          adUnitId: remoteconfig.value['AppOpen AD'],
          // adUnitId: "ca-app-pub-3940256099942544/3419835294",
          orientation: AppOpenAd.orientationPortrait,
          request: const AdManagerAdRequest(),
          adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad) {
              print("Ad Loaded.................................");
              appOpenAd = ad;
              // isLoaded=true;
              ad.show();
            },
            onAdFailedToLoad: (error) {
              // loadAd();
              // Handle the error.
            },
          ),
        );

        // Handle the error.
      },
    ),
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  initConfig().whenComplete(() {
    remoteconfig.value = json.decode(remoteConfig.getString('BankApp'));
    loadAd();
  });
  runApp(
    GetMaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => LogoScreen(),
        '/GetStartedScreen': (context) => const GetStartedScreen(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/SettingScreen': (context) => const SettingScreen(),
        '/SMSBankingScreen': (context) => const SMSBankingScreen(),
        '/NetBankingScreen': (context) => const NetBankingScreen(),
        '/USSDBankingScreen': (context) => const USSDBankingScreen(),
        '/FinanceCalculatorScreen': (context) =>
            const FinanceCalculatorScreen(),
        '/EPFBalancePassbookScreen': (context) =>
            const EPFBalancePassbookScreen(),
        '/BankHolidayScreen': (context) => BankHolidayScreen(),
        '/NearByPlaceScreen': (context) => const NearByPlaceScreen(),
        '/MissedCallBankScreen': (context) => const MissedCallBankScreen(),
        '/IFSCBankScreen': (context) => IFSCBankScreen(),
        '/PrivacyScreen': (context) => const PrivacyScreen(),
        '/SMSBankDetailScreen': (context) => SMSBankDetailScreen(),
        '/SMSBankBalanceScreen': (context) => SMSBankBalanceScreen(),
        '/NetBankingDetailScreen': (context) => NetBankingDetailScreen(),
        '/NetBankingWebScreen': (context) => const NetBankingWebScreen(),
        '/AllBankUSSDCodeScreen': (context) => const AllBankUSSDCodeScreen(),
        '/SetUpDialScreen': (context) => SetUpDialScreen(),
        '/CompareLoanScreen': (context) => CompareLoanScreen(),
        '/EMICalculatorScreen': (context) => const EMICalculatorScreen(),
        '/EMIAdvanceScreen': (context) => const EMIAdvanceScreen(),
        '/LoanCalculatorScreen': (context) => LoanCalculatorScreen(),
        '/InterestCalculationScreen': (context) => InterestCalculationScreen(),
        '/LoanPeriodScreen': (context) => LoanPeriodScreen(),
        '/FDCalculationScreen': (context) => const FDCalculationScreen(),
        '/RDCalculationScreen': (context) => RDCalculationScreen(),
        '/PPFCalculationScreen': (context) => PPFCalculationScreen(),
        '/SimpleCalculationScreen': (context) => SimpleCalculationScreen(),
        '/InvestmentCalculateScreen': (context) => InvestmentCalculateScreen(),
        '/SIPCalculationScreen': (context) => const SIPCalculationScreen(),
        '/LumpsumCalculationScreen': (context) => LumpsumCalculationScreen(),
        '/GSTCalculatorScreen': (context) => const GSTCalculatorScreen(),
        '/CompareLoanResultScreen': (context) => CompareLoanResultScreen(),
        '/EMICalculatorResultScreen': (context) => EMICalculatorResultScreen(),
        '/EMICalculatorDetailScreen': (context) => EMICalculatorDetailScreen(),
        '/EMICalculatorPieChartScreen': (context) =>
            EMICalculatorPieChartScreen(),
        '/EMICalculatorBarChartScreen': (context) =>
            const EMICalculatorBarChartScreen(),
        '/EMIAdvanceResultScreen': (context) => const EMIAdvanceResultScreen(),
        '/LoanCalculatorResultScreen': (context) =>
            const LoanCalculatorResultScreen(),
        '/LoanCalculatorDetailScreen': (context) =>
            LoanCalculatorDetailScreen(),
        '/LoanCalculatorPieChartScreen': (context) =>
            const LoanCalculatorPieChartScreen(),
        '/InterestCalculationResultScreen': (context) =>
            const InterestCalculationResultScreen(),
        '/InterestCalculationDetailScreen': (context) =>
            InterestCalculationDetailScreen(),
        '/InterestCalculationPieChartScreen': (context) =>
            InterestCalculationPieChartScreen(),
        '/LoanPeriodResultScreen': (context) => const LoanPeriodResultScreen(),
        '/LoanPeriodDetailScreen': (context) => LoanPeriodDetailScreen(),
        '/LoanPeriodPieChartScreen': (context) => LoanPeriodPieChartScreen(),
        '/FDCalculationResultScreen': (context) =>
            const FDCalculationResultScreen(),
        '/RDCalculationResultScreen': (context) =>
            const RDCalculationResultScreen(),
        '/PPFCalculationResultScreen': (context) =>
            const PPFCalculationResultScreen(),
        '/PPFCalculationDetailScreen': (context) =>
            PPFCalculationDetailScreen(),
        '/PPFCalculationPieChartScreen': (context) =>
            PPFCalculationPieChartScreen(),
        '/SimpleCalculationResultScreen': (context) =>
            const SimpleCalculationResultScreen(),
        '/SimpleCalculationDetailScreen': (context) =>
            SimpleCalculationDetailScreen(),
        '/SimpleCalculationPieChartScreen': (context) =>
            SimpleCalculationPieChartScreen(),
        '/InvestmentResultScreen': (context) => const InvestmentResultScreen(),
        '/SIPCalculationResultScreen': (context) =>
            SIPCalculationResultScreen(),
        '/LumpsumCalculationResultScreen': (context) =>
            LumpsumCalculationResultScreen(),
        '/GSTCalculatorResultScreen': (context) =>
            const GSTCalculatorResultScreen(),
        '/BankHolidays': (context) => const BankHolidays(),
        '/BankStatementScreen': (context) => BankStatementScreen(),
        '/IFSCSelectBankScreenView': (context) =>
            const IFSCSelectBankScreenView(),
        '/IFSCAllDetail': (context) => IFSCAllDetail(),
      },
      debugShowCheckedModeBanner: false,
      home: LogoScreen(),
    ),
  );
}

/*void main() {
  runApp(
    const GetMaterialApp(
      home: FinanceCalculatorScreen(),
    ),
  );
}*/
