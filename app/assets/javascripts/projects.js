// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
window.onload = function(){
    let revealButton = document.getElementById('reveal-edits');
    let editsHidden = true;
    let revealEdits = function(){
        if (editsHidden){
            let tableData = document.getElementsByClassName("edit-options");
            for (let a of tableData){
                a.classList.remove('d-none')
            }
            editsHidden = false;
        } else {
            let tableData = document.getElementsByClassName("edit-options");
            for (let a of tableData){
                a.classList.add('d-none')
            }
            editsHidden = true;
        }
    }
    revealButton.addEventListener('click', revealEdits)
}