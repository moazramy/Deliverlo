<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Vendor\{
    LanguageController,
    DashboardController,
    ReviewController,
    BusinessSettingsController,
    POSController,
    CategoryController,
    CustomRoleController,
    DeliveryManController,
    EmployeeController,
    ItemController,
    BannerController,
    CampaignController,
    WalletController,
    CouponController,
    AddOnController,
    OrderController,
    ProfileController,
    RestaurantController,
    ConversationController,
    ReportController
};

Route::group(['namespace' => 'Vendor', 'as' => 'vendor.'], function () {
    Route::group(['middleware' => ['vendor']], function () {
        Route::get('lang/{locale}', [LanguageController::class, 'lang'])->name('lang');
        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');
        Route::get('/get-store-data', [DashboardController::class, 'store_data'])->name('get-store-data');
        Route::post('/store-token', [DashboardController::class, 'updateDeviceToken'])->name('store.token');
        Route::get('/reviews', [ReviewController::class, 'index'])->name('reviews')->middleware('module:reviews');
        Route::get('site_direction', [BusinessSettingsController::class, 'site_direction_vendor'])->name('site_direction');

        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::post('variant_price', [POSController::class, 'variant_price'])->name('variant_price');
            Route::group(['middleware' => ['module:pos']], function () {
                Route::get('/', [POSController::class, 'index'])->name('index');
                Route::get('quick-view', [POSController::class, 'quick_view'])->name('quick-view');
                Route::get('quick-view-cart-item', [POSController::class, 'quick_view_card_item'])->name('quick-view-cart-item');
                Route::post('add-to-cart', [POSController::class, 'addToCart'])->name('add-to-cart');
                Route::post('add-delivery-info', [POSController::class, 'addDeliveryInfo'])->name('add-delivery-info');
                Route::post('remove-from-cart', [POSController::class, 'removeFromCart'])->name('remove-from-cart');
                Route::post('cart-items', [POSController::class, 'cart_items'])->name('cart_items');
                Route::post('update-quantity', [POSController::class, 'updateQuantity'])->name('updateQuantity');
                Route::post('empty-cart', [POSController::class, 'emptyCart'])->name('emptyCart');
                Route::post('tax', [POSController::class, 'update_tax'])->name('tax');
                Route::post('paid', [POSController::class, 'update_paid'])->name('paid');
                Route::post('discount', [POSController::class, 'update_discount'])->name('discount');
                Route::get('customers', [POSController::class, 'get_customers'])->name('customers');
                Route::post('order', [POSController::class, 'place_order'])->name('order');
                Route::get('orders', [POSController::class, 'order_list'])->name('orders');
                Route::post('search', [POSController::class, 'search'])->name('search');
                Route::get('order-details/{id}', [POSController::class, 'order_details'])->name('order-details');
                Route::get('invoice/{id}', [POSController::class, 'generate_invoice']);
                Route::post('customer-store', [POSController::class, 'customer_store'])->name('customer-store');
                Route::get('data', [POSController::class, 'extra_charge'])->name('extra_charge');
            });
        });

        Route::group(['prefix' => 'dashboard', 'as' => 'dashboard.'], function () {
            Route::post('order-stats', [DashboardController::class, 'order_stats'])->name('order-stats');
        });

        Route::group(['prefix' => 'category', 'as' => 'category.', 'middleware' => ['module:item']], function () {
            Route::get('get-all', [CategoryController::class, 'get_all'])->name('get-all');
            Route::get('list', [CategoryController::class, 'index'])->name('add');
            Route::get('sub-category-list', [CategoryController::class, 'sub_index'])->name('add-sub-category');
            Route::post('search', [CategoryController::class, 'search'])->name('search');
            Route::post('sub-search', [CategoryController::class, 'sub_search'])->name('sub-search');
            Route::get('export-categories/{type}', [CategoryController::class, 'export_categories'])->name('export-categories');
            Route::get('export-sub-categories/{type}', [CategoryController::class, 'export_sub_categories'])->name('export-sub-categories');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', [CustomRoleController::class, 'create'])->name('create');
            Route::post('create', [CustomRoleController::class, 'store'])->name('store');
            Route::get('edit/{id}', [CustomRoleController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [CustomRoleController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [CustomRoleController::class, 'distroy'])->name('delete');
            Route::post('search', [CustomRoleController::class, 'search'])->name('search');
        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.', 'middleware' => ['module:deliveryman']], function () {
            Route::get('add', [DeliveryManController::class, 'index'])->name('add');
            Route::post('store', [DeliveryManController::class, 'store'])->name('store');
            Route::get('list', [DeliveryManController::class, 'list'])->name('list');
            Route::get('preview/{id}/{tab?}', [DeliveryManController::class, 'preview'])->name('preview');
            Route::get('status/{id}/{status}', [DeliveryManController::class, 'status'])->name('status');
            Route::get('earning/{id}/{status}', [DeliveryManController::class, 'earning'])->name('earning');
            Route::get('edit/{id}', [DeliveryManController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [DeliveryManController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [DeliveryManController::class, 'delete'])->name('delete');
            Route::post('search', [DeliveryManController::class, 'search'])->name('search');
            Route::get('get-deliverymen', [DeliveryManController::class, 'get_deliverymen'])->name('get-deliverymen');
            Route::post('transation/search', [DeliveryManController::class, 'transaction_search'])->name('transaction-search');

            Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                Route::get('list', [DeliveryManController::class, 'reviews_list'])->name('list');
            });
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', [EmployeeController::class, 'add_new'])->name('add-new');
            Route::post('add-new', [EmployeeController::class, 'store']);
            Route::get('list', [EmployeeController::class, 'list'])->name('list');
            Route::get('edit/{id}', [EmployeeController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [EmployeeController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [EmployeeController::class, 'distroy'])->name('delete');
            Route::post('search', [EmployeeController::class, 'search'])->name('search');
            Route::get('list-export', [EmployeeController::class, 'list_export'])->name('export-employee');
        });

        Route::group(['prefix' => 'item', 'as' => 'item.', 'middleware' => ['module:item']], function () {
            Route::get('add-new', [ItemController::class, 'index'])->name('add-new');
            Route::post('variant-combination', [ItemController::class, 'variant_combination'])->name('variant-combination');
            Route::post('store', [ItemController::class, 'store'])->name('store');
            Route::get('edit/{id}', [ItemController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [ItemController::class, 'update'])->name('update');
            Route::get('list', [ItemController::class, 'list'])->name('list');
            Route::delete('delete/{id}', [ItemController::class, 'delete'])->name('delete');
            Route::get('status/{id}/{status}', [ItemController::class, 'status'])->name('status');
            Route::post('search', [ItemController::class, 'search'])->name('search');
            Route::get('view/{id}', [ItemController::class, 'view'])->name('view');
            Route::get('remove-image', [ItemController::class, 'remove_image'])->name('remove-image');
            Route::get('get-categories', [ItemController::class, 'get_categories'])->name('get-categories');
            Route::get('recommended/{id}/{status}', [ItemController::class, 'recommended'])->name('recommended');

            //Mainul
            Route::get('get-variations', [ItemController::class, 'get_variations'])->name('get-variations');
            Route::get('stock-limit-list', [ItemController::class, 'stock_limit_list'])->name('stock-limit-list');
            Route::post('stock-update', [ItemController::class, 'stock_update'])->name('stock-update');

            Route::post('food-variation-generate', [ItemController::class, 'food_variation_generator'])->name('food-variation-generate');
            Route::post('variation-generate', [ItemController::class, 'variation_generator'])->name('variation-generate');

            //Import and export
            Route::get('bulk-import', [ItemController::class, 'bulk_import_index'])->name('bulk-import');
            Route::post('bulk-import', [ItemController::class, 'bulk_import_data']);
            Route::get('bulk-export', [ItemController::class, 'bulk_export_index'])->name('bulk-export-index');
            Route::post('bulk-export', [ItemController::class, 'bulk_export_data'])->name('bulk-export');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('list', [BannerController::class, 'list'])->name('list');
            Route::get('join_campaign/{id}/{status}', [BannerController::class, 'status'])->name('status');
        });

        Route::group(['prefix' => 'campaign', 'as' => 'campaign.', 'middleware' => ['module:campaign']], function () {
            Route::get('list', [CampaignController::class, 'list'])->name('list');
            Route::get('item/list', [CampaignController::class, 'itemlist'])->name('itemlist');
            Route::get('remove-store/{campaign}/{store}', [CampaignController::class, 'remove_store'])->name('remove-store');
            Route::get('add-store/{campaign}/{store}', [CampaignController::class, 'addstore'])->name('add-store');
            Route::post('search', [CampaignController::class, 'search'])->name('search');
            Route::post('search-item', [CampaignController::class, 'searchItem'])->name('searchItem');
        });

        Route::group(['prefix' => 'wallet', 'as' => 'wallet.', 'middleware' => ['module:wallet']], function () {
            Route::get('/', [WalletController::class, 'index'])->name('index');
            Route::post('request', [WalletController::class, 'w_request'])->name('withdraw-request');
            Route::delete('close/{id}', [WalletController::class, 'close_request'])->name('close-request');
        });

        Route::group(['prefix' => 'coupon', 'as' => 'coupon.', 'middleware' => ['module:coupon']], function () {
            Route::get('add-new', [CouponController::class, 'add_new'])->name('add-new');
            Route::post('store', [CouponController::class, 'store'])->name('store');
            Route::get('update/{id}', [CouponController::class, 'edit'])->name('update');
            Route::post('update/{id}', [CouponController::class, 'update']);
            Route::get('status/{id}/{status}', [CouponController::class, 'status'])->name('status');
            Route::delete('delete/{id}', [CouponController::class, 'delete'])->name('delete');
            Route::post('search', [CouponController::class, 'search'])->name('search');
        });

        Route::group(['prefix' => 'addon', 'as' => 'addon.', 'middleware' => ['module:addon']], function () {
            Route::get('add-new', [AddOnController::class, 'index'])->name('add-new');
            Route::post('store', [AddOnController::class, 'store'])->name('store');
            Route::get('edit/{id}', [AddOnController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [AddOnController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [AddOnController::class, 'delete'])->name('delete');
        });

        Route::group(['prefix' => 'order', 'as' => 'order.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', [OrderController::class, 'list'])->name('list');
            Route::put('status-update/{id}', [OrderController::class, 'status'])->name('status-update');
            Route::post('search', [OrderController::class, 'search'])->name('search');
            Route::post('add-to-cart', [OrderController::class, 'add_to_cart'])->name('add-to-cart');
            Route::post('remove-from-cart', [OrderController::class, 'remove_from_cart'])->name('remove-from-cart');
            Route::get('update/{order}', [OrderController::class, 'update'])->name('update');
            Route::get('edit-order/{order}', [OrderController::class, 'edit'])->name('edit');
            Route::get('details/{id}', [OrderController::class, 'details'])->name('details');
            Route::get('status', [OrderController::class, 'status'])->name('status');
            Route::get('quick-view', [OrderController::class, 'quick_view'])->name('quick-view');
            Route::get('quick-view-cart-item', [OrderController::class, 'quick_view_cart_item'])->name('quick-view-cart-item');
            Route::get('generate-invoice/{id}', [OrderController::class, 'generate_invoice'])->name('generate-invoice');
            Route::post('add-payment-ref-code/{id}', [OrderController::class, 'add_payment_ref_code'])->name('add-payment-ref-code');
            Route::post('update-order-amount', [OrderController::class, 'edit_order_amount'])->name('update-order-amount');
            Route::post('update-discount-amount', [OrderController::class, 'edit_discount_amount'])->name('update-discount-amount');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:store_setup']], function () {
            Route::get('store-setup', [BusinessSettingsController::class, 'store_index'])->name('store-setup');
            Route::post('add-schedule', [BusinessSettingsController::class, 'add_schedule'])->name('add-schedule');
            Route::get('remove-schedule/{store_schedule}', [BusinessSettingsController::class, 'remove_schedule'])->name('remove-schedule');
            Route::get('update-active-status', [BusinessSettingsController::class, 'active_status'])->name('update-active-status');
            Route::post('update-setup/{store}', [BusinessSettingsController::class, 'store_setup'])->name('update-setup');
            Route::get('toggle-settings-status/{store}/{status}/{menu}', [BusinessSettingsController::class, 'store_status'])->name('toggle-settings');
        });

        Route::group(['prefix' => 'profile', 'as' => 'profile.', 'middleware' => ['module:bank_info']], function () {
            Route::get('view', [ProfileController::class, 'view'])->name('view');
            Route::post('update', [ProfileController::class, 'update'])->name('update');
            Route::post('settings-password', [ProfileController::class, 'settings_password_update'])->name('settings-password');
            Route::get('bank-view', [ProfileController::class, 'bank_view'])->name('bankView');
            Route::get('bank-edit', [ProfileController::class, 'bank_edit'])->name('bankInfo');
            Route::post('bank-update', [ProfileController::class, 'bank_update'])->name('bank_update');
            Route::post('bank-delete', [ProfileController::class, 'bank_delete'])->name('bank_delete');
        });

        Route::group(['prefix' => 'store', 'as' => 'shop.', 'middleware' => ['module:my_shop']], function () {
            Route::get('view', [RestaurantController::class, 'view'])->name('view');
            Route::get('edit', [RestaurantController::class, 'edit'])->name('edit');
            Route::post('update', [RestaurantController::class, 'update'])->name('update');
        });

        Route::group(['prefix' => 'message', 'as' => 'message.'], function () {
            Route::get('list', [ConversationController::class, 'list'])->name('list');
            Route::post('store/{user_id}/{user_type}', [ConversationController::class, 'store'])->name('store');
            Route::get('view/{conversation_id}/{user_id}', [ConversationController::class, 'view'])->name('view');
        });

        Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
            Route::post('set-date', [ReportController::class, 'set_date'])->name('set-date');
            Route::get('expense-report', [ReportController::class, 'expense_report'])->name('expense-report');
            Route::get('expense-export', [ReportController::class, 'expense_export'])->name('expense-export');
            Route::post('expense-report-search', [ReportController::class, 'expense_search'])->name('expense-report-search');
        });

    });
});
