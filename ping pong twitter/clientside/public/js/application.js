$(document).ready(function() {
  signup();
  login();








  $('#login').show();
  $('#register_button').show();
  // $('#login').hide();
  // $('#register_button').hide();
  // $('.login_register').hide();
  $('#registerform').hide();
  $('#login_button').hide();
  $('#main_page').hide();

});

function signup() {
  $('#register_button').on('click', function(event){
    event.preventDefault()
 $.ajax({
    })
  .done(function(){

      console.log("done")
      $('#registerform').show();
      $('#login_button').show();
      $('#login').hide();
      $('#register_button').hide();

      register();
   })
    .fail(function(response){
     console.log("error");
     console.log(response)
    })

  })

}


function register() {
  $('#registerform').on('submit', function(event){
    event.preventDefault()

    data = $("#registerform").serialize(),
    console.log(data)

    $.ajax({
      url: 'http://localhost:3000/user',
      type: 'post',
      data: data
      // dataType: 'json',
    })
    .done(function(response){
      console.log(response)
      console.log(data)
      console.log("done")
      $('#registerform').hide();
      $('#login_button').hide();
      $('.login_register').hide();
      $('#main_page').show();

   })
    .fail(function(response){
     console.log("error");
     console.log(response)
    })
  });
}



function login() {
  $('#login').on('submit', function(event){
    event.preventDefault()

    console.log(this)
    data2 = $('#loginform').serialize()
    console.log("i amh")
    console.log(data2)

    $.ajax({
      url: 'http://localhost:3000/user/login',
      type: 'post',
      data: data2
      // dataType: 'json',
    })
    .done(function(response){
      // response1 = JSON.parse(response),
      console.log(response)
      console.log(data2)
      console.log("done")
      $('#main_page').show();
      $('#login_container').hide();

   })
    .fail(function(response){
     console.log("error");
     console.log(response)
    })
  });
}
