$(document).ready(function(){
  var $passChange = $('input[name=changepass]'),
  $password = $('input[name=password]');
  $passChange.click(function(){
    if($(this).is(':checked')){
      $password.attr('type','text');
    } else {
      $password.attr('type','password');
    }
  });
 
});

$(document).ready(function () {
  $('#changepass').tooltip();
});