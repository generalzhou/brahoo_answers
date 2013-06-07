var newImage = "<img alt='Fist-bump-boom' src='/assets/fist-bump-boom.png' />";

$(document).ready(function(){
  $('body').on('submit', '.fist-bump form', function(e) {
    e.preventDefault();
    var url  = $(this).attr('action');
    $this = $(this);

    $.post(url, $this.serialize(), function(response){

      // Replace vote count
      $this.siblings('span').fadeOut(500, function(){
        $(this).text(response.count).fadeIn(500);    });

      // Replace image
      $this.html(newImage);

    }, 'json');
  });
});
