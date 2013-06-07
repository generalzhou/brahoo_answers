$(document).ready(function(){

  $('div.comments > blockquote').hide();
  $('div.comments > a').click(function(){
    $(this).next('blockquote').slideDown(200);
  });
  $('div.comment-form').on('submit', 'form', function(event){
    var last_li = $(this).closest('ul').find('li').last();
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();
    var this_form = $(this);

    $.post(url, data, function(data) {
      var comment = $(data).find('li').last();
      last_li.after(comment);
      last_li.next().hide().slideDown(200, function(){
        this_form.hide();
      });
    });
  });

});
