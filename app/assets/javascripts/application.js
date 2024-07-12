// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require popper.js/dist/popper
//= require bootstrap/dist/js/bootstrap
//= require select2

$(document).on('turbolinks:load', function () {
  $("#dropdown").select2({
    theme: "bootstrap"
  });
});

$(document).on('turbolinks:load', function () {
  $('.select2').select2({
    closeOnSelect: false
  });
});

$(document).on('turbolinks:load', function () {
  $(".dropdown-toggle").dropdown();
});

$(document).on('turbolinks:load', function() {
  $("#increase-item").on("click", function() {
    var itemValue = $("#dropdown option:selected").val()
    var itemName = $("#dropdown option:selected").text()

    $("#selected-items").attr("hidden", false)

    if ($("div[value='"+ itemValue +"']").text()) {
      var itemString = $("div[value='"+ itemValue +"']").text()
      var itemAmount = parseInt((itemString).match(/\((.*?)\)/g).map(match => match.slice(1, -1))) + 1
      var i

      $("div[value='"+ itemValue +"']").replaceWith('<div style="display:inline-block;margin:4px;background-color:#DDDDDD;border-radius:5px;padding:4px" value="'+ itemValue +'"><button type="button" class="btn btn-danger btn-sm" id="decrease-item-'+itemValue+'" style="margin-right:8px">-</button>'+ itemName +' ('+ itemAmount +')</div>')
      
      for(i = 0; i < itemAmount; ++i){
        $("div[value='"+ itemValue +"']").append('<input hidden value="'+ itemValue +'" name="sale[product_ids][]" id="sale_product_ids_2">')
      }
    }

    else {
      $("#selected-items").append('<div style="display:inline-block;margin:4px;background-color:#DDDDDD;border-radius:5px;padding:4px" value="'+ itemValue +'"><button type="button" class="btn btn-danger btn-sm" id="decrease-item-'+itemValue+'" style="margin-right:8px">-</button>'+ itemName +' (1)</div>')
      $("div[value='"+ itemValue +"']").append('<input hidden value="'+ itemValue +'" amount="1" name="sale[product_ids][]" id="sale_product_ids_2">')
  }
  })
});

$(document).on("click", "button[id^='decrease-item-']", function() {
  var itemValue = parseInt($(this).attr("id").match(/\d/))
  var itemAmount = parseInt(($("div[value='"+ itemValue +"']")).text().match(/\((.*?)\)/g).map(match => match.slice(1, -1))) - 1
  var i

  if (itemAmount > 0) {
    var itemName = (($("div[value='"+ itemValue +"']")).text().match(/\w+ /g)).join('') //ACEITANDO APENAS NOMES, MELHORAR REGEX
    console.log(itemName)
    $("div[value='"+ itemValue +"']").replaceWith('<div style="display:inline-block;margin:4px;background-color:#DDDDDD;border-radius:5px;padding:4px" value="'+ itemValue +'"><button type="button" class="btn btn-danger btn-sm" id="decrease-item-'+itemValue+'" style="margin-right:8px">-</button>'+ itemName +' ('+ itemAmount +')</div>')
    
    for(i = 0; i < itemAmount; ++i){
      $("div[value='"+ itemValue +"']").append('<input hidden value="'+ itemValue +'" name="sale[product_ids][]" id="sale_product_ids_2">')
    }
  }

  else {
    $("div[value='"+ itemValue +"']").remove()
    if ($(".btn-danger").text() == '')(
      $("#selected-items").attr("hidden", true)
    )
  }
});