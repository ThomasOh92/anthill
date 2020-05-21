// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.onload = function(){
    let revealTaskCommentEditsButton = document.getElementById('reveal-taskcomment-edits');
    let taskEditsHidden = true;
    let revealTaskCommentEdits = function(){
        if (taskEditsHidden){
            let taskComment = document.getElementsByClassName("edit-taskcomment-options");
            for (let a of taskComment){
                a.classList.remove('d-none')
            }
            taskEditsHidden = false;
        } else {
            let taskComment = document.getElementsByClassName("edit-taskcomment-options");
            for (let a of taskComment){
                a.classList.add('d-none')
            }
            taskEditsHidden = true;
        }
    }
    revealTaskCommentEditsButton.addEventListener('click', revealTaskCommentEdits)
}