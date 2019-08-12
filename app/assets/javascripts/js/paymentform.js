$(document).ready(function(){
  (function($) {
    "use strict";
    $(function() {
      $("#contact_form").validate();
      $(".emailField").rules("add", {
        required: true, email: true,
        messages: {
          required: "Please Enter Your Email."
        }
      });
      $(".messageField").rules("add", {
        required: true, message: true,
        messages: {
          required: "Please Enter Your Message."
        }
      });
      $(".nameField").rules("add", {
        required: true, name: true,
        messages: {
          required: "Please Enter Your Name."
        }
      });
      $(".subjectField").rules("add", {
        required: true, subject: true,
        messages: {
          required: "Please Enter Your Subject."
        }
      });     
    })

    $(function() {
      $("#paymentForm").validate();
      $(".cardField").rules("add", {
        required: true, Card: true,
        messages: {
          required: "Please Enter Card Number of Your card."
        }
      });
      $(".monthField").rules("add", {
        required: true, Expiry_month: true,
        messages: {
          required: "Please Enter Expiry_month of Your card."
        }
      });
      $(".yearField").rules("add", {
        required: true, Expiry_year: true,
        messages: {
          required: "Please Enter Expiry_year of Your card."
        }
      });
      $(".securityField").rules("add", {
        required: true, security: true,
        messages: {
          required: "Please Enter CVC of Your card."
        }
      });     
    })

  })(jQuery)
})