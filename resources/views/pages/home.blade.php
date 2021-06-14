@extends('app')

@section('title') {{ $title }} @endsection

@section('content')
<div class="index-header">
	<div class="container position-relative">
		<h2 class="title-site">@lang("page.".$response->slug)</h2>
	</div>
</div>

<div class="container margin-bottom-40 margin-top-5">

	<div class="row"></div>
	<!-- Col MD -->
	<div class="col-md-12">

		<ol class="breadcrumb bg-none">
			<li><a href="{{ URL::to('/') }}"><i class="glyphicon glyphicon-home myicon-right"></i></a></li>
			<li class="active">@lang("page.".$response->slug)</li>
		</ol>
		<hr />

		<dl>
			<dd>
				<?php echo html_entity_decode($response->content) ?>
			</dd>
		</dl>
	</div><!-- /COL MD -->

</div><!-- row -->

<!-- container wrap-ui -->
@endsection