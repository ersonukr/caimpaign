// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $('#call_created_at').datepicker({
      changeMonth: true,
      changeYear: true,
      yearRange: '2016:2026',
      dateFormat: 'yy-mm-dd'
  });
  $("#download_calls_form").submit(function(event) {
  		var date = $('#call_created_at').val();
      if (date === '') {
      	alert('Please enter date')
        event.preventDefault();
      }
  });
});

$(document).ready(function() {
  $(".status-button").on("click", function(){
    var that = this;
    var call_sid = $(this).closest("tr").find(".call_sid").val();
    $.post(('update_open_calls'), {call_sid:call_sid}, function(response){
      if (response) {
        var sid = ('#' + call_sid);
        $(sid).closest("tr").hide();
      }
    });
  });  
});