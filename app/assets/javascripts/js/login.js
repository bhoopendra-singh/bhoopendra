$(document).ready(function(){
  (function($) {
    "use strict";
    $(function() {
      $("#loginForm").validate();
      $(".emailField").rules("add", {
        required: true, email: true,
        messages: {
          required: "Please Enter Your Email."
        }
      });
      $(".passwordField").rules("add", {
        required: true, password: true,
        messages: {
          required: "Please Enter Your Password."
        }
      });   
    })

    $(function() {
      $("#signupForm").validate();
      $(".emailField").rules("add", {
        required: true, email: true,
        messages: {
          required: "Please Enter Your Email."
        }
      });
      $(".passwordField").rules("add", {
        required: true, password: true,
        messages: {
          required: "Please Enter Your Password."
        }
      });
      $(".confpasswordField").rules("add", {
        required: true, password_confirmation: true,
        messages: {
          required: "Please Enter Your Confirm password."
        }
      });
      $(".firstnameField").rules("add", {
        required: true, first_name: true,
        messages: {
          required: "Please Enter Your First name."
        }
      });
      $(".lastnameField").rules("add", {
        required: true, last_name: true,
        messages: {
          required: "Please Enter Your Last name."
        }
      });
      $(".addressField").rules("add", {
        required: true, address: true,
        messages: {
          required: "Please Enter Your Address."
        }
      });
      $(".contactField").rules("add", {
        required: true, contact_no: true,
        messages: {
          required: "Please Enter Your Contact no."
        }
      });             
    })

  })(jQuery)
})