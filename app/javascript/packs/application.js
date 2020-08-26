require('@rails/ujs').start();
require('jquery');

window.app = {
  total: 0,
  insertedCoins: [],
  totalInserted: 0,
  productValue: 0,
  productId: 0,

  feedbackToUser: function() {
    if(app.enoughToSubmit()) {
      $('#feedback').html('Inserted ' + app.totalInserted.toString() + '<br>Processing, please wait... ');

    } else {
      $('#feedback').text('Inserted ' + app.totalInserted.toString());
    }
  },

  enoughToSubmit: function() {
    app.totalInserted = app.insertedCoins.reduce((a, b) => a + b).toFixed(2);
    if (app.totalInserted >= app.productValue) {
      app.submit();
      return true;
    }
    return false;
  },

  submit: function() {
    var data = {
      inserted_coins: app.insertedCoins,
      product_id: app.productId
    }

    $.ajax({
      url: "/submit.json",
      type: "POST",
      dataType: "html",
      data: data,
      success: function(result) {
        $('#feedback').html('Thank you for purchasing, your change is the following: <br>' + JSON.parse(result).change.join(', ') + '<br> Please reload to buy again');
      },
      error: function(e, data, status, error) {
        $('#feedback').html('Unable to process change. <br> Please reload to buy again');
      }
    });
  }
}

$(function() {
  $('.products a').click(function(e) {
    e.preventDefault();

    $this = $(this);

    $('.products a').removeClass('active');
    $this.addClass('active');

    $('.wrapper-coins').show();

    app.productId = $this.data('id');
    app.productValue = parseFloat($this.data('value'));
  });

  $('.wrapper-coins a').click(function(e) {
    e.preventDefault();

    var selectedvalue = $(this).data('value');
    app.insertedCoins.push(parseFloat(selectedvalue));

    app.feedbackToUser();
  });
});
