$(document).ready ->
  $('#change').click ->
    currency = $("#currency").val()
    currency_destination =  $("#currency_destination").val()
    $("#currency_destination").val(currency)
    $("#currency").val(currency_destination)
    updateValue();
    return false;
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      updateValue();
      return false;


updateValue = () ->
    $.ajax '/exchange',
      type:'POST',
      dataType:'json',
      data: {
              currency: $("#currency").val(),
              currency_destination: $("#currency_destination").val(),
              quantity: $("#quantity").val()
            }
      error:(jqXHR, textStatus,errorThrown) ->
        alert textStatus
      success:(data, text,jqXHR)->
        $("#result").val(data.value)
