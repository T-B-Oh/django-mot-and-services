// Get the Package id and send it to checkout page
$(document).ready(function(){
    $('.add-selection').on("click", function(event){
        event.preventDefault();
        let button = $(this);
        let id = button.attr("data-code");
        $.ajax({
            url: '/add_selection/',
            data: { 'id': id },
            success: function(response){
                // redirect to checkout and force refresh
                window.location.href = "/checkout?ts=" + new Date().getTime();
            }
        });
    });
});
