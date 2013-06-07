$(document).ready(function(){

  $('#search').typeahead([
  { name: 'search here',
  remote: '/questions/search_terms/%QUERY.json' }
  ]);
});
