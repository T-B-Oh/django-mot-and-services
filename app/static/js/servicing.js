// Get the Package id and send it to checkout page
$(document).ready(function(){
    $('.add-selection').on("click", function(event){
        event.preventDefault();  // stop the link from navigating immediately
        let button = $(this);
        let id = button.attr("package-code");
        $.ajax({
            url: '/add_selection/',
            data: { 'id': id },
            success: function(response){
                console.log("Saved:", response);
                // redirect to checkout with force refresh
                window.location.href = "/checkout?ts=" + new Date().getTime();
            },
            error: function(){
                alert("Error");
            }
        });
    });
});
