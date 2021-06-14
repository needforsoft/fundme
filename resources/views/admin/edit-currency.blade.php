@extends('admin.layout')

@section('css')
<link href="{{ asset('public/plugins/iCheck/all.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h4>
			{{ trans('admin.admin') }}
			<i class="fa fa-angle-right margin-separator"></i>
			{{ trans('admin.edit') }}

			<i class="fa fa-angle-right margin-separator"></i>
			{{ $data->name }}
		</h4>

	</section>

	<!-- Main content -->
	<section class="content">

		<div class="content">

			<div class="row">

				<div class="col-md-12">

					<div class="box box-danger">
						<div class="box-header with-border">
							<h3 class="box-title">{{ trans('admin.edit') }}</h3>
						</div><!-- /.box-header -->

						<!-- form start -->
						<form class="form-horizontal" method="POST"
							action="{{ url('panel/admin/currencies/update/'.$data->currency_code) }}"
							enctype="multipart/form-data">

							<input type="hidden" name="_token" value="{{ csrf_token() }}">
							{{-- <input type="hidden" name="_method" value="PUT"> --}}

							@include('errors.errors-forms')

							<!-- Start Box Body -->
							<div class="box-body">
								<div class="form-group">
									<label class="col-sm-2 control-label">{{ trans('admin.currency_code') }}</label>
									<div class="col-sm-10">
										<input type="text" value="{{ $data->currency_code }}" name="currency_code"
											class="form-control" placeholder="{{ trans('admin.currency_code') }}">
									</div>
								</div>
							</div><!-- /.box-body -->


							<!-- Start Box Body -->
							<div class="box-body">
								<div class="form-group">
									<label class="col-sm-2 control-label">{{ trans('admin.currency_symbol') }}</label>
									<div class="col-sm-10">
										<input type="text" value="{{ $data->currency_symbol }}" name="currency_symbol"
											class="form-control" placeholder="{{ trans('admin.currency_symbol') }}">
									</div>
								</div>
							</div><!-- /.box-body -->

							<!-- Start Box Body -->
							<div class="box-body">
								<div class="form-group">
									<label class="col-sm-2 control-label">{{ trans('admin.currency_position') }}</label>
									<div class="col-sm-10">
										<select name="currency_symbol_position" class="form-control">
											<option @if($data->currency_symbol_position == 'right') selected="selected"
												@endif value="right">{{trans('admin.right')}}</option>
											<option @if($data->currency_symbol_position == 'left') selected="selected"
												@endif value="left">{{trans('admin.left')}}</option>
										</select>
									</div>
								</div>
							</div><!-- /.box-body -->

						  <!-- Start Box Body -->
						  <div class="box-body">
							<div class="form-group">
								<label
									class="col-sm-2 control-label">{{ trans('admin.min_campaign_amount') }}</label>
								<div class="col-sm-10">
									<input type="number" min="1" autocomplete="off"
										value="{{ $data->min_campaign_amount }}" name="min_campaign_amount"
										class="form-control onlyNumber"
										placeholder="{{ trans('admin.min_campaign_amount') }}">
								</div>
							</div>
						</div><!-- /.box-body -->

						<!-- Start Box Body -->
						<div class="box-body">
							<div class="form-group">
								<label
									class="col-sm-2 control-label">{{ trans('misc.max_campaign_amount') }}</label>
								<div class="col-sm-10">
									<input type="number" min="1" autocomplete="off"
										value="{{ $data->max_campaign_amount }}" name="max_campaign_amount"
										class="form-control onlyNumber"
										placeholder="{{ trans('admin.max_campaign_amount') }}">
								</div>
							</div>
						</div><!-- /.box-body -->

						<!-- Start Box Body -->
						<div class="box-body">
							<div class="form-group">
								<label
									class="col-sm-2 control-label">{{ trans('admin.min_donation_amount') }}</label>
								<div class="col-sm-10">
									<input type="number" min="1" autocomplete="off"
										value="{{ $data->min_donation_amount }}" name="min_donation_amount"
										class="form-control onlyNumber"
										placeholder="{{ trans('admin.min_donation_amount') }}">
								</div>
							</div>
						</div><!-- /.box-body -->

						<!-- Start Box Body -->
						<div class="box-body">
							<div class="form-group">
								<label
									class="col-sm-2 control-label">{{ trans('misc.max_donation_amount') }}</label>
								<div class="col-sm-10">
									<input type="number" min="1" autocomplete="off"
										value="{{ $data->max_donation_amount }}" name="max_donation_amount"
										class="form-control onlyNumber"
										placeholder="{{ trans('misc.max_donation_amount') }}">
								</div>
							</div>
						</div><!-- /.box-body -->

							<div class="box-footer">
								<a href="{{ url('panel/admin/currencies') }}"
									class="btn btn-default">{{ trans('admin.cancel') }}</a>
								<button type="submit"
									class="btn btn-success pull-right">{{ trans('admin.save') }}</button>
							</div><!-- /.box-footer -->
						</form>
					</div>

				</div><!-- /. col-md-9 -->
			</div><!-- /.row -->

		</div><!-- /.content -->

		<!-- Your Page Content Here -->

	</section><!-- /.content -->
</div><!-- /.content-wrapper -->
@endsection

@section('javascript')

<!-- icheck -->
<script src="{{ asset('public/plugins/iCheck/icheck.min.js') }}" type="text/javascript"></script>

<script type="text/javascript">
	$(".actionDelete").click(function(e) {
   	e.preventDefault();

   	var element = $(this);
	var id     = element.attr('data-url');
	var form    = $(element).parents('form');

	element.blur();

	swal(
		{   title: "{{trans('misc.delete_confirm')}}",
		text: "{{trans('admin.delete_currency_confirm')}}",
		  type: "warning",
		  showLoaderOnConfirm: true,
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		   confirmButtonText: "{{trans('misc.yes_confirm')}}",
		   cancelButtonText: "{{trans('misc.cancel_confirm')}}",
		    closeOnConfirm: false,
		    },
		    function(isConfirm){
		    	 if (isConfirm) {
		    	 	form.submit();
		    	 	//$('#form' + id).submit();
		    	 	}
		    	 });


		 });

		//Flat red color scheme for iCheck
        $('input[type="radio"]').iCheck({
          radioClass: 'iradio_flat-red'
        });

</script>


@endsection