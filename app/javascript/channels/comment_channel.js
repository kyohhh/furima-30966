import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<div class="comment-one">
                    <a href="/users/#{comment.user_id}">
                      <p class="comment-user">
                        ${data.user.nickname}
                      </p>
                    </a>
                    <p>${data.content.text}</p>
                  </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('beforeend', html);
    newComment.value='';
  }
});
