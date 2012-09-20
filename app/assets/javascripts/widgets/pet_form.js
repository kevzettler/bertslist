var pet_form = {
  options:{},

  _create: function(){
    $.cloudfuji.ajaxy_form.prototype._create.call(this);
  }
  
  ,submit: function(){
    $('#fileupload').disable();
    $.cloudfuji.ajaxy_form.prototype.submit.apply(this, arguments);
  }

  ,submitSuccess: function(data, textStatus, jqXHR){
    $('#fileupload').data('fileupload').option('formData', {pet_id: data.data.id});
    $('#global_upload_start').click();
    $('#fileupload').enable();
    $.cloudfuji.ajaxy_form.prototype.submitSuccess.call(this, data, textStatus, jqXHR);
  }

};

$.widget("bertslist.pet_form", $.cloudfuji.ajaxy_form, pet_form);
