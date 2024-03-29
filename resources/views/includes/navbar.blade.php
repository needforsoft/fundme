<?php
use Illuminate\Support\Arr;

$categoriesMenu = App\Models\Categories::where('mode','on')->orderBy('name')->take(6)->get();
$categoriesTotal = App\Models\Categories::count();
$settings = App\Models\AdminSettings::first();
?>
<div class="w-100 no-padding no-margin">
<div class="btn-block text-center showBanner padding-top-10 padding-bottom-10" style="display:none;">
	{{trans('misc.cookies_text')}} <button class="btn btn-sm btn-success"
		id="close-banner">{{trans('misc.agree')}}</button></div>

@if( Auth::check() && Auth::user()->status == 'pending' )
<div class="btn-block margin-top-zero text-center confirmEmail">{{trans('misc.confirm_email')}}
	<strong>{{Auth::user()->email}}</strong></div>
@endif
<div class="navbar-inverse padding-top-10 padding-bottom-10 w-100">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">

				<?php if( isset( $totalNotify ) ) : ?>
				<span class="notify"><?php echo $totalNotify; ?></span>
				<?php endif; ?>

				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="{{ url('/') }}">
				<img src="{{ asset('public/img/logo.png') }}" class="logo" />
			</a>
		</div><!-- navbar-header -->

		<div class="navbar-collapse collapse">

			<ul class="nav navbar-nav navbar-left">

				<li>
					<a href="#search" class="text-uppercase font-default">
						<i class="glyphicon glyphicon-search"></i> <span class="title-dropdown font-default">
							<strong>{{ trans('misc.search') }}</strong></span>
					</a>
				</li>

				<li class="dropdown">
					<a class="text-uppercase font-default" data-toggle="dropdown"
						href="javascript:void(0);">{{ trans('misc.campaigns') }}
						<i class="ion-chevron-down margin-lft5"></i></a>

					<!-- DROPDOWN MENU -->
					<ul class="dropdown-menu arrow-up" role="menu" aria-labelledby="dropdownMenu2">
						<li><a class="text-overflow"
								href="{{ url('campaigns/featured') }}">{{ trans('misc.featured') }}</a></li>
						<li><a class="text-overflow" href="{{ url('/') }}">{{ trans('misc.latest') }}</a></li>
					</ul><!-- DROPDOWN MENU -->
				</li>

				@if( $categoriesTotal != 0 )
				<li class="dropdown">
					<a href="javascript:void(0);" data-toggle="dropdown"
						class="text-uppercase font-default">{{trans('misc.categories')}}
						<i class="ion-chevron-down margin-lft5"></i>
					</a>

					<!-- DROPDOWN MENU -->
					<ul class="dropdown-menu arrow-up" role="menu" aria-labelledby="dropdownMenu2">
						@foreach( $categoriesMenu as $category )
						<li @if(Request::path()=="category/$category->slug" ) class="active" @endif>
							<a href="{{ url('category') }}/{{ $category->slug }}" class="text-overflow">
								@lang("category.".$category->slug)
							</a>
						</li>
						@endforeach

						@if( $categoriesTotal > 6 )
						<li><a href="{{ url('categories') }}">
								<strong>{{ trans('misc.view_all') }} <i class="fa fa-long-arrow-right"></i></strong>
							</a></li>
						@endif
					</ul><!-- DROPDOWN MENU -->

				</li><!-- Categories -->
				@endif
			</ul>

			<ul class="nav navbar-nav navbar-right">
				@if(config("app.locales") != null)
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
						aria-expanded="false">
						@lang("misc.".config("app.locales")[config("app.locale")])
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						@foreach(Arr::except(config("app.locales"), [config("app.locale")]) as $ulang => $ulang_desc)
						<li>
							<a class="dropdown-item"
								href="{{ route('route-setLocale', ['user_lang' => $ulang, 'redirect_to' => url()->full()]) }}">@lang("misc.".$ulang_desc)</a>
						</li>
						@endforeach
					</ul>
				</li>
				@endif

				@if($settings->multi_currency_mode_enabled)
				<?php
					$curr_symbol = App\Models\Currency::find(config("app.currency_code"))->currency_symbol;
					$all_currencies = App\Models\Currency::all();
					//dd($all_currencies);
				?>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
						aria-expanded="false">
						@lang("campaign.currency"): {{ config("app.currency_code") }} ({{$curr_symbol}})
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						@foreach(Arr::where($all_currencies->toArray(), function($key, $value)
						{
							return array_get($value, "currency_code") != config("app.currency_code");
						}) as $k => $v)
						<li>
							<a class="dropdown-item"
								href="{{ route('route-setCurrency', ['currency_code' => array_get($v, 'currency_code'), 'redirect_to' => url()->full()]) }}">{{ array_get($v, 'currency_code') }} ({{array_get($v, 'currency_symbol')}})</a>
						</li>
						@endforeach
					</ul>
				</li>
				@endif

				@if( Auth::check() )

				<li class="dropdown">
					<a href="javascript:void(0);" data-toggle="dropdown" class="userAvatar myprofile dropdown-toggle">
						<img src="{{ asset('public/avatar').'/'.Auth::user()->avatar }}" alt="User"
							class="img-circle avatarUser" width="21" height="21" />
						<span
							class="title-dropdown font-default"><strong>{{ trans('users.my_profile') }}</strong></span>
						<i class="ion-chevron-down margin-lft5"></i>
					</a>

					<!-- DROPDOWN MENU -->
					<ul class="dropdown-menu arrow-up nav-session" role="menu" aria-labelledby="dropdownMenu4">
						@if( Auth::user()->role == 'admin' )
						<li>
							<a href="{{ url('panel/admin') }}" class="text-overflow">
								<i class="icon-cogs myicon-right"></i> {{ trans('admin.admin') }}</a>
						</li>
						<li role="separator" class="divider"></li>
						@endif

						<li>
							<a href="{{ url('dashboard') }}" class="text-overflow">
								<i class="icon icon-dashboard myicon-right"></i> {{ trans('admin.dashboard') }}
							</a>
						</li>

						<li>
							<a href="{{ url('dashboard/campaigns') }}" class="text-overflow">
								<i class="ion ion-speakerphone myicon-right"></i> {{ trans('misc.campaigns') }}
							</a>
						</li>

						<li>
							<a href="{{ url('user/likes') }}" class="text-overflow">
								<i class="fa fa-heart myicon-right"></i> {{ trans('misc.likes') }}
							</a>
						</li>

						<li>
							<a href="{{ url('account') }}" class="text-overflow">
								<i class="glyphicon glyphicon-cog myicon-right"></i>
								{{ trans('users.account_settings') }}
							</a>
						</li>

						<li>
							<a href="{{ url('logout') }}" class="logout text-overflow">
								<i class="glyphicon glyphicon-log-out myicon-right"></i> {{ trans('users.logout') }}
							</a>
						</li>
					</ul><!-- DROPDOWN MENU -->
				</li>

				<li>
					<a class="log-in custom-rounded" href="{{url('create/campaign')}}"
						title="{{trans('misc.create_campaign')}}">
						<i class="glyphicon glyphicon-edit"></i> <strong>{{trans('misc.create_campaign')}}</strong></a>
				</li>

				@else

				<li><a class="text-uppercase font-default" href="{{url('login')}}">{{trans('auth.login')}}</a></li>

				<li>
					<a class="log-in custom-rounded text-uppercase font-default" href="{{url('register')}}">
						<i class="glyphicon glyphicon-user"></i> {{trans('auth.sign_up')}}
					</a>
				</li>

				@endif
			</ul>

		</div>
		<!--/.navbar-collapse -->
	</div>
</div>

<div id="search">
	<button type="button" class="close">×</button>
	<form autocomplete="off" action="{{ url('search') }}" method="get">
		<input type="search" value="" name="q" id="btnItems" placeholder="{{trans('misc.search_query')}}" />
		<button type="submit" class="btn btn-lg no-shadow btn-trans custom-rounded btn_search"
			id="btnSearch">{{trans('misc.search')}}</button>
	</form>
</div>
</div>