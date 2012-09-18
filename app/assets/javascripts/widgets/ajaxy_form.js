(function ($, undefined) {

    $.widget('cloudfuji.ajaxy_form', {
	options:{}

	,_create: function() {
          console.log("ajaxy form create", this.element);
	    this.element.validationEngine('attach', {
		promptPosition: "topLeft"
		,scroll: false
		,onValidationComplete: $.proxy(function(form, status){
                      console.log("omg validation complete");
		    if(status === true){
                      console.log("submitting");
		        this.submit();
		    }
                  return false;
		 }, this)
	    });

  	}
	
	,getFormData: function(){
	    var data = {};
	    this.element.find('select, input, textarea').each(function(){
		var $this = $(this);
		data[$this.attr('name')] = $this.val();
	    });
	    return data;
	}

	,checkLoadingStatus: function(data){
	    if(data.data){
		if(data.data.loading){
		    return 'load';
		}
	    }
	    return 'pass';
	}
	
	,submitError: function(jqXHR, text, status){
          console.log("submit error", jqXHR, text, status);
	    try{
		var data = JSON.parse(jqXHR.responseText);
		var message = this.buildResponseMessage(data, status, jqXHR);
	    }catch(ex){
		//if the request throws an error and returns a html rails page we should end up here
		var message = "Sorry there was an error on our end. We are looking into it and should have it resolved shortly. Please try back later.";
	    }

  	    this.element.validationEngine('showPrompt', message, 'error', "topLeft", true);
	    this.element.enable();
  	}

	,submitSuccess: function(data, textStatus, jqXHR){
          console.log("submitSuccess", jqXHR, text, status);
	    var message = this.buildResponseMessage(data, textStatus, jqXHR);
	    
  	    this.element.validationEngine('showPrompt', message, this.checkLoadingStatus(data), 'topLeft', true);
	    this.element.enable();
  	}

	,buildAjaxEvent: function(method, action, params){
          console.log("building an ajax event");
	    var self = this;

	    return (function(method,action,params,self){
              console.log("closure 1");
		return function(){
                  console.log("closure 2");
		    $(document).validationEngine('hideAll');
		    self.element.disable();
		    $.ajax({
			type: method
			,url: action + ".json"
			,data: params
			,error: $.proxy(self.submitError, self)
			,success: $.proxy(self.submitSuccess, self)
                      ,complete: function(){console.log("complete ajax!");}
		    });
		    
		    return false;
		};
	    })(method,action,params,self);
	}

	,buildResponseMessage: function(data, textStatus, jqXHR){
	    var message = (typeof data.message != 'undefined') ? data.message : jqXHRMessage(jqXHR);
	    
	    //oh jeez, data.data was an accident
	    if(typeof data.data != 'undefined' && data.data !== null){
		if(typeof data.data.options != 'undefined' && data.data.options != null){
		    message = $('<span>'+message+'<br /></span>');
		
		    for(var i=0; i<data.data.options.length; i++){
			var option = data.data.options[i];

			if(typeof option.action != 'undefined' || typeof option.method != 'undefined'){
			    var option_event = this.buildAjaxEvent(option.method, option.action, option.params);
			    var option_link = $('<a href="'+option.action+'" class="option_link" id="option'+i+'" >'+option.label+' </a>');
			}else{
			    var option_link = $('<a href="#" class="option_link null_option">'+option.label+' </a>');
			}
			message.append(option_link);

			if(typeof option_event != 'undefined'){
			    $('body').find('#option'+i).live("click", option_event);
			}
		    }
		
		}
	    }

	    return message;
	 }
  	
  	,submit: function(){
           console.log("ajaxy form submit");
	    this.buildAjaxEvent(this.element.attr('method'),
			       this.element.attr('action'),
			       this.getFormData())();
          return false;
	}
	
    });


}(jQuery));
