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
//= require jquery
//= require ./vendor/jquery/jquery-ui-1.8.23.custom.min.js
//= require ./vendor/jquery/jquery.disable.js
//= require ./formValidator.2.5.5.1/languages/jquery.validationEngine-en.js
//= require ./formValidator.2.5.5.1/jquery.validationEngine.js
//= require_tree ./vendor/bootstrap
//= require jquery-fileupload
//= require_tree ./widgets

/*
* Awesome helper function for validationEngine great for use with
* autobox checks that a field is not the default value before
* submitting
*/
function checkDefault(field, rules, i, options){
    if(field.get(0).defaultValue == field.val()){
	return "* Field is required";
    }
}

/*
* Helper function to collect message from jqXHR objects. Called on
* ajax error callbacks
*/
function jqXHRMessage(jqXHR){
    var text = ""
    ,key_count = 0
    ,index
    ;
  
    try{    
	var  json = JSON.parse(jqXHR.responseText);
    }catch(ex){
	var json = {error: "Sorry! there was an error procesing your request. <br />We'll fix this as soon as possible. Please try later. "};
    }
  
      
    for(key in json){
	key_count+=1;
	text += key + " " + json[key] + "\n";
    }
  
    if(key_count == 1){
	index = text.indexOf(' ');
	text = text.substring(index);
    }
  
    return text;
};



$(function(){

  $('.datepicker').datepicker({
    "altFormat": "yy-mm-dd"
  });

  // Initialize the jQuery File PetImage widget:
   $('#pet_form').pet_form();

  $('#pet_form_submit').click(function(event){
    $('#pet_form').submit();
    return false;
  });
});
