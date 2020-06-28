$(function() {

  $("#user-search-field").on('keyup', function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url:  "/users",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(users) {
      console.log("成功")
    })
    .fail(function() {
      console.log("失敗");
    });
  });
});