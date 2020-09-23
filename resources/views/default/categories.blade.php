@extends('app')

@section('title'){{ trans('misc.categories').' - ' }}@endsection

@section('content') 
<div class="index-header">
      <div class="container position-relative">
        <h2 class="title-site">{{ trans('misc.categories') }}</h2>
        <p class="subtitle-site"><strong>{{trans('misc.browse_by_category')}}</strong></p>
      </div>
    </div>

<div class="container margin-bottom-40 margin-top-5">
	
	    		@foreach ($data as $category)
	        				@include('includes.categories-listing')
	        			@endforeach

 </div><!-- container wrap-ui -->
@endsection

