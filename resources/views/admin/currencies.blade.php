@extends('admin.layout')

@section('content')
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h4>
			{{ trans('admin.admin') }} <i class="fa fa-angle-right margin-separator"></i>
			{{--{{ trans('admin.currencies') }} ({{$data->total()}})--}}

			<a href="{{{ url('panel/admin/member/add') }}}" class="btn btn-sm btn-success no-shadow pull-right">
				<i class="glyphicon glyphicon-plus myicon-right"></i> {{{ trans('misc.add_new') }}}
			</a>

		</h4>

	</section>

	<!-- Main content -->
	<section class="content">

		@if(Session::has('info_message'))
		<div class="alert alert-warning">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<i class="fa fa-warning margin-separator"></i> {{ Session::get('info_message') }}
		</div>
		@endif

		@if(Session::has('success_message'))
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">×</span>
			</button>
			<i class="fa fa-check margin-separator"></i> {{ Session::get('success_message') }}
		</div>
		@endif

		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							{{ trans('admin.currencies') }}
						</h3>
						<div class="box-tools">
							<!-- form -->
							<form role="search" autocomplete="off" action="{{ url('panel/admin/currencies') }}"
								method="get">
								<div class="input-group input-group-sm" style="width: 150px;">
									<input type="text" name="q" class="form-control pull-right" placeholder="Search">

									<div class="input-group-btn">
										<button type="submit" class="btn btn-default"><i
												class="fa fa-search"></i></button>
									</div>
								</div>
							</form><!-- form -->
						</div>
					</div><!-- /.box-header -->



					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tbody>

								@if($data->count() != 0 )
								<tr>
									<th class="active">{{ trans('admin.currency_code') }}</th>
									<th class="active">{{ trans('admin.currency_symbol') }}</th>
									<th class="active">{{ trans('admin.currency_symbol_position') }}</th>
									<th class="active">{{ trans('admin.actions') }}</th>
								</tr>

								@foreach( $data as $currency )
								<tr>
									<td>{{ $currency->currency_code }}</td>
									<td>{{ $currency->currency_symbol }}</td>
									<td>{{ $currency->currency_symbol_position }}</td>
									<td>

										<a href="{{ url('panel/admin/currencies/edit/'.$currency->currency_code) }}"
											class="btn btn-success btn-xs padding-btn">
											{{ trans('admin.edit') }}
										</a>

										{!! Form::open([
										'method' => 'DELETE',
										'url' => url('panel/admin/currencies/delete/'.$currency->currency_code),
										'class' => 'displayInline'
										]) !!}
										{!! Form::submit(trans('admin.delete'), ['data-url' => $currency->currency_code, 'class'
										=> 'btn btn-danger btn-xs padding-btn actionDelete']) !!}
										{!! Form::close() !!}

									</td>

								</tr><!-- /.TR -->
								@endforeach

								@else
								<hr />
								<h3 class="text-center no-found">{{ trans('misc.no_results_found') }}</h3>

								@if( isset( $query ) )
								<div class="col-md-12 text-center padding-bottom-15">
									<a href="{{url('panel/admin/currencies')}}"
										class="btn btn-sm btn-danger">{{ trans('auth.back') }}</a>
								</div>

								@endif
								@endif

							</tbody>

						</table>

					</div><!-- /.box-body -->
				</div><!-- /.box -->
				{{-- $data->appends(['q' => $query])->links() --}}
			</div>
		</div>

		<!-- Your Page Content Here -->

	</section><!-- /.content -->
</div><!-- /.content-wrapper -->
@endsection

@section('javascript')

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
</script>
@endsection