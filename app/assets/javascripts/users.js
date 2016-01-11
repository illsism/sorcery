$(document).ready(function(){
  $('#profile-picture-show img').error(function() {
    $(this).attr('src', '../assets/users/image_missing.jpg');
    return false;
  });

  $('#profile-picture-index img').error(function() {
    $(this).attr('src', '/assets/users/image_missing.jpg');
    return false;
  });
});
