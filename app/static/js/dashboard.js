// Switch between Upcoming, Previous, and Profile sections
function showSection(section) {
    const upcoming = document.getElementById("upcoming-section");
    const previous = document.getElementById("previous-section");
    const profile = document.getElementById("profile-section");

    if (section === 'upcoming') {
        upcoming.style.display = "block";
        previous.style.display = "none";
        profile.style.display = "none";
    } else if (section === 'previous') {
        previous.style.display = "block";
        upcoming.style.display = "none";
        profile.style.display = "none";
    } else if (section === 'profile') {
        previous.style.display = "none";
        upcoming.style.display = "none";
        profile.style.display = "block";
    }
}


function confirmCancel() {
    return confirm('Are you sure you want to cancel this booking?');
}

// Set the cancel form action when opening the pop up modal
document.addEventListener('DOMContentLoaded', function () {
    var cancelModal = document.getElementById('confirmCancelModal');
    var cancelForm = document.getElementById('cancelForm');
    cancelModal.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget;
    // Extract cancel URL from data attribute
    var url = button.getAttribute('data-cancel-url');
    // Update form action
    cancelForm.action = url;
    });
});
