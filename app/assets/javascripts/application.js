// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require ./jquery-1.7.2
//= require_tree ./vendor/jquery
//= require ./formValidator.2.5.5.1/languages/jquery.validationEngine-en.js
//= require ./formValidator.2.5.5.1/jquery.validationEngine.js
//= require_tree ./vendor/bootstrap
//= require jquery-fileupload
//= require_tree ./widgets

// require jquery-fileupload
$(function(){

  // $('.datepicker').datepicker({
  //   "altFormat": "yy-mm-dd"
  // });

   $('.ajaxy_form').ajaxy_form();
// //  $('#pet_form').pet_form();
//   $('#pet_form_submit').click(function(event){
//     console.log("pet form button click");
//     $('#pet_form').submit();
//     return false;
//   });
});
