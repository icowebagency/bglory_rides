const String apiBaseUrl = 'https://bg-ride.sky51event.uk/api';
const String driverSendSignUpOtpEndpoint = '$apiBaseUrl/driver/auth/send-otp';
const String driverVerifiyOtpEndpoint = '$apiBaseUrl/driver/auth/verify-otp';
const String getDriverProfileEndpoint = '$apiBaseUrl/driver/profile';
const String driverCompleteSignUpEndpoint =
    '$apiBaseUrl/driver/auth/complete-signup';
const String driverSendLoginOtpEndpoint = '$apiBaseUrl/driver/auth/login';
const String driverEarningsEndpoint = '$apiBaseUrl/driver/earnings';
const String driverSetTransactionPinEndpoint =
    '$apiBaseUrl/driver/set-transaction-pin';
const String driverWithdrawalEndpoint = '$apiBaseUrl/driver/withdrawal';
const String driverDriverTransactionHistoryEndpoint =
    '$apiBaseUrl/driver/transaction-history';
const String driverDriverTransactionInsightsEndpoint =
    '$apiBaseUrl/driver/insights';

const String driverDashboardEndpoint = '$apiBaseUrl/driver/dashboard';

const String sendRiderSignInOtp = '$apiBaseUrl/user/login/request-otp';
const String verifyRiderSignInOtp = '$apiBaseUrl/user/login/verify-otp';
const String sendRiderSignUpOtp = '$apiBaseUrl/user/send-otp';
const String verifyRiderSignUpOtp = '$apiBaseUrl/user/verify-otp';
const String getRiderProfileEndpoint = '$apiBaseUrl/user/profile';