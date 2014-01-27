$(function() {

    $('#micropost-text').change(updateRemainingChars);
    $('#micropost-text').keyup(updateRemainingChars);

    // function updateRemainingChars() {
    //     chars = 140 - $('#micropost-text').val().length;
    //     el = $('span#character-count');
        
    //     el.text("Remaining: " + chars.toString());

    //     if(chars < 1) {
    //         el.css('color', 'red');
    //     } 
    //     else if (chars < 25) {
    //         el.css('color', 'orange');
    //     }
    //     else {
    //         el.css('color', 'black');
    //     }
    // }
});