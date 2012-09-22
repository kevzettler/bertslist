var pet_form = {
  options:{
    redirectOnSuccessUrl: null
  },

  _create: function(){
    $.cloudfuji.ajaxy_form.prototype._create.call(this);
  }
  
  ,submit: function(){
    $('#fileupload').disable();
    $.cloudfuji.ajaxy_form.prototype.submit.apply(this, arguments);
  }

  ,submitError:function(jqXHR, text, status){
    $.cloudfuji.ajaxy_form.prototype.submitError.call(this, data, textStatus, jqXHR);
    $('#fileupload').enable();
  }

  ,submitSuccess: function(data, textStatus, jqXHR){
    console.log("omg submit success", data, textStatus, jqXHR);
    if(typeof data.data == "undefined"){
      console.log("no pet id to process images");
      $.cloudfuji.ajaxy_form.prototype.submitSuccess.call(this, jqXHR, textStatus, textStatus);
    }
    this.option('redirectOnSuccessUrl', '/pets/'+data.data.id);
    $('#fileupload').data('fileupload').option('formData', {pet_id: data.data.id});
    $('#global_upload_start').click();
    $('#fileupload').enable();
    $.cloudfuji.ajaxy_form.prototype.submitSuccess.call(this, data, textStatus, jqXHR);
  }

};

$.widget("bertslist.pet_form", $.cloudfuji.ajaxy_form, pet_form);
