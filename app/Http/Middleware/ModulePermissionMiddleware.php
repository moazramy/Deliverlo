<?php

namespace App\Http\Middleware;

use App\CentralLogics\Helpers;
use Brian2694\Toastr\Facades\Toastr;
use Closure;
use Illuminate\Http\Request;

class ModulePermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $module)
    {
        if (auth('admin')->check() && Helpers::module_permission_check($module)) {
            return $next($request);
        }
        else if (auth('vendor_employee')->check() || auth('vendor')->check()) {
            if(Helpers::employee_module_permission_check($module))
            {
                return $next($request);
            }
        }

        Toastr::error(translate('messages.access_denied'));
        return back();
    }
}
