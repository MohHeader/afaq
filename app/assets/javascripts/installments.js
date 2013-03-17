$(function() {
  $( "#buyer_name" ).autocomplete({
    minLength: 1,
    source : "/installments.json",
    focus: function( event, ui ) {
      $( "#buyer_name" ).val( ui.item.label );
      return false;
    },
    select: function( event, ui ) {
      $( "#buyer_name" ).val( ui.item.label ); 
      $( "#id" ).val( ui.item.value );
      return false;
    }
  })
});