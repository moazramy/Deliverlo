<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    HomeController,
    LoginController,
    NewsletterController,
    PaymentController,
    SslCommerzPaymentController,
    PaystackController,
    FlutterwaveController,
    MercadoPagoController,
    StripePaymentController,
    RazorPayController,
    SenangPayController,
    PaymobController,
    PaytabsController,
    BkashPaymentController,
    PaytmController,
    LiqPayController,
    VendorController,
    DeliveryManController,
    PaypalPaymentController
};

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Home routes
Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('lang/{locale}', [HomeController::class, 'lang'])->name('lang');
Route::get('terms-and-conditions', [HomeController::class, 'terms_and_conditions'])->name('terms-and-conditions');
Route::get('about-us', [HomeController::class, 'about_us'])->name('about-us');
Route::get('contact-us', [HomeController::class, 'contact_us'])->name('contact-us');
Route::post('send-message', [HomeController::class, 'send_message'])->name('send-message');
Route::get('privacy-policy', [HomeController::class, 'privacy_policy'])->name('privacy-policy');
Route::get('cancelation', [HomeController::class, 'cancelation'])->name('cancelation');
Route::get('refund', [HomeController::class, 'refund_policy'])->name('refund');
Route::get('shipping-policy', [HomeController::class, 'shipping_policy'])->name('shipping-policy');
Route::post('newsletter/subscribe', [NewsletterController::class, 'newsLetterSubscribe'])->name('newsletter.subscribe');

// Login routes
Route::get('login/{tab}', [LoginController::class, 'login'])->name('login');
Route::post('login_submit', [LoginController::class, 'submit'])->name('login_post');
Route::get('logout', [LoginController::class, 'logout'])->name('logout');
Route::get('/reload-captcha', [LoginController::class, 'reloadCaptcha'])->name('reload-captcha');
Route::get('/reset-password', [LoginController::class, 'reset_password_request'])->name('reset-password');
Route::post('/vendor-reset-password', [LoginController::class, 'vendor_reset_password_request'])->name('vendor-reset-password');
Route::get('/password-reset', [LoginController::class, 'reset_password'])->name('change-password');
Route::post('verify-otp', [LoginController::class, 'verify_token'])->name('verify-otp');
Route::post('reset-password-submit', [LoginController::class, 'reset_password_submit'])->name('reset-password-submit');
Route::get('otp-resent', [LoginController::class, 'otp_resent'])->name('otp_resent');

// Authentication Failed
Route::get('authentication-failed', function () {
    $errors = [];
    array_push($errors, ['code' => 'auth-001', 'message' => 'Unauthenticated.']);
    return response()->json([
        'errors' => $errors,
    ], 401);
})->name('authentication-failed');

// Payment-Mobile Routes
Route::group(['prefix' => 'payment-mobile'], function () {
    Route::get('/', [PaymentController::class, 'payment'])->name('payment-mobile');
    Route::get('set-payment-method/{name}', [PaymentController::class, 'set_payment_method'])->name('set-payment-method');
});

// SSLCOMMERZ Routes
Route::post('pay-ssl', [SslCommerzPaymentController::class, 'index'])->name('pay-ssl');
Route::post('/success', [SslCommerzPaymentController::class, 'success']);
Route::post('/fail', [SslCommerzPaymentController::class, 'fail']);
Route::post('/cancel', [SslCommerzPaymentController::class, 'cancel']);
Route::post('/ipn', [SslCommerzPaymentController::class, 'ipn']);
//SSLCOMMERZ END

// PayPal
Route::group(['prefix' => 'paypal', 'as' => 'paypal.'], function () {
    Route::get('pay', [PaypalPaymentController::class, 'payment'])->name('pay');
    Route::any('callback', [PaypalPaymentController::class, 'callback'])->name('callback')
        ->withoutMiddleware([\App\Http\Middleware\VerifyCsrfToken::class]);
    Route::any('cancel',  [PaypalPaymentController::class, 'cancel'])->name('cancel')
        ->withoutMiddleware([\App\Http\Middleware\VerifyCsrfToken::class]);
});


// Stripe
Route::get('pay-stripe', [StripePaymentController::class, 'payment_process_3d'])->name('pay-stripe');
Route::get('pay-stripe/success/{order_id}/{transaction_ref}', [StripePaymentController::class, 'success'])->name('pay-stripe.success');
Route::get('pay-stripe/fail', [StripePaymentController::class, 'fail'])->name('pay-stripe.fail');

// Razorpay
Route::get('paywithrazorpay', [RazorPayController::class, 'payWithRazorpay'])->name('paywithrazorpay');
Route::post('payment-razor/{order_id}', [RazorPayController::class, 'payment'])->name('payment-razor');

// Payment Success and Fail Routes
Route::get('payment-success', [PaymentController::class, 'success'])->name('payment-success');
Route::get('payment-fail', [PaymentController::class, 'fail'])->name('payment-fail');

// Senang Pay
Route::match(['get', 'post'], '/return-senang-pay', [SenangPayController::class, 'return_senang_pay'])->name('return-senang-pay');

// Paymob
Route::post('/paymob-credit', [PaymobController::class, 'credit'])->name('paymob-credit');
Route::get('/paymob-callback', [PaymobController::class, 'callback'])->name('paymob-callback');

// PAYSTACK
Route::get('/paystack-callback', [PaystackController::class, 'callback'])->name('paystack-callback');

// FLUTTERWAVE
Route::post('/flutterwave-pay', [FlutterwaveController::class, 'initialize'])->name('flutterwave_pay');
Route::get('/rave/callback/{payment_id}', [FlutterwaveController::class, 'callback'])->name('flutterwave_callback');

// MERCADOPAGO
Route::get('mercadopago/home', [MercadoPagoController::class, 'index'])->name('mercadopago.index');
Route::post('mercadopago/make-payment', [MercadoPagoController::class, 'make_payment'])->name('mercadopago.make_payment');
Route::get('mercadopago/get-user', [MercadoPagoController::class, 'get_test_user'])->name('mercadopago.get-user');

//paytabs
Route::any('/paytabs-payment', 'PaytabsController@payment')->name('paytabs-payment');
Route::any('/paytabs-response', 'PaytabsController@callback_response')->name('paytabs-response');

// Paytabs
Route::any('/paytabs-payment', [PaytabsController::class, 'payment'])->name('paytabs-payment');
Route::any('/paytabs-response', [PaytabsController::class, 'callback_response'])->name('paytabs-response');

// Bkash
Route::group(['prefix' => 'bkash'], function () {
    // Payment Routes for bKash
    Route::post('get-token', [BkashPaymentController::class, 'getToken'])->name('bkash-get-token');
    // ... Other routes for bKash ...

    // Callback Route for bKash
    Route::any('callback', [BkashPaymentController::class, 'callback'])->name('bkash-callback');

    // ... Other routes for bKash ...

});

// The callback URL after a payment for PAYTM
Route::get('paytm-payment', [PaytmController::class, 'payment'])->name('paytm-payment');
Route::any('paytm-response', [PaytmController::class, 'callback'])->name('paytm-response');

// The callback URL after a payment for LIQPAY
Route::get('liqpay-payment', [LiqPayController::class, 'payment'])->name('liqpay-payment');
Route::any('liqpay-callback/{order_id}', [LiqPayController::class, 'callback'])->name('liqpay-callback');

Route::get('/test', function () {
    dd('Hello tester');
});

Route::get('module-test', function () {
});

//Restaurant Registration
Route::group(['prefix' => 'store', 'as' => 'restaurant.'], function () {
    Route::get('apply', [VendorController::class, 'create'])->name('create');
    Route::post('apply', [VendorController::class, 'store'])->name('store');
    Route::get('get-all-modules', [VendorController::class, 'get_all_modules'])->name('get-all-modules');
});

//Deliveryman Registration
Route::group(['prefix' => 'deliveryman', 'as' => 'deliveryman.'], function () {
    Route::get('apply', [DeliveryManController::class, 'create'])->name('create');
    Route::post('apply', [DeliveryManController::class, 'store'])->name('store');
});
