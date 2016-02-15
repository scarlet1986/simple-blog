var btn = document.getElementById('try_xhr');
if(btn) {
  btn.addEventListener("click", function(){
    var xhr = new XMLHttpRequest();

    xhr.open("GET", '/comments.json', true);

    xhr.onreadystatechange = function() {
      if (this.readyState != 4) return;
      var comments = JSON.parse(this.responseText);
      console.log(comments[0].id);
      console.log(comments[1].id);
      console.log(comments[0].content);
    }

    xhr.send();  
  });
};

document.getElementById('add_comment').addEventListener("click", function(e){
  e.preventDefault();
  var form = document.getElementById('new_comment');

  console.log(form);
  var data = {
    'utf8': form.elements["utf8"].value,
    'comment[commentable_id]': form.elements["comment[commentable_id]"].value,
    'comment[commentable_type]': form.elements["comment[commentable_type]"].value,
    'authenticity_token': form.elements["authenticity_token"].value,
    'comment[author]': form.elements["comment[author]"].value,
    'comment[content]': form.elements["comment[content]"].value
  };


  var xhr = new XMLHttpRequest();
  var boundary = String(Math.random()).slice(2);
  var boundaryMiddle = '--' + boundary + '\r\n';
  var boundaryLast = '--' + boundary + '--\r\n';

  console.log(boundary);

  var body = ['\r\n'];
  for (var key in data) {
    body.push('Content-Disposition: form-data; name="' + key + '"\r\n\r\n' + data[key] + '\r\n');
  }

  body = body.join(boundaryMiddle) + boundaryLast;

  xhr.open("POST", '/comments.json', true);

  xhr.setRequestHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);


  xhr.onreadystatechange = function() {
    if (this.readyState != 4) return;
    var comment = JSON.parse(this.responseText);
    var comments_container = document.getElementById('comments');

    author = document.createElement("strong");
    author.appendChild(document.createTextNode(comment.author));
    comments_container.appendChild(author);
    comments_container.appendChild(document.createTextNode(comment.content));
    comments_container.appendChild(document.createElement('br'));
    comments_container.appendChild(document.createElement('br'));
    form.reset();
  }

  xhr.send(body);  
});
