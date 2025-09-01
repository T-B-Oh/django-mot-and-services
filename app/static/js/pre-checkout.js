// Get the Package id and send it to checkout page
$(document).ready(function(){
    $('.add-selection').on("click", function(event){
        event.preventDefault();
        let option = $('#packageType option:selected');  
        let id = option.attr("package-code");    
        $.ajax({
            url: '/add_selection/',
            data: { 'id': id },
            success: function(response){
                window.location.href = "/checkout?ts=" + new Date().getTime();
            }
        });
    });
});
