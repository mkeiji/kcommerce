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
    // alert(btnClass);

  }//--end myFunction FUNCTION



  /****************************** EXEC ******************************/
  // reset btn
  var btnClass = document.getElementById("filter_reset_btn");
  // search box
  var searchBox = document.getElementById("search_text");

  // clear searchbox on load
  searchBox.value = "";

});//--end of document
