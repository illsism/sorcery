$(document).ready(function(){
  $('#product-image-file-show img').error(function() {
    $(this).attr('src', '../assets/products/default_image.png');
    return false;
  });

  $('#product-image-file-index img').error(function() {
    $(this).attr('src', '/assets/products/default_image.png');
    return false;
  });
});
