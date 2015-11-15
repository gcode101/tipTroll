var payAction = function() {
  var handler = StripeCheckout.configure({
    key: 'pk_test_Mk8vNgS5phGlvpjadS63RMU5',
    token: function(token) {
      var postData = {
        amount: parseFloat($('#amount').val()) * 100,
        stripeToken: token.id,
      }

      $.ajax({
        type: 'POST',
        url: '/charges',
        data: postData,
        success: function (reservation) {
          $('.message').append('<h2>Thank you, you paid $<strong>' + $('#amount').val() + '</strong>!</h2>');
          $('.message').show();
        },
        error: function (request, error) {
          $('.message').append('<h2>We apologize but your payment did not go through.</h2>');
          $('.message').show();
        }
      });
    }

  });


  $('#charge').on('click', function(e) {
    e.preventDefault();
    var total = parseFloat($('#amount').val()) * 100;
    handler.open({
              name: 'Tip',
              description: 'Input Your Payment Details',
              amount: total
          });
  });
};
// $(document).ready(payAction);
$(document).on('page:load', payAction);
