$(document).ready(function() {

  $contactList = $('#contacts');

  function insertContact(contact){
      var $row = $('<tr data-id="'+ contact.id +'">');

      $row.append('<td>' + contact.id + '</td>');
      $row.append('<td>' + contact.first_name + '</td>');
      $row.append('<td>' + contact.last_name + '</td>');
      $row.append('<td>' + contact.email + '</td>');
      $row.append('<td>' + contact.phone + '</td>');                  
      $contactList.append($row);
  }

//bind to all the x buttons
//extract id from tr's data
//create URL from ID
// $.ajax ($.delete?)
//server will load and destroy the contact and respond with {success: true}.to_json
// cb function will need to delete that TR node from the table




  $('#new-contact-form').on('submit', function(e){
    e.preventDefault();
    
    var first_name = $(this).find('input[name="first_name"]').val();     
    var last_name = $(this).find('input[name="last_name"]').val();
    var email = $(this).find('input[name="email"]').val();
    var phone = $(this).find('input[name="phone"]').val();


    $.post('/contact-add.json', {
      contact: {
        first_name: first_name,
        last_name: last_name,
        email: email,
        phone: phone      
      }

    }, function(data) {

      //Note: we have to do this because we didn't specify the dataType to jQuery.
      //Better approach is to just do that so we don't have to parse ourselves. Not
      // a big deal but worth noting the difference between this callback and the getJSON callback.
      var result = JSON.parse(data);
      console.log(result);
      if (result.success){
        insertContact(result.contact);
      } else {
        alert(result.message);
      }
    });
  });




  $.getJSON('/contacts.json', function(data) {
   // console.log(data); this will let you test for data
   
    data.forEach(function(contact, i){
      insertContact(contact);
      //$container.append('<tr><td>1</td></tr>') repeatedly creates these elements
    });
  });
});
