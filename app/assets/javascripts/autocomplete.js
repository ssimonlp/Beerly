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
          var nb = search.length;
          console.log(search);
          console.log(data);
          console.log(len);
          for( var i = 0; i < len; i++){
            var id = data["data"][i]['id'];
            var name = data["data"][i]['name'];
            if (len > 0){
              $("#searchResult").append("<li value='"+id+"'>"+name+"</li>");
            }
          }
          $("#searchResult li").bind("click",function(){
            setText(this);
          });
        }
      });
    }
    else{
       $("#searchResult").empty();

    }
  });
});
function setText(element){
  var value = $(element).text();
  var userid = $(element).val();
  $("#term").val(value);
  $("#searchResult").empty();
}
