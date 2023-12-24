<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\{
    ZoneController,
    LanguageController,
    SystemController,
    DashboardController,
    ModuleController,
    UnitController,
    ParcelCategoryController,
    ParcelController,
    BusinessSettingsController,
    CustomRoleController,
    EmployeeController,
    ItemController,
    BannerController,
    CampaignController,
    CouponController,
    AttributeController,
    ConversationController,
    ContactController,
    VendorController,
    AddOnController,
    CategoryController,
    OrderController,
    NotificationController,
    SMSModuleController,
    FileManagerController,
    OrderCancelReasonController,
    SocialMediaController,
    DatabaseSettingController,
    DeliveryManController,
    CustomerWalletController,
    CustomerController,
    POSController,
    LoyaltyPointController,
    ReportController,
    DmVehicleController,
    AccountTransactionController,
    ReviewsController,
    ProvideDMEarningController,

};


Route::group(['namespace' => 'Admin', 'as' => 'admin.'], function () {
    Route::get('zone/get-coordinates/{id}', [ZoneController::class, 'get_coordinates'])->name('zone.get-coordinates');

    Route::group(['middleware' => ['admin', 'current-module']], function () {
        Route::get('lang/{locale}', [LanguageController::class, 'lang'])->name('lang');
        Route::get('settings', [SystemController::class, 'settings'])->name('settings');
        Route::post('settings', [SystemController::class, 'settings_update']);
        Route::post('settings-password', [SystemController::class, 'settings_password_update'])->name('settings-password');
        Route::get('/get-store-data', [SystemController::class, 'store_data'])->name('get-store-data');
        Route::post('remove_image', [BusinessSettingsController::class, 'remove_image'])->name('remove_image');
        //dashboard
        Route::get('/', [DashboardController::class, 'dashboard'])->name('dashboard');
        // Route::resource('account-transaction', 'AccountTransactionController')->middleware('module:collect_cash');
        // Route::get('export-account-transaction', 'AccountTransactionController@export_account_transaction')->name('export-account-transaction');
        // Route::post('search-account-transaction', 'AccountTransactionController@search_account_transaction')->name('search-account-transaction');

        // Route::resource('provide-deliveryman-earnings', 'ProvideDMEarningController')->middleware('module:provide_dm_earning');
        // Route::get('export-deliveryman-earnings', 'ProvideDMEarningController@dm_earning_list_export')->name('export-deliveryman-earning');
        // Route::post('deliveryman-earnings-search', 'ProvideDMEarningController@search_deliveryman_earning')->name('search-deliveryman-earning');
        Route::get('maintenance-mode', [SystemController::class, 'maintenance_mode'])->name('maintenance-mode');

        Route::get('module/status/{id}/{status}',[ModuleController::class, 'status'])->middleware('module:module')->name('module.status');
        Route::get('module/type', [ModuleController::class, 'type'])->middleware('module:module')->name('module.type');
        Route::post('module/search', [ModuleController::class, 'search'])->middleware('module:module')->name('module.search');
        Route::get('module/export', [ModuleController::class, 'export'])->middleware('module:module')->name('module.export');
        Route::resource('module', '\App\Http\Controllers\Admin\ModuleController')->middleware('module:module')->except('show');
        Route::get('module/{id}', [ModuleController::class, 'show'])->name('show');

        Route::resource('unit',  '\App\Http\Controllers\Admin\UnitController')->middleware('module:unit');
        Route::post('unit/search', [UnitController::class, 'search'])->middleware('module:unit')->name('unit.search');
        Route::get('unit/export/{type}',  [UnitController::class, 'export'])->middleware('module:unit')->name('unit.export');

        Route::group(['prefix' => 'parcel', 'as' => 'parcel.', 'middleware' => ['module:parcel']], function () {
            Route::get('category/status/{id}/{status}', [ParcelCategoryController::class, 'status'])->name('category.status');
            Route::resource('category', '\App\Http\Controllers\Admin\ParcelCategoryController');
            Route::get('orders/{status}', [ParcelController::class, 'orders'])->name('orders');
            Route::get('details/{id}', [ParcelController::class, 'order_details'])->name('order.details');
            Route::get('settings', [ParcelController::class, 'settings'])->name('settings');
            Route::post('settings', [ParcelController::class, 'update_settings'])->name('update.settings');
            Route::get('dispatch/{status}', [ParcelController::class, 'dispatch_list'])->name('list');
        });

        Route::group(['prefix' => 'dashboard-stats', 'as' => 'dashboard-stats.'], function () {
            Route::post('order', [DashboardController::class, 'order'])->name('order');
            Route::post('zone', [DashboardController::class, 'zone'])->name('zone');
            Route::post('user-overview', [DashboardController::class, 'user_overview'])->name('user-overview');
            Route::post('commission-overview', [DashboardController::class, 'commission_overview'])->name('commission-overview');
            Route::post('business-overview', [DashboardController::class, 'business_overview'])->name('business-overview');
        });

        Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
            Route::get('create', [CustomRoleController::class, 'create'])->name('create');
            Route::post('create', [CustomRoleController::class, 'store']);
            Route::get('edit/{id}', [CustomRoleController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [CustomRoleController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [CustomRoleController::class, 'distroy'])->name('delete');
            Route::post('search', [CustomRoleController::class, 'search'])->name('search');
        });

        Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
            Route::get('add-new', [EmployeeController::class, 'add_new'])->name('add-new');
            Route::post('add-new', [EmployeeController::class, 'store']);
            Route::get('list', [EmployeeController::class, 'list'])->name('list');
            Route::get('update/{id}', [EmployeeController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [EmployeeController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [EmployeeController::class, 'distroy'])->name('delete');
            Route::post('search', [EmployeeController::class, 'search'])->name('search');
        });
        Route::post('item/variant-price', [ItemController::class, 'variant_price'])->name('item.variant-price');

        Route::group(['prefix' => 'item', 'as' => 'item.', 'middleware' => ['module:item']], function () {
            Route::get('add-new', [ItemController::class, 'index'])->name('add-new');
            Route::post('variant-combination', [ItemController::class, 'variant_combination'])->name('variant-combination');
            Route::post('store', [ItemController::class, 'store'])->name('store');
            Route::get('edit/{id}', [ItemController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [ItemController::class, 'update'])->name('update');
            Route::get('list', [ItemController::class, 'list'])->name('list');
            Route::delete('delete/{id}', [ItemController::class, 'delete'])->name('delete');
            Route::get('status/{id}/{status}', [ItemController::class, 'status'])->name('status');
            Route::get('review-status/{id}/{status}', [ItemController::class, 'reviews_status'])->name('reviews.status');
            Route::post('search', [ItemController::class, 'search'])->name('search');
            Route::get('export/{type}', [ItemController::class, 'export'])->name('export');
            Route::post('store/{store_id}/search', [ItemController::class, 'search_store'])->name('store-search');
            Route::get('reviews', [ItemController::class, 'review_list'])->name('reviews');
            Route::post('reviews/search', [ItemController::class, 'review_search'])->name('reviews.search');
            Route::get('remove-image', [ItemController::class, 'remove_image'])->name('remove-image');
            Route::get('view/{id}', [ItemController::class, 'view'])->name('view');
            Route::get('store-item-export/{type}/{store_id}', [ItemController::class, 'store_item_export'])->name('store-item-export');
            //ajax request
            Route::get('get-categories', [ItemController::class, 'get_categories'])->name('get-categories');
            Route::get('get-items', [ItemController::class, 'get_items'])->name('getitems');
            Route::post('food-variation-generate', [ItemController::class, 'food_variation_generator'])->name('food-variation-generate');
            Route::post('variation-generate', [ItemController::class, 'variation_generator'])->name('variation-generate');

            //Mainul
            Route::get('get-variations', [ItemController::class, 'get_variations'])->name('get-variations');
            Route::post('stock-update', [ItemController::class, 'stock_update'])->name('stock-update');

            //Import and export
            Route::get('bulk-import', [ItemController::class, 'bulk_import_index'])->name('bulk-import');
            Route::post('bulk-import', [ItemController::class, 'bulk_import_data']);
            Route::get('bulk-export', [ItemController::class, 'bulk_export_index'])->name('bulk-export-index');
            Route::post('bulk-export', [ItemController::class, 'bulk_export_data'])->name('bulk-export');
        });

        Route::group(['prefix' => 'banner', 'as' => 'banner.', 'middleware' => ['module:banner']], function () {
            Route::get('add-new', [BannerController::class, 'index'])->name('add-new');
            Route::post('store', [BannerController::class, 'store'])->name('store');
            Route::get('edit/{banner}', [BannerController::class, 'edit'])->name('edit');
            Route::post('update/{banner}', [BannerController::class, 'update'])->name('update');
            Route::get('status/{id}/{status}', [BannerController::class, 'status'])->name('status');
            Route::get('featured/{id}/{status}', [BannerController::class, 'featured'])->name('featured');
            Route::delete('delete/{banner}', [BannerController::class, 'delete'])->name('delete');
            Route::post('search', [BannerController::class, 'search'])->name('search');
        });

        Route::group(['prefix' => 'campaign', 'as' => 'campaign.', 'middleware' => ['module:campaign']], function () {
            Route::get('{type}/add-new', [CampaignController::class, 'index'])->name('add-new');
            Route::post('store/basic', [CampaignController::class, 'storeBasic'])->name('store-basic');
            Route::post('store/item', [CampaignController::class, 'storeItem'])->name('store-item');
            Route::get('{type}/edit/{campaign}', [CampaignController::class, 'edit'])->name('edit');
            Route::get('{type}/view/{campaign}', [CampaignController::class, 'view'])->name('view');
            Route::post('basic/update/{campaign}', [CampaignController::class, 'update'])->name('update-basic');
            Route::post('item/update/{campaign}', [CampaignController::class, 'updateItem'])->name('update-item');
            Route::get('remove-store/{campaign}/{store}', [CampaignController::class, 'remove_store'])->name('remove-store');
            Route::post('add-store/{campaign}', [CampaignController::class, 'addstore'])->name('addstore');
            Route::get('{type}/list', [CampaignController::class, 'list'])->name('list');
            Route::get('status/{type}/{id}/{status}', [CampaignController::class, 'status'])->name('status');
            Route::delete('delete/{campaign}', [CampaignController::class, 'delete'])->name('delete');
            Route::delete('item/delete/{campaign}', [CampaignController::class, 'delete_item'])->name('delete-item');
            Route::post('basic-search', [CampaignController::class, 'searchBasic'])->name('searchBasic');
            Route::post('item-search', [CampaignController::class, 'searchItem'])->name('searchItem');
            Route::get('store-confirmation/{campaign}/{id}/{status}', [CampaignController::class, 'store_confirmation'])->name('store_confirmation');
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

        Route::group(['prefix' => 'attribute', 'as' => 'attribute.', 'middleware' => ['module:attribute']], function () {
            Route::get('add-new', [AttributeController::class, 'index'])->name('add-new');
            Route::post('store', [AttributeController::class, 'store'])->name('store');
            Route::get('edit/{id}', [AttributeController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [AttributeController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [AttributeController::class, 'delete'])->name('delete');
            Route::post('search', [AttributeController::class, 'search'])->name('search');
            Route::get('export-attributes/{type}', [AttributeController::class, 'export_attributes'])->name('export-attributes');

//Import and export
            Route::get('bulk-import', [AttributeController::class, 'bulk_import_index'])->name('bulk-import');
            Route::post('bulk-import', [AttributeController::class, 'bulk_import_data']);
            Route::get('bulk-export', [AttributeController::class, 'bulk_export_index'])->name('bulk-export-index');
            Route::post('bulk-export', [AttributeController::class, 'bulk_export_data'])->name('bulk-export');
        });

        Route::group(['prefix' => 'message', 'as' => 'message.', 'middleware' => ['module:customer_management']], function () {
            Route::get('list', [ConversationController::class, 'list'])->name('list');
            Route::post('store/{user_id}', [ConversationController::class, 'store'])->name('store');
            Route::get('view/{conversation_id}/{user_id}', [ConversationController::class, 'view'])->name('view');
        });
        Route::group(['prefix' => 'contact', 'as' => 'contact.', 'middleware' => ['module:customer_management']], function () {
            Route::get('contact-list', [ContactController::class, 'list'])->name('contact-list');
            Route::delete('contact-delete/{id}', [ContactController::class, 'destroy'])->name('contact-delete');
            Route::get('contact-view/{id}', [ContactController::class, 'view'])->name('contact-view');
            Route::post('contact-update/{id}', [ContactController::class, 'update'])->name('contact-update');
            Route::post('contact-send-mail/{id}', [ContactController::class, 'send_mail'])->name('contact-send-mail');
            Route::post('contact-search', [ContactController::class, 'search'])->name('contact-search');
        });



        Route::group(['prefix' => 'store', 'as' => 'store.'], function () {
            Route::get('get-stores-data/{store}', [VendorController::class, 'get_store_data'])->name('get-stores-data');
            Route::get('store-filter/{id}', [VendorController::class, 'store_filter'])->name('storefilter');
            Route::get('get-account-data/{store}', [VendorController::class, 'get_account_data'])->name('storefilter');
            Route::get('get-stores', [VendorController::class, 'get_stores'])->name('get-stores');
            Route::get('get-addons', [VendorController::class, 'get_addons'])->name('get_addons');
            Route::group(['middleware' => ['module:store']], function () {
                Route::get('update-application/{id}/{status}', [VendorController::class, 'update_application'])->name('application');
                Route::get('add', [VendorController::class, 'index'])->name('add');
                Route::post('store', [VendorController::class, 'store'])->name('store');
                Route::get('edit/{id}', [VendorController::class, 'edit'])->name('edit');
                Route::post('update/{store}', [VendorController::class, 'update'])->name('update');
                Route::post('discount/{store}', [VendorController::class, 'discountSetup'])->name('discount');
                Route::post('update-settings/{store}', [VendorController::class, 'updateStoreSettings'])->name('update-settings');
                Route::delete('delete/{store}', [VendorController::class, 'destroy'])->name('delete');
                Route::delete('clear-discount/{store}', [VendorController::class, 'cleardiscount'])->name('clear-discount');
                Route::get('view/{store}/{tab?}/{sub_tab?}', [VendorController::class, 'view'])->name('view');
                Route::get('list', [VendorController::class, 'list'])->name('list');
                Route::get('pending-requests', [VendorController::class, 'pending_requests'])->name('pending-requests');
                Route::get('deny-requests', [VendorController::class, 'deny_requests'])->name('deny-requests');
                Route::post('search', [VendorController::class, 'search'])->name('search');
                Route::get('export', [VendorController::class, 'export'])->name('export');
                Route::get('export/cash/{type}/{store_id}', [VendorController::class, 'cash_export'])->name('cash_export');
                Route::get('export/order/{type}/{store_id}', [VendorController::class, 'order_export'])->name('order_export');
                Route::get('export/withdraw/{type}/{store_id}', [VendorController::class, 'withdraw_trans_export'])->name('withdraw_trans_export');
                Route::get('status/{store}/{status}', [VendorController::class, 'status'])->name('status');
                Route::get('featured/{store}/{status}', [VendorController::class, 'featured'])->name('featured');
                Route::get('toggle-settings-status/{store}/{status}/{menu}', [VendorController::class, 'store_status'])->name('toggle-settings');
                Route::post('status-filter', [VendorController::class, 'status_filter'])->name('status-filter');

                //Import and export
                Route::get('bulk-import', [VendorController::class, 'bulk_import_index'])->name('bulk-import');
                Route::post('bulk-import', [VendorController::class, 'bulk_import_data']);
                Route::get('bulk-export', [VendorController::class, 'bulk_export_index'])->name('bulk-export-index');
                Route::post('bulk-export', [VendorController::class, 'bulk_export_data'])->name('bulk-export');
                //Store schedule
                Route::post('add-schedule', [VendorController::class, 'add_schedule'])->name('add-schedule');
                Route::get('remove-schedule/{store_schedule}', [VendorController::class, 'remove_schedule'])->name('remove-schedule');
            });

            Route::group(['middleware' => ['module:withdraw_list']], function () {
                Route::post('withdraw-status/{id}', [VendorController::class, 'withdrawStatus'])->name('withdraw_status');
                Route::get('withdraw_list', [VendorController::class, 'withdraw'])->name('withdraw_list');
                Route::post('withdraw_search', [VendorController::class, 'withdraw_search'])->name('withdraw_search');
                Route::get('withdraw_export', [VendorController::class, 'withdraw_export'])->name('withdraw_export');
                Route::get('withdraw-view/{withdraw_id}/{seller_id}', [VendorController::class, 'withdraw_view'])->name('withdraw_view');
            });

            // message
            Route::get('message/{conversation_id}/{user_id}', [VendorController::class, 'conversation_view'])->name('message-view');
            Route::get('message/list', [VendorController::class, 'conversation_list'])->name('message-list');
        });

        Route::group(['prefix' => 'addon', 'as' => 'addon.', 'middleware' => ['module:addon']], function () {
            Route::get('add-new', [AddOnController::class, 'index'])->name('add-new');
            Route::post('store', [AddOnController::class, 'store'])->name('store');
            Route::get('edit/{id}', [AddOnController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [AddOnController::class, 'update'])->name('update');
            Route::delete('delete/{id}', [AddOnController::class, 'delete'])->name('delete');
            Route::get('status/{addon}/{status}', [AddOnController::class, 'status'])->name('status');
            Route::post('search', [AddOnController::class, 'search'])->name('search');
            // Import and export
            Route::get('bulk-import', [AddOnController::class, 'bulk_import_index'])->name('bulk-import');
            Route::post('bulk-import', [AddOnController::class, 'bulk_import_data']);
            Route::get('bulk-export', [AddOnController::class, 'bulk_export_index'])->name('bulk-export-index');
            Route::post('bulk-export', [AddOnController::class, 'bulk_export_data'])->name('bulk-export');});

        Route::group(['prefix' => 'category', 'as' => 'category.'], function () {
            Route::get('get-all', [CategoryController::class, 'get_all'])->name('category.get-all');
            Route::group(['middleware' => ['module:category']], function () {
                Route::get('add', [CategoryController::class, 'index'])->name('add');
                Route::get('add-sub-category', [CategoryController::class, 'sub_index'])->name('add-sub-category');
                Route::get('add-sub-sub-category', [CategoryController::class, 'sub_sub_index'])->name('add-sub-sub-category');
                Route::post('store', [CategoryController::class, 'store'])->name('store');
                Route::get('edit/{id}', [CategoryController::class, 'edit'])->name('edit');
                Route::post('update/{id}', [CategoryController::class, 'update'])->name('update');
                Route::get('update-priority/{category}', [CategoryController::class, 'update_priority'])->name('priority');
                Route::get('status/{id}/{status}', [CategoryController::class, 'status'])->name('status');
                Route::get('featured/{id}/{featured}', [CategoryController::class, 'featured'])->name('featured');
                Route::delete('delete/{id}', [CategoryController::class, 'delete'])->name('delete');
                Route::post('search', [CategoryController::class, 'search'])->name('search');
                Route::get('export-categories/{type}', [CategoryController::class, 'export_categories'])->name('export-categories');
                //Import and export
                Route::get('bulk-import', [CategoryController::class, 'bulk_import_index'])->name('bulk-import');
                Route::post('bulk-import', [CategoryController::class, 'bulk_import_data']);
                Route::get('bulk-export', [CategoryController::class, 'bulk_export_index'])->name('bulk-export-index');
                Route::post('bulk-export', [CategoryController::class, 'bulk_export_data'])->name('bulk-export');});
        });
        Route::get('order/generate-invoice/{id}', [OrderController::class, 'generate_invoice'])->name('order.generate-invoice');
        Route::get('order/print-invoice/{id}', [OrderController::class, 'print_invoice'])->name('order.print-invoice');
        Route::get('order/status', [OrderController::class, 'status'])->name('order.status');
        Route::group(['prefix' => 'order', 'as' => 'order.', 'middleware' => ['module:order']], function () {
            Route::get('list/{status}', [OrderController::class, 'list'])->name('list');
            Route::get('details/{id}', [OrderController::class, 'details'])->name('details');
            Route::get('all-details/{id}', [OrderController::class, 'all_details'])->name('all-details');

            // Route::put('status-update/{id}', [OrderController::class, 'status'])->name('status-update');
            Route::get('view/{id}', [OrderController::class, 'view'])->name('view');
            Route::post('update-shipping/{order}', [OrderController::class, 'update_shipping'])->name('update-shipping');
            Route::delete('delete/{id}', [OrderController::class, 'delete'])->name('delete');

            Route::get('add-delivery-man/{order_id}/{delivery_man_id}', [OrderController::class, 'add_delivery_man'])->name('add-delivery-man');
            Route::get('payment-status', [OrderController::class, 'payment_status'])->name('payment-status');

            Route::post('add-payment-ref-code/{id}', [OrderController::class, 'add_payment_ref_code'])->name('add-payment-ref-code');
            Route::get('store-filter/{store_id}', [OrderController::class, 'restaurnt_filter'])->name('store-filter');
            Route::get('filter/reset', [OrderController::class, 'filter_reset']);
            Route::post('filter', [OrderController::class, 'filter'])->name('filter');
            Route::get('search', [OrderController::class, 'search'])->name('search');
            Route::post('store/search', [OrderController::class, 'store_order_search'])->name('store-search');
            Route::get('store/export/{type}/{store_id}', [OrderController::class, 'store_order_export'])->name('store-export');
            //order update
            Route::post('add-to-cart', [OrderController::class, 'add_to_cart'])->name('add-to-cart');
            Route::post('remove-from-cart', [OrderController::class, 'remove_from_cart'])->name('remove-from-cart');
            Route::get('update/{order}', [OrderController::class, 'update'])->name('update');
            Route::get('edit-order/{order}', [OrderController::class, 'edit'])->name('edit');
            Route::get('quick-view', [OrderController::class, 'quick_view'])->name('quick-view');
            Route::get('quick-view-cart-item', [OrderController::class, 'quick_view_cart_item'])->name('quick-view-cart-item');
            Route::get('export-orders/{file_type}/{status}/{type}', [OrderController::class, 'export_orders'])->name('export');
            });
        // Refund
        Route::group(['prefix' => 'refund', 'as' => 'refund.', 'middleware' => ['module:order']], function () {
            Route::get('settings', [OrderController::class, 'refund_settings'])->name('refund_settings');
            Route::get('refund_mode', [OrderController::class, 'refund_mode'])->name('refund_mode');
            Route::post('refund_reason', [OrderController::class, 'refund_reason'])->name('refund_reason');
            Route::get('/status/{id}/{status}', [OrderController::class, 'reason_status'])->name('reason_status');
            Route::put('reason_edit/', [OrderController::class, 'reason_edit'])->name('reason_edit');
            Route::delete('reason_delete/{id}', [OrderController::class, 'reason_delete'])->name('reason_delete');
            Route::put('order_refund_rejection/', [OrderController::class, 'order_refund_rejection'])->name('order_refund_rejection');
            Route::get('/{status}', [OrderController::class, 'list'])->name('refund_attr');
        });

        Route::group(['prefix' => 'zone', 'as' => 'zone.', 'middleware' => ['module:zone']], function () {
            Route::get('/', [ZoneController::class, 'index'])->name('home');
            Route::post('store', [ZoneController::class, 'store'])->name('store');
            Route::get('edit/{id}', [ZoneController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [ZoneController::class, 'update'])->name('update');
            Route::get('module-setup/{id}', [ZoneController::class, 'module_setup'])->name('module-setup');
            Route::get('module-setup', [ZoneController::class, 'go_module_setup'])->name('go-module-setup');
            Route::get('instruction', [ZoneController::class, 'instruction'])->name('instruction');
            Route::post('module-update/{id}', [ZoneController::class, 'module_update'])->name('module-update');
            Route::delete('delete/{zone}', [ZoneController::class, 'destroy'])->name('delete');
            Route::get('status/{id}/{status}', [ZoneController::class, 'status'])->name('status');
            Route::get('digital-payment/{id}/{digital_payment}', [ZoneController::class, 'digital_payment'])->name('digital-payment');
            Route::get('cash-on-delivery/{id}/{cash_on_delivery}', [ZoneController::class, 'cash_on_delivery'])->name('cash-on-delivery');
            Route::post('search', [ZoneController::class, 'search'])->name('search');
            Route::get('export/{type}', [ZoneController::class, 'export'])->name('export');
            Route::get('zone-filter/{id}', [ZoneController::class, 'zone_filter'])->name('zonefilter');
            Route::get('get-all-zone-cordinates/{id?}', [ZoneController::class, 'get_all_zone_cordinates'])->name('zoneCoordinates');
        });

        Route::group(['prefix' => 'notification', 'as' => 'notification.', 'middleware' => ['module:notification']], function () {
            Route::get('add-new', [NotificationController::class, 'index'])->name('add-new');
            Route::post('store', [NotificationController::class, 'store'])->name('store');
            Route::get('edit/{id}', [NotificationController::class, 'edit'])->name('edit');
            Route::post('update/{id}', [NotificationController::class, 'update'])->name('update');
            Route::get('status/{id}/{status}', [NotificationController::class, 'status'])->name('status');
            Route::delete('delete/{id}', [NotificationController::class, 'delete'])->name('delete');
            Route::get('export/{type}', [NotificationController::class, 'export'])->name('export');
        });

        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.', 'middleware' => ['module:settings']], function () {
            Route::get('business-setup/{tab?}', [BusinessSettingsController::class, 'business_index'])->name('business-setup');
            Route::get('react-setup', [BusinessSettingsController::class, 'react_setup'])->name('react-setup');
            Route::post('react-update', [BusinessSettingsController::class, 'react_update'])->name('react-update');
            Route::post('update-setup', [BusinessSettingsController::class, 'business_setup'])->name('update-setup');
            Route::post('update-dm', [BusinessSettingsController::class, 'update_dm'])->name('update-dm');
            Route::post('update-store', [BusinessSettingsController::class, 'update_store'])->name('update-store');
            Route::post('update-order', [BusinessSettingsController::class, 'update_order'])->name('update-order');
            Route::get('app-settings', [BusinessSettingsController::class, 'app_settings'])->name('app-settings');
            Route::post('app-settings', [BusinessSettingsController::class, 'update_app_settings'])->name('app-settings');
            Route::get('pages/admin-landing-page-settings/{tab?}', [BusinessSettingsController::class, 'admin_landing_page_settings'])->name('admin-landing-page-settings');
            Route::post('pages/admin-landing-page-settings/{tab}', [BusinessSettingsController::class, 'update_admin_landing_page_settings'])->name('admin-landing-page-settings');
            Route::get('promotional-status/{id}/{status}', [BusinessSettingsController::class, 'promotional_status'])->name('promotional-status');
            Route::get('pages/admin-landing-page-settings/promotional-section/edit/{id}', [BusinessSettingsController::class, 'promotional_edit'])->name('promotional-edit');
            Route::post('promotional-section/update/{id}', [BusinessSettingsController::class, 'promotional_update'])->name('promotional-update');
            Route::delete('banner/delete/{banner}', [BusinessSettingsController::class, 'promotional_destroy'])->name('promotional-delete');
            Route::get('feature-status/{id}/{status}', [BusinessSettingsController::class, 'feature_status'])->name('feature-status');
            Route::get('pages/admin-landing-page-settings/feature-list/edit/{id}', [BusinessSettingsController::class, 'feature_edit'])->name('feature-edit');
            Route::post('feature-section/update/{id}', [BusinessSettingsController::class, 'feature_update'])->name('feature-update');
            Route::delete('feature/delete/{feature}', [BusinessSettingsController::class, 'feature_destroy'])->name('feature-delete');
            Route::get('criteria-status/{id}/{status}', [BusinessSettingsController::class, 'criteria_status'])->name('criteria-status');
            Route::get('pages/admin-landing-page-settings/why-choose-us/criteria-list/edit/{id}', [BusinessSettingsController::class, 'criteria_edit'])->name('criteria-edit');
            Route::post('criteria-section/update/{id}', [BusinessSettingsController::class, 'criteria_update'])->name('criteria-update');
            Route::delete('admin/criteria/delete/{criteria}', [BusinessSettingsController::class, 'criteria_destroy'])->name('criteria-delete');
            Route::get('review-status/{id}/{status}', [BusinessSettingsController::class, 'review_status'])->name('review-status');
            Route::get('pages/admin-landing-page-settings/testimonials/review-list/edit/{id}', [BusinessSettingsController::class, 'review_edit'])->name('review-edit');
            Route::post('review-section/update/{id}', [BusinessSettingsController::class, 'review_update'])->name('review-update');
            Route::delete('review/delete/{review}', [BusinessSettingsController::class, 'review_destroy'])->name('review-delete');
            Route::get('pages/react-landing-page-settings/{tab?}', [BusinessSettingsController::class, 'react_landing_page_settings'])->name('react-landing-page-settings');
            Route::post('pages/react-landing-page-settings/{tab?}', [BusinessSettingsController::class, 'update_react_landing_page_settings'])->name('react-landing-page-settings');
            Route::delete('react-landing-page-settings/{tab}/{key}', [BusinessSettingsController::class, 'delete_react_landing_page_settings'])->name('react-landing-page-settings-delete');
            Route::get('review-react-status/{id}/{status}', [BusinessSettingsController::class, 'review_react_status'])->name('review-react-status');
            Route::get('pages/react-landing-page-settings/testimonials/review-react-list/edit/{id}', [BusinessSettingsController::class, 'review_react_edit'])->name('review-react-edit');
            Route::post('review-react-section/update/{id}', [BusinessSettingsController::class, 'review_react_update'])->name('review-react-update');
            Route::delete('review-react/delete/{review}', [BusinessSettingsController::class, 'review_react_destroy'])->name('review-react-delete');
            Route::get('pages/flutter-landing-page-settings/{tab?}', [BusinessSettingsController::class, 'flutter_landing_page_settings'])->name('flutter-landing-page-settings');
            Route::post('pages/flutter-landing-page-settings/{tab}', [BusinessSettingsController::class, 'update_flutter_landing_page_settings'])->name('flutter-landing-page-settings');
            Route::get('flutter-criteria-status/{id}/{status}', [BusinessSettingsController::class, 'flutter_criteria_status'])->name('flutter-criteria-status');
            Route::get('pages/flutter-landing-page-settings/special-criteria/edit/{id}', [BusinessSettingsController::class, 'flutter_criteria_edit'])->name('flutter-criteria-edit');
            Route::post('flutter-criteria-section/update/{id}', [BusinessSettingsController::class, 'flutter_criteria_update'])->name('flutter-criteria-update');
            Route::delete('flutter/criteria/delete/{criteria}', [BusinessSettingsController::class, 'flutter_criteria_destroy'])->name('flutter-criteria-delete');
            Route::get('landing-page-settings/{tab?}', [BusinessSettingsController::class, 'landing_page_settings'])->name('landing-page-settings');
            Route::post('landing-page-settings/{tab}', [BusinessSettingsController::class, 'update_landing_page_settings'])->name('landing-page-settings');
            Route::delete('landing-page-settings/{tab}/{key}', [BusinessSettingsController::class, 'delete_landing_page_settings'])->name('landing-page-settings-delete');

            Route::get('login-url-setup', [BusinessSettingsController::class, 'login_url_page'])->name('login_url_page');
            Route::post('login-url-setup/update', [BusinessSettingsController::class, 'login_url_page_update'])->name('login_url_update');

            Route::get('email-setup/{type}/{tab?}', [BusinessSettingsController::class, 'email_index'])->name('email-setup');
            Route::post('email-setup/{type}/{tab?}', [BusinessSettingsController::class, 'update_email_index'])->name('email-setup');
            Route::get('email-status/{type}/{tab}/{status}', [BusinessSettingsController::class, 'update_email_status'])->name('email-status');

            Route::get('toggle-settings/{key}/{value}', [BusinessSettingsController::class, 'toggle_settings'])->name('toggle-settings');
            Route::get('site_direction', [BusinessSettingsController::class, 'site_direction'])->name('site_direction');

            Route::get('fcm-index', [BusinessSettingsController::class, 'fcm_index'])->name('fcm-index');
            Route::get('fcm-config', [BusinessSettingsController::class, 'fcm_config'])->name('fcm-config');
            Route::post('update-fcm', [BusinessSettingsController::class, 'update_fcm'])->name('update-fcm');

            Route::post('update-fcm-messages', [BusinessSettingsController::class, 'update_fcm_messages'])->name('update-fcm-messages');
            Route::get('currency-add', [BusinessSettingsController::class, 'currency_index'])->name('currency-add');
            Route::post('currency-add', [BusinessSettingsController::class, 'currency_store']);
            Route::get('currency-update/{id}', [BusinessSettingsController::class, 'currency_edit'])->name('currency-update');
            Route::put('currency-update/{id}', [BusinessSettingsController::class, 'currency_update']);
            Route::delete('currency-delete/{id}', [BusinessSettingsController::class, 'currency_delete'])->name('currency-delete');

            Route::get('pages/business-page/terms-and-conditions', [BusinessSettingsController::class, 'terms_and_conditions'])->name('terms-and-conditions');
            Route::post('pages/business-page/terms-and-conditions', [BusinessSettingsController::class, 'terms_and_conditions_update']);

            Route::get('pages/business-page/privacy-policy', [BusinessSettingsController::class, 'privacy_policy'])->name('privacy-policy');
            Route::post('pages/business-page/privacy-policy', [BusinessSettingsController::class, 'privacy_policy_update']);

            Route::get('pages/business-page/about-us', [BusinessSettingsController::class, 'about_us'])->name('about-us');
            Route::post('pages/business-page/about-us', [BusinessSettingsController::class, 'about_us_update']);

            Route::get('pages/business-page/refund', [BusinessSettingsController::class, 'refund_policy'])->name('refund');
            Route::post('pages/business-page/refund', [BusinessSettingsController::class, 'refund_update']);
            Route::get('pages/refund-policy/{status}', [BusinessSettingsController::class, 'refund_policy_status'])->name('refund-policy-status');

            Route::get('pages/business-page/cancelation', [BusinessSettingsController::class, 'cancellation_policy'])->name('cancelation');
            Route::post('pages/business-page/cancelation', [BusinessSettingsController::class, 'cancellation_policy_update']);
            Route::get('pages/cancellation-policy/{status}', [BusinessSettingsController::class, 'cancellation_policy_status'])->name('cancellation-policy-status');

            Route::get('pages/business-page/shipping-policy', [BusinessSettingsController::class, 'shipping_policy'])->name('shipping-policy');
            Route::post('pages/business-page/shipping-policy', [BusinessSettingsController::class, 'shipping_policy_update']);
            Route::get('pages/shipping-policy/{status}', [BusinessSettingsController::class, 'shipping_policy_status'])->name('shipping-policy-status');

            // Social media
            Route::get('social-media/fetch', [SocialMediaController::class, 'fetch'])->name('social-media.fetch');
            Route::get('social-media/status-update', [SocialMediaController::class, 'social_media_status_update'])->name('social-media.status-update');
            Route::resource('pages/social-media', '\App\Http\Controllers\Admin\SocialMediaController');
            Route::group(['prefix' => 'file-manager', 'as' => 'file-manager.'], function () {
                Route::get('/download/{file_name}', [FileManagerController::class, 'download'])->name('download');
                Route::get('/index/{folder_path?}', [FileManagerController::class, 'index'])->name('index');
                Route::post('/image-upload', [FileManagerController::class, 'upload'])->name('image-upload');
                Route::delete('/delete/{file_path}', [FileManagerController::class, 'destroy'])->name('destroy');});

            Route::group(['prefix' => 'third-party', 'as' => 'third-party.'], function () {
                Route::get('sms-module', [SMSModuleController::class, 'sms_index'])->name('sms-module');
                Route::post('sms-module-update/{sms_module}', [SMSModuleController::class, 'sms_update'])->name('sms-module-update');
                Route::get('payment-method', [BusinessSettingsController::class, 'payment_index'])->name('payment-method');
                Route::post('payment-method-update/{payment_method}', [BusinessSettingsController::class, 'payment_update'])->name('payment-method-update');
                Route::get('config-setup', [BusinessSettingsController::class, 'config_setup'])->name('config-setup');
                Route::post('config-update', [BusinessSettingsController::class, 'config_update'])->name('config-update');
                Route::get('mail-config', [BusinessSettingsController::class, 'mail_index'])->name('mail-config');
                Route::get('test-mail', [BusinessSettingsController::class, 'test_mail'])->name('test');
                Route::post('mail-config', [BusinessSettingsController::class, 'mail_config']);
                Route::post('mail-config-status', [BusinessSettingsController::class, 'mail_config_status'])->name('mail-config-status');
                Route::get('send-mail', [BusinessSettingsController::class, 'send_mail'])->name('mail.send');// social media login
                Route::group(['prefix' => 'social-login', 'as' => 'social-login.'], function () {
                    Route::get('view', [BusinessSettingsController::class, 'viewSocialLogin'])->name('view');
                    Route::post('update/{service}', [BusinessSettingsController::class, 'updateSocialLogin'])->name('update');
                });
                //recaptcha
                Route::get('recaptcha', [BusinessSettingsController::class, 'recaptcha_index'])->name('recaptcha_index');
                Route::post('recaptcha-update', [BusinessSettingsController::class, 'recaptcha_update'])->name('recaptcha_update');
            });



            //db clean
            Route::get('db-index', [DatabaseSettingController::class, 'db_index'])->name('db-index');
            Route::post('db-clean', [DatabaseSettingController::class, 'clean_db'])->name('clean-db');

            Route::group(['prefix' => 'language', 'as' => 'language.'], function () {
                Route::get('', [LanguageController::class, 'index'])->name('index');
                Route::post('add-new', [LanguageController::class, 'store'])->name('add-new');
                Route::get('update-status', [LanguageController::class, 'update_status'])->name('update-status');
                Route::get('update-default-status', [LanguageController::class, 'update_default_status'])->name('update-default-status');
                Route::post('update', [LanguageController::class, 'update'])->name('update');
                Route::get('translate/{lang}', [LanguageController::class, 'translate'])->name('translate');
                Route::post('translate-submit/{lang}', [LanguageController::class, 'translate_submit'])->name('translate-submit');
                Route::post('remove-key/{lang}', [LanguageController::class, 'translate_key_remove'])->name('remove-key');
                Route::get('delete/{lang}', [LanguageController::class, 'delete'])->name('delete');
                Route::any('auto-translate/{lang}', [LanguageController::class, 'auto_translate'])->name('auto-translate');
            });

            Route::get('order-cancel-reasons/status/{id}/{status}', [OrderCancelReasonController::class, 'status'])->name('order-cancel-reasons.status');
            Route::get('order-cancel-reasons', [OrderCancelReasonController::class, 'index'])->name('order-cancel-reasons.index');
            Route::post('order-cancel-reasons/store', [OrderCancelReasonController::class, 'store'])->name('order-cancel-reasons.store');
            Route::put('order-cancel-reasons/update', [OrderCancelReasonController::class, 'update'])->name('order-cancel-reasons.update');
            Route::delete('order-cancel-reasons/destroy/{id}', [OrderCancelReasonController::class, 'destroy'])->name('order-cancel-reasons.destroy');
        });
        Route::group(['prefix' => 'business-settings', 'as' => 'business-settings.'], function () {
            //module
            Route::get('module/status/{id}/{status}', [ModuleController::class, 'status'])->middleware('module:module')->name('module.status');
            Route::get('module/type', [ModuleController::class, 'type'])->middleware('module:module')->name('module.type');
            Route::post('module/search', [ModuleController::class, 'search'])->middleware('module:module')->name('module.search');
            Route::get('module/export', [ModuleController::class, 'export'])->middleware('module:module')->name('module.export');
            Route::resource('module', '\App\Http\Controllers\Admin\ModuleController')->middleware('module:module');
            //zone
            Route::group(['prefix' => 'zone', 'as' => 'zone.', 'middleware' => ['module:zone']], function () {
                Route::get('/', [ZoneController::class, 'index'])->name('home');
                Route::post('store', [ZoneController::class, 'store'])->name('store');
                Route::get('edit/{id}', [ZoneController::class, 'edit'])->name('edit');
                Route::post('update/{id}', [ZoneController::class, 'update'])->name('update');
                Route::get('module-setup/{id}', [ZoneController::class, 'module_setup'])->name('module-setup');
                Route::post('module-update/{id}', [ZoneController::class, 'module_update'])->name('module-update');
                Route::delete('delete/{zone}', [ZoneController::class, 'destroy'])->name('delete');
                Route::get('status/{id}/{status}', [ZoneController::class, 'status'])->name('status');
                Route::post('search', [ZoneController::class, 'search'])->name('search');
                Route::get('export/{type}', [ZoneController::class, 'export'])->name('export');
                Route::get('zone-filter/{id}', [ZoneController::class, 'zone_filter'])->name('zonefilter');
                Route::get('get-all-zone-cordinates/{id?}', [ZoneController::class, 'get_all_zone_cordinates'])->name('zoneCoordinates');
            });
        });

        Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
            Route::get('get-deliverymen', [DeliveryManController::class, 'get_deliverymen'])->name('get-deliverymen');
            Route::get('get-account-data/{deliveryman}', [DeliveryManController::class, 'get_account_data'])->name('storefilter');
            Route::group(['middleware' => ['module:deliveryman']], function () {
                Route::get('add', [DeliveryManController::class, 'index'])->name('add');
                Route::post('store', [DeliveryManController::class, 'store'])->name('store');
                Route::get('list', [DeliveryManController::class, 'list'])->name('list');
                Route::get('new', [DeliveryManController::class, 'new_delivery_man'])->name('new');
                Route::get('deny', [DeliveryManController::class, 'deny_delivery_man'])->name('deny');
                Route::get('preview/{id}/{tab?}', [DeliveryManController::class, 'preview'])->name('preview');
                Route::get('status/{id}/{status}', [DeliveryManController::class, 'status'])->name('status');
                Route::get('earning/{id}/{status}', [DeliveryManController::class, 'earning'])->name('earning');
                Route::get('update-application/{id}/{status}', [DeliveryManController::class, 'update_application'])->name('application');
                Route::get('edit/{id}', [DeliveryManController::class, 'edit'])->name('edit');
                Route::post('update/{id}', [DeliveryManController::class, 'update'])->name('update');
                Route::delete('delete/{id}', [DeliveryManController::class, 'delete'])->name('delete');
                Route::post('search', [DeliveryManController::class, 'search'])->name('search');
                Route::get('export', [DeliveryManController::class, 'export'])->name('export');

                Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                    Route::get('list', [DeliveryManController::class, 'reviews_list'])->name('list');
                    Route::post('search', [DeliveryManController::class, 'review_search'])->name('search');
                    Route::get('status/{id}/{status}', [DeliveryManController::class, 'reviews_status'])->name('status');
                });

                // message
                Route::get('message/{conversation_id}/{user_id}', [DeliveryManController::class, 'conversation_view'])->name('message-view');
                Route::get('{user_id}/message/list', [DeliveryManController::class, 'conversation_list'])->name('message-list');
                Route::get('messages/details', [DeliveryManController::class, 'get_conversation_list'])->name('message-list-search'); });
        });
        // Subscribed customer Routes
        Route::group(['prefix' => 'customer', 'as' => 'customer.'], function () {



            Route::group(['prefix' => 'wallet', 'as' => 'wallet.', 'middleware' => ['module:customer_wallet']], function () {
                Route::get('add-fund', [CustomerWalletController::class, 'add_fund_view'])->name('add-fund');
                Route::post('add-fund', [CustomerWalletController::class, 'add_fund']);
                Route::get('report', [CustomerWalletController::class, 'report'])->name('report');
            });
            Route::group(['middleware' => ['module:customer_management']], function () {

                // Subscribed customer Routes
                Route::get('subscribed', [CustomerController::class, 'subscribedCustomers'])->name('subscribed');
                Route::post('subscriber-search', [CustomerController::class, 'subscriberMailSearch'])->name('subscriberMailSearch');
                Route::get('subscriber-search', [CustomerController::class, 'subscribed_customer_export'])->name('subscriber-export');

                Route::get('loyalty-point/report', [LoyaltyPointController::class, 'report'])->name('loyalty-point.report');
                Route::get('settings', [CustomerController::class, 'settings'])->name('settings');
                Route::post('update-settings', [CustomerController::class, 'update_settings'])->name('update-settings');
                Route::get('export', [CustomerController::class, 'export'])->name('export');});
        });
        //Pos system
        Route::group(['prefix' => 'pos', 'as' => 'pos.'], function () {
            Route::post('variant_price', [POSController::class, 'variant_price'])->name('variant_price');
            Route::group(['middleware' => ['module:pos']], function () {
                Route::get('/', [POSController::class, 'index'])->name('index');
                Route::get('quick-view', [POSController::class, 'quick_view'])->name('quick-view');
                Route::get('quick-view-cart-item', [POSController::class, 'quick_view_card_item'])->name('quick-view-cart-item');
                Route::post('add-to-cart', [POSController::class, 'addToCart'])->name('add-to-cart');
                Route::post('remove-from-cart', [POSController::class, 'removeFromCart'])->name('remove-from-cart');
                Route::post('cart-items', [POSController::class, 'cart_items'])->name('cart_items');
                Route::post('update-quantity', [POSController::class, 'updateQuantity'])->name('updateQuantity');
                Route::post('empty-cart', [POSController::class, 'emptyCart'])->name('emptyCart');
                Route::post('tax', [POSController::class, 'update_tax'])->name('tax');
                Route::post('discount', [POSController::class, 'update_discount'])->name('discount');
                Route::get('customers', [POSController::class, 'get_customers'])->name('customers');
                Route::post('order', [POSController::class, 'place_order'])->name('order');
                Route::get('orders', [POSController::class, 'order_list'])->name('orders');
                Route::post('search', [POSController::class, 'search'])->name('search');
                Route::get('order-details/{id}', [POSController::class, 'order_details'])->name('order-details');
                Route::get('invoice/{id}', [POSController::class, 'generate_invoice']);
                Route::post('customer-store', [POSController::class, 'customer_store'])->name('customer-store');
                Route::post('add-delivery-address', [POSController::class, 'addDeliveryInfo'])->name('add-delivery-address');
                Route::get('data', [POSController::class, 'extra_charge'])->name('extra_charge');});
        });

        Route::group(['prefix' => 'reviews', 'as' => 'reviews.', 'middleware' => ['module:customer_management']], function () {
            Route::get('list', [ReviewsController::class, 'list'])->name('list');
            Route::post('search', [ReviewsController::class, 'search'])->name('search');
        });

        Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
            Route::get('order', [ReportController::class, 'order_index'])->name('order');
            Route::get('transaction-report', [ReportController::class, 'day_wise_report'])->name('transaction-report');
            Route::get('item-wise-report', [ReportController::class, 'item_wise_report'])->name('item-wise-report');
            Route::get('item-wise-export', [ReportController::class, 'item_wise_export'])->name('item-wise-export');
            Route::post('item-wise-report-search', [ReportController::class, 'item_search'])->name('item-wise-report-search');
            Route::post('day-wise-report-search', [ReportController::class, 'day_search'])->name('day-wise-report-search');
            Route::get('day-wise-report-export', [ReportController::class, 'day_wise_export'])->name('day-wise-report-export');
            Route::get('order-transactions', [ReportController::class, 'order_transaction'])->name('order-transaction');
            Route::get('earning', [ReportController::class, 'earning_index'])->name('earning');
            Route::post('set-date', [ReportController::class, 'set_date'])->name('set-date');
            Route::get('stock-report', [ReportController::class, 'stock_report'])->name('stock-report');
            Route::post('stock-report', [ReportController::class, 'stock_search'])->name('stock-search');
            Route::get('stock-wise-report-search', [ReportController::class, 'stock_wise_export'])->name('stock-wise-report-export');
            Route::get('order-report', [ReportController::class, 'order_report'])->name('order-report');
            Route::post('order-report-search', [ReportController::class, 'search_order_report'])->name('search_order_report');
            Route::get('order-report-export', [ReportController::class, 'order_report_export'])->name('order-report-export');
            Route::get('store-wise-report', [ReportController::class, 'store_summary_report'])->name('store-summary-report');
            Route::post('store-summary-report-search', [ReportController::class, 'store_summary_search'])->name('store-summary-report-search');
            Route::get('store-summary-report-export', [ReportController::class, 'store_summary_export'])->name('store-summary-report-export');
            Route::get('store-wise-sales-report', [ReportController::class, 'store_sales_report'])->name('store-sales-report');
            Route::post('store-wise-sales-report-search', [ReportController::class, 'store_sales_search'])->name('store-sales-report-search');
            Route::get('store-wise-sales-report-export', [ReportController::class, 'store_sales_export'])->name('store-sales-report-export');
            Route::get('store-wise-order-report', [ReportController::class, 'store_order_report'])->name('store-order-report');
            Route::post('store-wise-order-report-search', [ReportController::class, 'store_order_search'])->name('store-order-report-search');
            Route::get('store-wise-order-report-export', [ReportController::class, 'store_order_export'])->name('store-order-report-export');
            Route::get('expense-report', [ReportController::class, 'expense_report'])->name('expense-report');
            Route::get('expense-export', [ReportController::class, 'expense_export'])->name('expense-export');
            Route::post('expense-report-search', [ReportController::class, 'expense_search'])->name('expense-report-search');
            Route::get('generate-statement/{id}', [ReportController::class, 'generate_statement'])->name('generate-statement');
        });

        Route::get('customer/select-list', [CustomerController::class, 'get_customers'])->name('customer.select-list');


        Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customer_management']], function () {
            Route::get('list', [CustomerController::class, 'customer_list'])->name('list');
            Route::get('view/{user_id}', [CustomerController::class, 'view'])->name('view');
            Route::post('search', [CustomerController::class, 'search'])->name('search');
            Route::get('status/{customer}/{status}', [CustomerController::class, 'status'])->name('status');
        });


        Route::group(['prefix' => 'file-manager', 'as' => 'file-manager.'], function () {
            Route::get('/download/{file_name}', [FileManagerController::class, 'download'])->name('download');
            Route::get('/index/{folder_path?}', [FileManagerController::class, 'index'])->name('index');
            Route::post('/image-upload', [FileManagerController::class, 'upload'])->name('image-upload');
            Route::delete('/delete/{file_path}', [FileManagerController::class, 'destroy'])->name('destroy');
        });

        // social media login
        Route::group(['prefix' => 'social-login', 'as' => 'social-login.', 'middleware' => ['module:business_settings']], function () {
            Route::get('view', [BusinessSettingsController::class, 'viewSocialLogin'])->name('view');
            Route::post('update/{service}', [BusinessSettingsController::class, 'updateSocialLogin'])->name('update');
        });
        Route::group(['prefix' => 'apple-login', 'as' => 'apple-login.'], function () {
            Route::post('update/{service}', [BusinessSettingsController::class, 'updateAppleLogin'])->name('update');
        });
        Route::get('store/report', function () {
            return view('store_report');
        });

        Route::group(['prefix' => 'dispatch', 'as' => 'dispatch.'], function () {
            Route::get('/', [DashboardController::class, 'dispatch_dashboard'])->name('dashboard');
            Route::group(['middleware' => ['module:order']], function () {
                Route::get('list/{module?}/{status?}', [OrderController::class, 'dispatch_list'])->name('list');
                Route::get('parcel/list/{module?}/{status?}', [ParcelController::class, 'parcel_dispatch_list'])->name('parcel.list');
                Route::get('order/details/{id}', [OrderController::class, 'details'])->name('order.details');
                Route::get('order/generate-invoice/{id}', [OrderController::class, 'generate_invoice'])->name('order.generate-invoice');
            });
        });

        Route::group(['prefix' => 'users', 'as' => 'users.'], function () {
            Route::get('/', [DashboardController::class, 'user_dashboard'])->name('dashboard');
            Route::group(['prefix' => 'delivery-man', 'as' => 'delivery-man.'], function () {
                Route::get('get-deliverymen', [DeliveryManController::class, 'get_deliverymen'])->name('get-deliverymen');
                Route::get('get-account-data/{deliveryman}', [DeliveryManController::class, 'get_account_data'])->name('storefilter');
                Route::group(['middleware' => ['module:deliveryman']], function () {
                    Route::get('add', [DeliveryManController::class, 'index'])->name('add');
                    Route::post('store', [DeliveryManController::class, 'store'])->name('store');
                    Route::get('list', [DeliveryManController::class, 'list'])->name('list');
                    Route::get('new', [DeliveryManController::class, 'new_delivery_man'])->name('new');
                    Route::get('deny', [DeliveryManController::class, 'deny_delivery_man'])->name('deny');
                    Route::get('preview/{id}/{tab?}', [DeliveryManController::class, 'preview'])->name('preview');
                    Route::get('status/{id}/{status}', [DeliveryManController::class, 'status'])->name('status');
                    Route::get('earning/{id}/{status}', [DeliveryManController::class, 'earning'])->name('earning');
                    Route::get('update-application/{id}/{status}', [DeliveryManController::class, 'update_application'])->name('application');
                    Route::get('edit/{id}', [DeliveryManController::class, 'edit'])->name('edit');
                    Route::post('update/{id}', [DeliveryManController::class, 'update'])->name('update');
                    Route::delete('delete/{id}', [DeliveryManController::class, 'delete'])->name('delete');
                    Route::post('search', [DeliveryManController::class, 'search'])->name('search');
                    Route::post('active-search', [DeliveryManController::class, 'active_search'])->name('active-search');

                    Route::get('export', [DeliveryManController::class, 'export'])->name('export');

                    Route::group(['prefix' => 'reviews', 'as' => 'reviews.'], function () {
                        Route::get('list', [DeliveryManController::class, 'reviews_list'])->name('list');
                        Route::post('search', [DeliveryManController::class, 'review_search'])->name('search');
                        Route::get('status/{id}/{status}', [DeliveryManController::class, 'reviews_status'])->name('status');
                    });

                    // message
                    Route::get('message/{conversation_id}/{user_id}', [DeliveryManController::class, 'conversation_view'])->name('message-view');
                    Route::get('{user_id}/message/list', [DeliveryManController::class, 'conversation_list'])->name('message-list');
                    Route::get('messages/details', [DeliveryManController::class, 'get_conversation_list'])->name('message-list-search');

                    Route::group(['prefix' => 'vehicle', 'as' => 'vehicle.'], function () {
                        Route::get('list', [DmVehicleController::class, 'list'])->name('list');
                        Route::get('add', [DmVehicleController::class, 'create'])->name('create');
                        Route::get('status/{vehicle}/{status}', [DmVehicleController::class, 'status'])->name('status');
                        Route::get('edit/{id}', [DmVehicleController::class, 'edit'])->name('edit');
                        Route::post('store', [DmVehicleController::class, 'store'])->name('store');
                        Route::post('update/{vehicle}', [DmVehicleController::class, 'update'])->name('update');
                        Route::delete('delete', [DmVehicleController::class, 'destroy'])->name('delete');
                        Route::get('view/{vehicle}', [DmVehicleController::class, 'view'])->name('view');
                    });
                });
            });
            // Subscribed customer Routes
            Route::group(['prefix' => 'customer', 'as' => 'customer.'], function () {


                Route::group(['prefix' => 'wallet', 'as' => 'wallet.', 'middleware' => ['module:customer_management']], function () {
                    Route::get('add-fund', [CustomerWalletController::class, 'add_fund_view'])->name('add-fund');
                    Route::post('add-fund', [CustomerWalletController::class, 'add_fund']);
                    Route::get('report', [CustomerWalletController::class, 'report'])->name('report');
                });

                Route::group(['middleware' => ['module:customer_management']], function () {

                    // Subscribed customer Routes
                    Route::get('subscribed', [CustomerController::class, 'subscribedCustomers'])->name('subscribed');
                    Route::post('subscriber-search', [CustomerController::class, 'subscriberMailSearch'])->name('subscriberMailSearch');
                    Route::get('subscriber-search', [CustomerController::class, 'subscribed_customer_export'])->name('subscriber-export');

                    Route::get('loyalty-point/report', [LoyaltyPointController::class, 'report'])->name('loyalty-point.report');
                    Route::get('settings', [CustomerController::class, 'settings'])->name('settings');
                    Route::post('update-settings', [CustomerController::class, 'update_settings'])->name('update-settings');
                    Route::get('export', [CustomerController::class, 'export'])->name('export');
                });
            });
            Route::get('customer/select-list', [CustomerController::class, 'get_customers'])->name('customer.select-list');

            Route::group(['prefix' => 'customer', 'as' => 'customer.', 'middleware' => ['module:customer_management']], function () {
                Route::get('list', [CustomerController::class, 'customer_list'])->name('list');
                Route::get('view/{user_id}', [CustomerController::class, 'view'])->name('view');
                Route::post('search', [CustomerController::class, 'search'])->name('search');
                Route::get('status/{customer}/{status}', [CustomerController::class, 'status'])->name('status');
            });
            Route::group(['prefix' => 'contact', 'as' => 'contact.', 'middleware' => ['module:customer_management']], function () {
                Route::get('contact-list', [ContactController::class, 'list'])->name('contact-list');
                Route::delete('contact-delete/{id}', [ContactController::class, 'destroy'])->name('contact-delete');
                Route::get('contact-view/{id}', [ContactController::class, 'view'])->name('contact-view');
                Route::post('contact-update/{id}', [ContactController::class, 'update'])->name('contact-update');
                Route::post('contact-send-mail/{id}', [ContactController::class, 'send_mail'])->name('contact-send-mail');
                Route::post('contact-search', [ContactController::class, 'search'])->name('contact-search');});

            Route::group(['prefix' => 'custom-role', 'as' => 'custom-role.', 'middleware' => ['module:custom_role']], function () {
                Route::get('create', [CustomRoleController::class, 'create'])->name('create');
                Route::post('create', [CustomRoleController::class, 'store']);
                Route::get('edit/{id}', [CustomRoleController::class, 'edit'])->name('edit');
                Route::post('update/{id}', [CustomRoleController::class, 'update'])->name('update');
                Route::delete('delete/{id}', [CustomRoleController::class, 'distroy'])->name('delete');
                Route::post('search', [CustomRoleController::class, 'search'])->name('search');
            });

            Route::group(['prefix' => 'employee', 'as' => 'employee.', 'middleware' => ['module:employee']], function () {
                Route::get('add-new', [EmployeeController::class, 'add_new'])->name('add-new');
                Route::post('add-new', [EmployeeController::class, 'store']);
                Route::get('list', [EmployeeController::class, 'list'])->name('list');
                Route::get('update/{id}', [EmployeeController::class, 'edit'])->name('edit');
                Route::post('update/{id}', [EmployeeController::class, 'update'])->name('update');
                Route::delete('delete/{id}', [EmployeeController::class, 'distroy'])->name('delete');
                Route::post('search', [EmployeeController::class, 'search'])->name('search');
            });
        });
        Route::group(['prefix' => 'transactions', 'as' => 'transactions.'], function () {
            Route::get('/', [DashboardController::class, 'transaction_dashboard'])->name('dashboard');
            Route::get('order/details/{id}', [OrderController::class, 'details'])->name('order.details');
            Route::get('parcel/order/details/{id}', [ParcelController::class, 'order_details'])->name('parcel.order.details');
            Route::get('order/generate-invoice/{id}', [OrderController::class, 'generate_invoice'])->name('order.generate-invoice');
            Route::get('customer/view/{user_id}', [CustomerController::class, 'view'])->name('customer.view');
            Route::get('item/view/{id}', [ItemController::class, 'view'])->name('item.view');
            Route::group(['prefix' => 'report', 'as' => 'report.', 'middleware' => ['module:report']], function () {
                Route::get('order', [ReportController::class, 'order_index'])->name('order');
                Route::get('day-wise-report', [ReportController::class, 'day_wise_report'])->name('day-wise-report');
                Route::get('item-wise-report', [ReportController::class, 'item_wise_report'])->name('item-wise-report');
                Route::get('item-wise-export', [ReportController::class, 'item_wise_export'])->name('item-wise-export');
                Route::post('item-wise-report-search', [ReportController::class, 'item_search'])->name('item-wise-report-search');
                Route::post('day-wise-report-search', [ReportController::class, 'day_search'])->name('day-wise-report-search');
                Route::get('day-wise-report-export', [ReportController::class, 'day_wise_export'])->name('day-wise-report-export');
                Route::get('order-transactions', [ReportController::class, 'order_transaction'])->name('order-transaction');
                Route::get('earning', [ReportController::class, 'earning_index'])->name('earning');
                Route::post('set-date', [ReportController::class, 'set_date'])->name('set-date');
                Route::get('stock-report', [ReportController::class, 'stock_report'])->name('stock-report');
                Route::post('stock-report', [ReportController::class, 'stock_search'])->name('stock-search');
                Route::get('stock-wise-report-search', [ReportController::class, 'stock_wise_export'])->name('stock-wise-report-export');
                Route::get('order-report', [ReportController::class, 'order_report'])->name('order-report');
                Route::post('order-report-search', [ReportController::class, 'search_order_report'])->name('search_order_report');
                Route::get('order-report-export', [ReportController::class, 'order_report_export'])->name('order-report-export');
                Route::get('store-wise-report', [ReportController::class, 'store_summary_report'])->name('store-summary-report');
                Route::post('store-summary-report-search', [ReportController::class, 'store_summary_search'])->name('store-summary-report-search');
                Route::get('store-summary-report-export', [ReportController::class, 'store_summary_export'])->name('store-summary-report-export');
                Route::get('store-wise-sales-report', [ReportController::class, 'store_sales_report'])->name('store-sales-report');
                Route::post('store-wise-sales-report-search', [ReportController::class, 'store_sales_search'])->name('store-sales-report-search');
                Route::get('store-wise-sales-report-export', [ReportController::class, 'store_sales_export'])->name('store-sales-report-export');
                Route::get('store-wise-order-report', [ReportController::class, 'store_order_report'])->name('store-order-report');
                Route::post('store-wise-order-report-search', [ReportController::class, 'store_order_search'])->name('store-order-report-search');
                Route::get('store-wise-order-report-export', [ReportController::class, 'store_order_export'])->name('store-order-report-export');
                Route::get('expense-report', [ReportController::class, 'expense_report'])->name('expense-report');
                Route::get('expense-export', [ReportController::class, 'expense_export'])->name('expense-export');
                Route::post('expense-report-search', [ReportController::class, 'expense_search'])->name('expense-report-search');
                Route::get('low-stock-report', [ReportController::class, 'low_stock_report'])->name('low-stock-report');
                Route::post('low-stock-report', [ReportController::class, 'low_stock_search'])->name('low-stock-search');
                Route::get('low-stock-wise-report-search', [ReportController::class, 'low_stock_wise_export'])->name('low-stock-wise-report-export');
            });

            // Route::resource('account-transaction', 'AccountTransactionController')->middleware('module:collect_cash');
            Route::group(['prefix' => 'account-transaction', 'as' => 'account-transaction.', 'middleware' => ['module:collect_cash']], function () {
                Route::get('list', [AccountTransactionController::class, 'index'])->name('index');
                Route::post('store', [AccountTransactionController::class, 'store'])->name('store');
                Route::get('details/{id}', [AccountTransactionController::class, 'show'])->name('view');
                Route::delete('delete/{id}', [AccountTransactionController::class, 'distroy'])->name('delete');
                Route::get('export', [AccountTransactionController::class, 'export_account_transaction'])->name('export');
                Route::post('search', [EmployeeController::class, 'search'])->name('search');
                Route::post('search', [AccountTransactionController::class, 'search_account_transaction'])->name('search');
            });

            Route::resource('provide-deliveryman-earnings', '\App\Http\Controllers\Admin\ProvideDMEarningController')->middleware('module:provide_dm_earning');
            //Route::group(['prefix' => 'provide-deliveryman-earnings', 'as' => 'provide-deliveryman-earnings.', 'middleware' => ['module:provide_dm_earning']], function () {
                Route::get('export-deliveryman-earnings', [ProvideDMEarningController::class, 'dm_earning_list_export'])->name('export-deliveryman-earning');
                Route::post('deliveryman-earnings-search', [ProvideDMEarningController::class, 'search_deliveryman_earning'])->name('search-deliveryman-earning');
            //});

            Route::group(['prefix' => 'store', 'as' => 'store.'], function () {
                // Route::group(function () {
                // Route::group(['middleware' => ['module:withdraw_list']], function () {
                Route::get('view/{store}/{tab?}/{sub_tab?}', [VendorController::class, 'view'])->name('view');
                Route::post('status-filter', [VendorController::class, 'status_filter'])->name('status-filter');
                Route::post('withdraw-status/{id}', [VendorController::class, 'withdrawStatus'])->name('withdraw_status');
                Route::get('withdraw_list', [VendorController::class, 'withdraw'])->name('withdraw_list');
                Route::post('withdraw_search', [VendorController::class, 'withdraw_search'])->name('withdraw_search');
                Route::get('withdraw_export', [VendorController::class, 'withdraw_export'])->name('withdraw_export');
                Route::get('withdraw-view/{withdraw_id}/{seller_id}', [VendorController::class, 'withdraw_view'])->name('withdraw_view');
                // });

            });
        });
    });
});
