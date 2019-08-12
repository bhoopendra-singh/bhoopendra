// $(document).ready(function(){
    
//     (function($) {
//         "use strict";

    
//     jQuery.validator.addMethod('answercheck', function (value, element) {
//         return this.optional(element) || /^\bcat\b$/.test(value)
//     }, "type the correct answer -_-");

    //validate contactForm form
    // $(function() {
    //     $('#contactForm').validate({
    //         rules: {
    //             name: {
    //                 required: true,
    //                 minlength: 2
    //             },
    //             subject: {
    //                 required: true,
    //                 minlength: 4
    //             },
    //             number: {
    //                 required: true,
    //                 minlength: 5
    //             },
    //             email: {
    //                 required: true,
    //                 email: true
    //             },
    //             message: {
    //                 required: true,
    //                 minlength: 20
    //             }
    //         },
    //         messages: {
    //             name: {
    //                 required: "come on, you have a name, don't you?",
    //                 minlength: "your name must consist of at least 2 characters"
    //             },
    //             subject: {
    //                 required: "come on, you have a subject, don't you?",
    //                 minlength: "your subject must consist of at least 4 characters"
    //             },
    //             number: {
    //                 required: "come on, you have a number, don't you?",
    //                 minlength: "your Number must consist of at least 5 characters"
    //             },
    //             email: {
    //                 required: "no email, no message"
    //             },
    //             message: {
    //                 required: "um...yea, you have to write something to send this form.",
    //                 minlength: "thats all? really?"
    //             }
    //         },
    //         submitHandler: function(form) {
    //             $(form).ajaxSubmit({
    //                 type:"POST",
    //                 data: $(form).serialize(),
    //                 url:"contact_process.php",
    //                 success: function() {
    //                     $('#contactForm :input').attr('disabled', 'disabled');
    //                     $('#contactForm').fadeTo( "slow", 1, function() {
    //                         $(this).find(':input').attr('disabled', 'disabled');
    //                         $(this).find('label').css('cursor','default');
    //                         $('#success').fadeIn()
    //                         $('.modal').modal('hide');
		  //               	$('#success').modal('show');
    //                     })
    //                 },
    //                 error: function() {
    //                     $('#contactForm').fadeTo( "slow", 1, function() {
    //                         $('#error').fadeIn()
    //                         $('.modal').modal('hide');
		  //               	$('#error').modal('show');
    //                     })
    //                 }
    //             })
    //         }
    //     })
    // })

  //validation loginForm form

    // $(function() {
    //   debugger
    //   $("#loginForm").validate();
    //   $(".emailField").rules("add", {
    //     required: true, email: true,
    //     messages: {
    //       required: "Please Enter Your Email."
    //     }
    //   });
    //   $(".passwordField").rules("add", {
    //     required: true, password: true,
    //     messages: {
    //       required: "Please Enter Your Password."
    //     }
    //   });   
    // })

    // validation signup form
//     $(function() {
//       $("#signupForm").validate();
//       $(".emailField").rules("add", {
//         required: true, email: true,
//         messages: {
//           required: "Please Enter Your Email."
//         }
//       });
//       $(".passwordField").rules("add", {
//         required: true, password: true,
//         messages: {
//           required: "Please Enter Your Password."
//         }
//       });
//       $(".confpasswordField").rules("add", {
//         required: true, password_confirmation: true,
//         messages: {
//           required: "Please Enter Your Confirm password."
//         }
//       });
//       $(".firstnameField").rules("add", {
//         required: true, first_name: true,
//         messages: {
//           required: "Please Enter Your First name."
//         }
//       });
//       $(".lastnameField").rules("add", {
//         required: true, last_name: true,
//         messages: {
//           required: "Please Enter Your Last name."
//         }
//       });
//       $(".addressField").rules("add", {
//         required: true, address: true,
//         messages: {
//           required: "Please Enter Your Address."
//         }
//       });
//       $(".contactField").rules("add", {
//         required: true, contact_no: true,
//         messages: {
//           required: "Please Enter Your Contact no."
//         }
//       });             
//     })
//        //contact_form validation
//     $(function() {
//       $("#contact_form").validate();
//       $(".emailField").rules("add", {
//         required: true, email: true,
//         messages: {
//           required: "Please Enter Your Email."
//         }
//       });
//       $(".messageField").rules("add", {
//         required: true, message: true,
//         messages: {
//           required: "Please Enter Your Message."
//         }
//       });
//       $(".nameField").rules("add", {
//         required: true, name: true,
//         messages: {
//           required: "Please Enter Your Name."
//         }
//       });
//       $(".subjectField").rules("add", {
//         required: true, subject: true,
//         messages: {
//           required: "Please Enter Your Subject."
//         }
//       });     
//     })
        
//   })(jQuery)
// })