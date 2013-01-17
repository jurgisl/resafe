// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function searchPasswords() {
  var keywords = $('#search-box').val();
  
  // abort previous search request
  if (window.search_request) window.search_request.abort();
  
  window.search_request = $.getJSON('/passwords/search.json', { 'keywords' : keywords }, function(data, status) {
    
    // clear dropdown
    var results = $('#search-results ul');
    results.children().remove()
    
    if(status == 'success') {
      if(data.length > 0) {
        // generate dropdown
        for(var i =0; i< data.length; i++) {
          var li = '<li>';
          li += '<a href="'+data[i]['url']+'">';
          li += data[i]['name'];
          li += '</a></li>';
          
          results.append(li);
        }
        // Show modal box
        results.find('a').click(function() {
          if($('#secret_dialog').length == 0) $('body').append('<div role="dialog" id="secret_dialog" class="modal hide fade">  <div class="modal-header">    <a data-dismiss="modal" class="close" aria-hidden="true">x</a>    <h3>Password</h3>  </div>  <div class="modal-body"></div>  <div class="modal-footer">    <button data-dismiss="modal" class="btn" aria-hidden="true">Close</button>  </div></div>');
          
          $('#secret_dialog').modal({
            show: true,
            remote: this.href
          });
        });
      }
      else {
        results.append('<li><a href="#"><b>Nothing found.</b></a></li>');
      }
      
    }
    else {
      results.append('<li><a href="#"><b>Error in search</b></a></li>');
    }
    $('#search-results ul').dropdown('toggle');
  })
}

jQuery(function($){
  $('#search-box').keyup(searchPasswords);
  
  $('.modal').on('hidden', function() {
    $(this).data('modal').$element.removeData();
  });
});
