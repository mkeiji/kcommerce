// Loading the document
// executes everything that is inside when HTML-Document is loaded and DOM is ready
$(document).ready(function() {
  
  /****************************** FUNCTIONS ******************************/
  /*
   * execute on load
   * @param
   * @return
   */
  function init() {
    // Clear forms here
    document.getElementById("search_text").value = "";

  }//--end init FUNCTION


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


  /****************************** EXEC ******************************/
  // on window load execute init()
  window.onload = init();



});//--end of document
