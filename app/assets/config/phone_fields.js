function remove_fields(link) {
  console.log(link)
  console.log($(link).closest(".fields"))
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().after(content.replace(regexp, new_id));
}
