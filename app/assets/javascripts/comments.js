$(document).ready(function(){
  // $("#try_xhr").on('click', function(){
  //   $.ajax({
  //     type: "GET",
  //     url: "/comments.json",
  //     success: function(data) {
  //       console.dir(data);
  //     }
  //   });
  // });

  $("#try_xhr").on('click', function(){
    $.get("/comments.json", function(data) { console.dir(data); });
  });

  $("#add_comment").on("click", function(a) {
    a.preventDefault();
    $.post('/comments.json', $("#new_comment").serialize(), function(data) {
      $('#comments').append($("<strong></strong>").text(data.author)).append(data.content + "</br></br>");
      $("#new_comment")[0].reset();
    });
  });
});
