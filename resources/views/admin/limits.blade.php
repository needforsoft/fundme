@extends('admin.layout')

@section('content')
<!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h4>
            {{ trans('admin.admin') }} 
            	<i class="fa fa-angle-right margin-separator"></i> 
            		{{ trans('admin.general_settings') }}
            		
            		<i class="fa fa-angle-right margin-separator"></i> 
            		{{ trans('admin.limits') }}
          </h4>

        </section>

        <!-- Main content -->
        <section class="content">
        	
        	 @if(Session::has('success_message'))
		    <div class="alert alert-success">
		    	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
								<span aria-hidden="true">×</span>
								</button>
		        <i class="fa fa-check margin-separator"></i> {{ Session::get('success_message') }}	        
		    </div>
		@endif

        	<div class="content">
        		
        		<div class="row">
    
        	<div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">{{ trans('admin.limits') }}</h3>
                </div><!-- /.box-header -->
               
               
               
                <!-- form start -->
                <form class="form-horizontal" method="POST" action="{{ url('panel/admin/settings/limits') }}" enctype="multipart/form-data">
                	
                	<input type="hidden" name="_token" value="{{ csrf_token() }}">	
                  @include('errors.errors-forms')
                  				
                 <!-- Start Box Body -->
                  <div class="box-body">
                    <div class="form-group">
                      <label class="col-sm-2 control-label">{{ trans('admin.result_request_campaigns') }}</label>
                      <div class="col-sm-10">
                      	<select name="result_request" class="form-control">
                      		<option @if( $settings->result_request == 4 ) selected="selected" @endif value="4">4</option>
                      		<option @if( $settings->result_request == 8 ) selected="selected" @endif value="8">8</option>
                            <option @if( $settings->result_request == 12 ) selected="selected" @endif value="12">12</option>
						  	<option @if( $settings->result_request == 24 ) selected="selected" @endif value="24">24</option>
						  	<option @if( $settings->result_request == 36 ) selected="selected" @endif value="36">36</option>
						  	<option @if( $settings->result_request == 48 ) selected="selected" @endif value="48">48</option>
						  	<option @if( $settings->result_request == 60 ) selected="selected" @endif value="60">60</option>
                          </select>
                      </div>
                    </div>
                  </div><!-- /.box-body -->
                
                  <!-- Start Box Body -->
                  <div class="box-body">
                    <div class="form-group margin-zero">
                      <label class="col-sm-2 control-label">{{ trans('admin.file_size_allowed') }}</label>
                      <div class="col-sm-10">
                      	<select name="file_size_allowed" class="form-control">
                            <option @if( $settings->file_size_allowed == 1024 ) selected="selected" @endif value="1024">1 MB</option>
						  	<option @if( $settings->file_size_allowed == 2048 ) selected="selected" @endif value="2048">2 MB</option>
						  	<option @if( $settings->file_size_allowed == 3072 ) selected="selected" @endif value="3072">3 MB</option>
						  	<option @if( $settings->file_size_allowed == 4096 ) selected="selected" @endif value="4096">4 MB</option>
						  	<option @if( $settings->file_size_allowed == 5120 ) selected="selected" @endif value="5120">5 MB</option>
						  	<option @if( $settings->file_size_allowed == 10240 ) selected="selected" @endif value="10240">10 MB</option>
                          </select>
                          <span class="help-block ">{{ trans('admin.upload_max_filesize_info') }} <strong><?php echo str_replace('M', 'MB', ini_get('upload_max_filesize')) ?></strong></span>
                      </div>
                    </div>
                  </div><!-- /.box-body -->

                  <div class="box-footer">
                    <button type="submit" class="btn btn-success">{{ trans('admin.save') }}</button>
                  </div><!-- /.box-footer -->
                </form>
              </div>
        			        		
        		</div><!-- /.row -->
        		
        	</div><!-- /.content -->
        	
          <!-- Your Page Content Here -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
@endsection

@section('javascript')

<script type="text/javascript">
$(document).ready(function() {
	
    $(".onlyNumber").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
	  
});
</script>
@endsection