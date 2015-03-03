$(document).ready(function() {
  signup();
  $('#login').show();
  $('#register_button').show();
  $('#registerform').hide();
  $('#login_button').hide();
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
   })
    .fail(function(response){
     console.log("error");
     console.log(response)
    })
  });
}
