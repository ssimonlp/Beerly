$(document).ready(function(){
  $(".my_form").keyup(function(){
    var search = $(this).val();
    if(search != ""){
      var datObject;
      $.ajax({
        url: 'autocomplete',
        method: 'GET',
        dataType: 'json',
        data: {'term': search},
        success:function(data){
        $("#searchResult").empty();
          var len = data["data"].length;
          console.log('Success!', data);
          for( var i = 0; i<len; i++){
            var id = data["data"][i]['id'];
            var name = data["data"][i]['name'];
            $("#searchResult").append("<li value='"+id+"'>"+name+"</li>");
          }
          $("#searchResult li").bind("click",function(){
            setText(this);
          });
        }
      });
    }
  });
});
function setText(element){
  var value = $(element).text();
  var userid = $(element).val();
  $("#term").val(value);
  $("#searchResult").empty();
}