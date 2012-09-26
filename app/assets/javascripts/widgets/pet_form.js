var pet_form = {
  options:{
    redirectOnSuccessUrl: null
  },

  _create: function(){
    $.cloudfuji.ajaxy_form.prototype._create.call(this);
    $('#fileupload').bind("fileuploadstop", $.proxy(this.fileUploadOnCompleteAll, this));
  }

  ,enable: function(){
    $('#pet_form_submit').enable();
    $('#fileupload').enable();
  }

  ,fileUploadOnCompleteAll: function(list){
    $.cloudfuji.ajaxy_form.prototype.submitSuccess.call(this, {message: "Pet listed Successfully"}, "success", {responseText:{error:"Pet Listed Successfully"}});
    this.enable();
  }
  
  ,submit: function(){
    if($('.template-upload').length > 0){
      $('#fileupload').disable();
      $('#fileupload').validationEngine('showPrompt', "Please wait while we upload your images", 'pass', "topLeft", true);
      $.cloudfuji.ajaxy_form.prototype.submit.apply(this, arguments);
    }else{
      $('#fileupload').validationEngine('showPrompt', "Pets can not be listed without images", 'error', "topLeft", true);
    }
  }

  ,submitError:function(jqXHR, text, status){
    $.cloudfuji.ajaxy_form.prototype.submitError.call(this, jqXHR, text, status);
    this.enable();
  }

  ,submitSuccess: function(data, textStatus, jqXHR){
    console.log("omg submit success", data, textStatus, jqXHR);
    var pet_id;
    
    //strange descrepency between development and production probabl servers 
    if(typeof data.id != "undefined"){ pet_id = data.id; }
    if(typeof data.data != "undefined"){ pet_id = data.data.id;}

    if(typeof pet_id == "undefined"){
      console.log("no pet id");
      $.cloudfuji.ajaxy_form.prototype.submitError.call(this, jqXHR, textStatus, textStatus);
      this.enable();
      return;
    }

    this.option('redirectOnSuccessUrl', '/pets/'+pet_id);
    $('#fileupload').data('fileupload').option('formData', {pet_id: pet_id});
    console.log("global upload start", pet_id);
    $('#global_upload_start').click();
  }

};

$.widget("bertslist.pet_form", $.cloudfuji.ajaxy_form, pet_form);
