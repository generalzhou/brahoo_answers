// $(document).ready(function(){
//   $('.select-best').closest('form').submit(function(event){

//     event.preventDefault();
//     var url = $(this).attr('action');
//     var data = $(this).serialize();
//     var this_form = $(this);

//     $.post(url, data, function(data) {
//       $('.select-best').remove();
//       var shades = $(data).find('.is-best');
//       this_form.append(shades);
//     });
//   });

//   $('.is-best').closest('form').submit(function(event){

//   event.preventDefault();
//   var url = $(this).attr('action');
//   var data = $(this).serialize();

//   $.post(url, data, function(data) {
//     $('.is-best').remove();
//     var comment = $(data).find('.select-best');
//     $('.best-answer').append(comment);
//     });
//   });

// });
