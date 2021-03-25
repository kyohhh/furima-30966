import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    //const html = `<p>${data.user.nickname}${data.content.text}</p>`;
    const html = `<div class="comment-one">
                    <a href="/users/#{comment.user_id}">
                      <p class="comment-user">
                        ${data.user.nickname}
                      </p>
                    </a>
                    <p>${data.content.text}</p>
                  </div>`;
    //console.log(data.user.nickname);
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});
