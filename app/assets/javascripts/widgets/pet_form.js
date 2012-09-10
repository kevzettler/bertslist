var pet_form = {
  options:{},

  _create: function(){
    $.cloudfuji.ajaxy_form.prototype._create.call(this);
  }

  ,submitSuccess: function(data, textStatus, jqXHR){
    $.cloudfuji.ajaxy_form.prototype.submitSuccess.call(this, data, textStatus, jqXHR);
    console.log("omg pet_form submit success", data, textStatus, jqXHR);
    $('#fileupload').data('fileupload').submit();
  }

};

$.widget("bertslist.pet_form", $.cloudfuji.ajaxy_form, pet_form);
