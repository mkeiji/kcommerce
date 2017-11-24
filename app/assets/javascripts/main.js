// Loading the document
$(document).ready(function() {
   // executes when HTML-Document is loaded and DOM is ready



  /****************************** FUNCTIONS ******************************/
  /*
   *
   * @param
   * @return
   */
  function test () {
    // document.getElementById("test1").innerHTML = "YOU CLICKED ME!";
    // document.getElementById("test").className = "btn btn-primary";
    alert('HELLO');

  }//--end myFunction FUNCTION



  /****************************** EXEC ******************************/
  // reset btn
  var btnClass = document.getElementById("filter_reset_btn");
  // search box
  var searchBox = document.getElementById("search_text");

  // update cart btn test
  document.getElementById("update_cart_btn").addEventListener('click', function () {
    alert('OK');
  });

  // clear searchbox on load
  searchBox.value = "";

  // // quantity spinner from the cart
  // (function ($) {
  //   $('.spinner .btn:first-of-type').on('click', function() {
  //     $('.spinner input').val( $('.spinner input').val() + 1);
  //   });
  //   $('.spinner .btn:last-of-type').on('click', function() {
  //     $('.spinner input').val( $('.spinner input').val() - 1);
  //   });
  // })(jQuery);

  // // using parse int
  // (function ($) {
  //   $('.spinner .btn:first-of-type').on('click', function() {
  //     $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 1);
  //   });
  //   $('.spinner .btn:last-of-type').on('click', function() {
  //     $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 1);
  //   });
  // })(jQuery);

});//--end of document
