$( document ).ready(function() {
  console.log( "ready!" );

  document.body.onmouseover = function(ev) {
    return $(ev.target).css({
      boxShadow: '0px 0px 5px red'
    });
  };

  document.body.onmouseout = function(ev) {
    return $(ev.target).css({
      boxShadow: ''
    });
  };

});