<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\{
    ZoneController,
    ModuleController,
    NewsletterController,
    ConfigController,
    DeliverymanController,
    DeliveryManReviewController,
    ConversationController,
    TestimonialController,
    OrderController,
    WalletController,
    WishlistController,
    NotificationController,
    CustomerController,
    LoyaltyPointController,
    StoreController,
    BannerController,
    CampaignController,
    ParcelCategoryController
};
use App\Http\Controllers\Api\v1\Auth\{CustomerAuthController,
    PasswordResetController,
    DeliveryManLoginController,
    DMPasswordResetController,
    VendorLoginController,
    VendorPasswordResetController,
    SocialAuthController,
};
use App\Http\Controllers\Api\V1\Vendor\{
    VendorController,
    ReportController,
    UnitController,
    BusinessSettingsController,
    AttributeController,
    CouponController,
    AddOnController,
    CategoryController,
    DeliveryManController as VendorDeliveryManController ,
    ItemController,
    POSController,
    ConversationController as VendorConversationController,

};
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['namespace' => 'Api\V1', 'middleware'=>'localization'], function () {
    Route::get('zone/list', [ZoneController::class, 'get_zones']);

    Route::group(['prefix' => 'auth', 'namespace' => 'Auth'], function () {
        Route::post('sign-up', [CustomerAuthController::class, 'register']);
        Route::post('login', [CustomerAuthController::class, 'login']);
        Route::post('verify-phone', [CustomerAuthController::class, 'verify_phone']);

        Route::post('check-email', [CustomerAuthController::class, 'check_email']);
        Route::post('verify-email', [CustomerAuthController::class, 'verify_email']);

        Route::post('forgot-password', [PasswordResetController::class, 'reset_password_request']);
        Route::post('verify-token', [PasswordResetController::class, 'verify_token']);
        Route::put('reset-password', [PasswordResetController::class, 'reset_password_submit']);

        Route::group(['prefix' => 'delivery-man'], function () {
            Route::post('login', [DeliveryManLoginController::class, 'login']);
            Route::post('store', [DeliveryManLoginController::class, 'store']);

            Route::post('forgot-password', [DMPasswordResetController::class, 'reset_password_request']);
            Route::post('verify-token', [DMPasswordResetController::class, 'verify_token']);
            Route::put('reset-password', [DMPasswordResetController::class, 'reset_password_submit']);
        });
        Route::group(['prefix' => 'vendor'], function () {
            Route::post('login', [VendorLoginController::class, 'login']);
            Route::post('forgot-password', [VendorPasswordResetController::class, 'reset_password_request']);
            Route::post('verify-token', [VendorPasswordResetController::class, 'verify_token']);
            Route::put('reset-password', [VendorPasswordResetController::class, 'reset_password_submit']);
            Route::post('register', [VendorLoginController::class, 'register']);
        });

        Route::post('social-login', [SocialAuthController::class, 'social_login']);
        Route::post('social-register', [SocialAuthController::class, 'social_register']);
    });

    // Module
    Route::get('module', [ModuleController::class, 'index']);

    Route::post('newsletter/subscribe', [NewsletterController::class, 'index']);
    Route::get('landing-page', [ConfigController::class, 'landing_page']);
    Route::get('react-landing-page', [ConfigController::class, 'react_landing_page']);
    Route::get('flutter-landing-page', [ConfigController::class, 'flutter_landing_page']);

    Route::group(['prefix' => 'delivery-man'], function () {
        Route::get('last-location', [DeliverymanController::class, 'get_last_location']);

        Route::group(['prefix' => 'reviews', 'middleware' => ['auth:api']], function () {
            Route::get('/{delivery_man_id}', [DeliveryManReviewController::class, 'get_reviews']);
            Route::get('rating/{delivery_man_id}', [DeliveryManReviewController::class, 'get_rating']);
            Route::post('/submit', [DeliveryManReviewController::class, 'submit_review']);
        });
        Route::group(['middleware'=>['dm.api']], function () {
            Route::get('profile', [DeliverymanController::class, 'get_profile']);
            Route::get('notifications', [DeliverymanController::class, 'get_notifications']);
            Route::put('update-profile', [DeliverymanController::class, 'update_profile']);
            Route::post('update-active-status', [DeliverymanController::class, 'activeStatus']);
            Route::get('current-orders', [DeliverymanController::class, 'get_current_orders']);
            Route::get('latest-orders', [DeliverymanController::class, 'get_latest_orders']);
            Route::post('record-location-data', [DeliverymanController::class, 'record_location_data']);
            Route::get('all-orders', [DeliverymanController::class, 'get_all_orders']);
            Route::get('order-delivery-history', [DeliverymanController::class, 'get_order_history']);
            Route::put('accept-order', [DeliverymanController::class, 'accept_order']);
            Route::put('update-order-status', [DeliverymanController::class, 'update_order_status']);
            Route::put('update-payment-status', [DeliverymanController::class, 'order_payment_status_update']);
            Route::get('order-details', [DeliverymanController::class, 'get_order_details']);
            Route::get('order', [DeliverymanController::class, 'get_order']);
            Route::put('update-fcm-token', [DeliverymanController::class, 'update_fcm_token']);
            //Remove account
            Route::delete('remove-account', [DeliverymanController::class, 'remove_account']);
            // Chatting
            Route::group(['prefix' => 'message'], function () {
                Route::get('list', [ConversationController::class, 'dm_conversations']);
                Route::get('search-list', [ConversationController::class, 'dm_search_conversations']);
                Route::get('details', [ConversationController::class, 'dm_messages']);
                Route::post('send', [ConversationController::class, 'dm_messages_store']);
            });
        });
    });

    Route::group(['prefix' => 'vendor', 'namespace' => 'Vendor', 'middleware' => ['vendor.api']], function () {
        Route::get('notifications', [VendorController::class, 'get_notifications']);
        Route::get('profile', [VendorController::class, 'get_profile']);
        Route::post('update-active-status', [VendorController::class, 'active_status']);
        Route::get('earning-info', [VendorController::class, 'get_earning_data']);
        Route::put('update-profile', [VendorController::class, 'update_profile']);
        Route::get('current-orders', [VendorController::class, 'get_current_orders']);
        Route::get('completed-orders', [VendorController::class, 'get_completed_orders']);
        Route::get('canceled-orders', [VendorController::class, 'get_canceled_orders']);
        Route::get('all-orders', [VendorController::class, 'get_all_orders']);
        Route::put('update-order-status', [VendorController::class, 'update_order_status']);
        Route::put('update-order-amount', [VendorController::class, 'edit_order_amount']);
        Route::get('order-details', [VendorController::class, 'get_order_details']);
        Route::get('order', [VendorController::class, 'get_order']);
        Route::put('update-fcm-token', [VendorController::class, 'update_fcm_token']);
        Route::get('get-basic-campaigns', [VendorController::class, 'get_basic_campaigns']);
        Route::put('campaign-leave', [VendorController::class, 'remove_store']);
        Route::put('campaign-join', [VendorController::class, 'addstore']);
        Route::get('get-withdraw-list', [VendorController::class, 'withdraw_list']);
        Route::get('get-items-list', [VendorController::class, 'get_items']);
        Route::put('update-bank-info', [VendorController::class, 'update_bank_info']);
        Route::post('request-withdraw', [VendorController::class, 'request_withdraw']);
        Route::get('get-expense', [ReportController::class, 'expense_report']);

        // Remove account
        Route::delete('remove-account', [VendorController::class, 'remove_account']);

        Route::get('unit', [UnitController::class, 'index']);
        // Business setup
        Route::put('update-business-setup', [BusinessSettingsController::class, 'update_store_setup']);

        // Restaurant schedule
        Route::post('schedule/store', [BusinessSettingsController::class, 'add_schedule']);
        Route::delete('schedule/{store_schedule}', [BusinessSettingsController::class, 'remove_schedule']);

        // Attributes
        Route::get('attributes', [AttributeController::class, 'list']);

        // Addon
        Route::group(['prefix' => 'coupon'], function () {
            Route::get('list', [CouponController::class, 'list']);
            Route::get('view', [CouponController::class, 'view']);
            Route::get('view-without-translate', [CouponController::class, 'view_without_translate']);
            Route::post('store', [CouponController::class, 'store'])->name('store');
            Route::post('update', [CouponController::class, 'update']);
            Route::post('status', [CouponController::class, 'status'])->name('status');
            Route::post('delete', [CouponController::class, 'delete'])->name('delete');
            Route::post('search', [CouponController::class, 'search'])->name('search');
        });
        // Addon
        Route::group(['prefix' => 'addon'], function () {
            Route::get('/', [AddOnController::class, 'list']);
            Route::post('store', [AddOnController::class, 'store']);
            Route::put('update', [AddOnController::class, 'update']);
            Route::get('status', [AddOnController::class, 'status']);
            Route::delete('delete', [AddOnController::class, 'delete']);
        });

        // Category
        Route::group(['prefix' => 'categories'], function () {
            Route::get('/', [CategoryController::class, 'get_categories']);
            Route::get('childes/{category_id}', [CategoryController::class, 'get_childes']);
        });

        Route::group(['prefix' => 'delivery-man'], function () {
            Route::post('store', [VendorDeliveryManController::class, 'store']);
            Route::get('list', [VendorDeliveryManController::class, 'list']);
            Route::get('preview', [VendorDeliveryManController::class, 'preview']);
            Route::get('status', [VendorDeliveryManController::class, 'status']);
            Route::post('update/{id}', [VendorDeliveryManController::class, 'update']);
            Route::delete('delete', [VendorDeliveryManController::class, 'delete']);
            Route::post('search', [VendorDeliveryManController::class, 'search']);
        });
        Route::group(['prefix' => 'item'], function () {
            Route::post('store', [ItemController::class, 'store']);
            Route::put('update', [ItemController::class, 'update']);
            Route::delete('delete', [ItemController::class, 'delete']);
            Route::get('status', [ItemController::class, 'status']);
            Route::get('details/{id}', [ItemController::class, 'get_item']);
            Route::post('search', [ItemController::class, 'search']);
            Route::get('reviews', [ItemController::class, 'reviews']);
            Route::get('recommended', [ItemController::class, 'recommended']);
            Route::get('organic', [ItemController::class, 'organic']);
        });

        Route::group(['prefix' => 'pos'], function () {
            Route::get('orders', [POSController::class, 'order_list']);
            Route::post('place-order', [POSController::class, 'place_order']);
            Route::get('customers', [POSController::class, 'get_customers']);
        });

        Route::group(['prefix' => 'message'], function () {
            Route::get('list', [VendorConversationController::class, 'conversations']);
            Route::get('search-list', [VendorConversationController::class, 'search_conversations']);
            Route::get('details', [VendorConversationController::class, 'messages']);
            Route::post('send', [VendorConversationController::class, 'messages_store']);
        });

    });

    Route::group(['prefix' => 'config'], function () {
        Route::get('/', [ConfigController::class, 'configuration']);
        Route::get('/get-zone-id', [ConfigController::class, 'get_zone']);
        Route::get('place-api-autocomplete', [ConfigController::class, 'place_api_autocomplete']);
        Route::get('distance-api', [ConfigController::class, 'distance_api']);
        Route::get('place-api-details', [ConfigController::class, 'place_api_details']);
        Route::get('geocode-api', [ConfigController::class, 'geocode_api']);
    });

    Route::group(['prefix' => 'testimonial'], function () {
        Route::get('/', [TestimonialController::class, 'get_tetimonial_lists']);
    });

    Route::get('customer/order/cancellation-reasons', [OrderController::class, 'cancellation_reason']);

    Route::group(['middleware'=>['module-check']], function() {
        Route::group(['prefix' => 'customer', 'middleware' => 'auth:api'], function () {
            Route::get('notifications', [NotificationController::class, 'get_notifications']);
            Route::get('info', [CustomerController::class, 'info']);
            Route::get('update-zone', [CustomerController::class, 'update_zone']);
            Route::post('update-profile', [CustomerController::class, 'update_profile']);
            Route::post('update-interest', [CustomerController::class, 'update_interest']);
            Route::put('cm-firebase-token', [CustomerController::class, 'update_cm_firebase_token']);
            Route::get('suggested-items', [CustomerController::class, 'get_suggested_item']);
            //Remove account
            Route::delete('remove-account', [CustomerController::class, 'remove_account']);

            Route::group(['prefix' => 'address'], function () {
                Route::get('list', [CustomerController::class, 'address_list']);
                Route::post('add', [CustomerController::class, 'add_new_address']);
                Route::put('update/{id}', [CustomerController::class, 'update_address']);
                Route::delete('delete', [CustomerController::class, 'delete_address']);
            });

            Route::group(['prefix' => 'order'], function () {
                Route::get('list', [OrderController::class, 'get_order_list']);
                Route::get('running-orders', [OrderController::class, 'get_running_orders']);
                Route::get('details', [OrderController::class, 'get_order_details']);
                Route::post('place', [OrderController::class, 'place_order']);
                Route::post('prescription/place', [OrderController::class, 'prescription_place_order']);
                Route::put('cancel', [OrderController::class, 'cancel_order']);
                Route::post('refund-request', [OrderController::class, 'refund_request']);
                Route::get('refund-reasons', [OrderController::class, 'refund_reasons']);
                Route::get('track', [OrderController::class, 'track_order']);
                Route::put('payment-method', [OrderController::class, 'update_payment_method']);
            });

            // Chatting
            Route::group(['prefix' => 'message'], function () {
                Route::get('list', [ConversationController::class, 'conversations']);
                Route::get('search-list', [ConversationController::class, 'search_conversations']);
                Route::get('details', [ConversationController::class, 'messages']);
                Route::post('send', [ConversationController::class, 'messages_store']);
            });

            Route::group(['prefix' => 'wish-list'], function () {
                Route::get('/', [WishlistController::class, 'wish_list']);
                Route::post('add', [WishlistController::class, 'add_to_wishlist']);
                Route::delete('remove', [WishlistController::class, 'remove_from_wishlist']);
            });

            // Loyalty
            Route::group(['prefix' => 'loyalty-point'], function () {
                Route::post('point-transfer', [LoyaltyPointController::class, 'point_transfer']);
                Route::get('transactions', [LoyaltyPointController::class, 'transactions']);
            });

            Route::group(['prefix' => 'wallet'], function () {
                Route::get('transactions', [WalletController::class, 'transactions']);
            });
        });
        Route::group(['prefix' => 'items'], function () {
            Route::get('latest', [ItemController::class, 'get_latest_products']);
            Route::get('popular', [ItemController::class, 'get_popular_products']);
            Route::get('most-reviewed', [ItemController::class, 'get_most_reviewed_products']);
            Route::get('discounted', [ItemController::class, 'get_discounted_products']);
            Route::get('set-menu', [ItemController::class, 'get_set_menus']);
            Route::get('search', [ItemController::class, 'get_searched_products']);
            Route::get('search-suggestion', [ItemController::class, 'get_searched_products_suggestion']);
            Route::get('details/{id}', [ItemController::class, 'get_product']);
            Route::get('related-items/{item_id}', [ItemController::class, 'get_related_products']);
            Route::get('reviews/{item_id}', [ItemController::class, 'get_product_reviews']);
            Route::get('rating/{item_id}', [ItemController::class, 'get_product_rating']);
            Route::get('recommended', [ItemController::class, 'get_recommended']);
            Route::get('suggested', [ItemController::class, 'get_cart_suggest_products']);
            Route::post('reviews/submit', [ItemController::class, 'submit_product_review'])->middleware('auth:api');
        });

        Route::group(['prefix' => 'stores'], function () {
            Route::get('get-stores/{filter_data}', [StoreController::class, 'get_stores']);
            Route::get('latest', [StoreController::class, 'get_latest_stores']);
            Route::get('popular', [StoreController::class, 'get_popular_stores']);
            Route::get('details/{id}', [StoreController::class, 'get_details']);
            Route::get('reviews', [StoreController::class, 'reviews']);
            Route::get('search', [StoreController::class, 'get_searched_stores']);
        });

        Route::group(['prefix' => 'banners'], function () {
            Route::get('/', [BannerController::class, 'get_banners']);
        });

        Route::group(['prefix' => 'categories'], function () {
            Route::get('/', [CategoryController::class, 'get_categories']);
            Route::get('childes/{category_id}', [CategoryController::class, 'get_childes']);
            Route::get('items/{category_id}', [CategoryController::class, 'get_products']);
            Route::get('items/{category_id}/all', [CategoryController::class, 'get_all_products']);
            Route::get('stores/{category_id}', [CategoryController::class, 'get_stores']);
        });

        Route::group(['prefix' => 'campaigns'], function () {
            Route::get('basic', [CampaignController::class, 'get_basic_campaigns']);
            Route::get('basic-campaign-details', [CampaignController::class, 'basic_campaign_details']);
            Route::get('item', [CampaignController::class, 'get_item_campaigns']);
        });

        Route::group(['prefix' => 'coupon', 'middleware' => 'auth:api'], function () {
            Route::get('list', [CouponController::class, 'list']);
            Route::get('apply', [CouponController::class, 'apply']);
        });

        Route::get('parcel-category', [ParcelCategoryController::class, 'index']);
    });
        Route::get('vehicle/extra_charge', [ConfigController::class, 'extra_charge']);
        Route::get('get-vehicles', [ConfigController::class, 'get_vehicles']);

});
