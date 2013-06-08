$(document).ready(function(){

  $('#search').typeahead([
  { name: 'search here',
  remote: '/questions/search_terms/%QUERY.json' }
  ]);

  $('#search').keypress(function(e){
    if (e.which == 13) { $(this).parents('form').submit() }
  });
});
