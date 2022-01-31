function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".phone_fields").hide();
}

function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().after(content.replace(regexp, new_id));
}

function uncheck_defaults(id){
  $(".default-checkbox").prop("checked", false);
  $("#"+id).prop("checked", true);
}
