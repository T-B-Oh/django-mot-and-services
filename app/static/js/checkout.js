// Change and Redirect to checkout page with New Vehicle Reg
function searchVehicleChange() {
    const vehicleReg = document.getElementById("get_vehicle").value;
    if (!vehicleReg) {
        alert("Please enter Vehicle Reg");
        return;
    }
    window.location.href = `/fetch-vehicle-change/${vehicleReg}/`;
}

$(document).ready(function(){
    // Get the packge id and send it to booking form
    $('.add-selection').on("click", function(){
        let option = $('#packageType option:selected');
        let id = option.attr("package-code")
        $.ajax({
            url: '/add_selection/',
            data: {
                'id': id,
            },
            success: function (response) {
            location.reload();
            },
            error: function (xhr, status, error) {
                alert('An error occurred: ' + error);
            }
        })
    })

    // Show pop up Select New Pacakge model
    $(document).ready(function() {
        $('#changePackageButton').on('click', function() {
            $('#changePackageModal').modal('show');
        });
    });


    // Show pop-up Search New Vehicle model
    $(document).ready(function() {
        $('#changeVehicleButton').on('click', function() {
            $('#changeVehicleModal').modal('show');
        });
    });

})


document.addEventListener("DOMContentLoaded", function () {

    // Fetch available time slots (only to show available time)
    const bookingDateInput = document.getElementById('booking_date');
    if (bookingDateInput) {
        bookingDateInput.addEventListener('change', function () {
            const selectedDate = this.value;

            // Get request to the End point for available time slots
            fetch(`/available_time_slots/?date=${selectedDate}`)
                .then(response => response.json()) // convert response to JSON
                .then(data => {
                    const timeSelect = document.getElementById('booking_time');
                    timeSelect.innerHTML = '<option value="">Select a time</option>';

                    if (data.available_slots) {
                        data.available_slots.forEach(function (slot) {
                            const option = document.createElement('option');
                            option.value = slot;
                            option.textContent = slot;
                            timeSelect.appendChild(option);
                        });
                    } else {
                        alert('No available time slots for this date.');
                    }
                })
                .catch(error => {
                    console.error('Error fetching available slots:', error);
                });
        });
    }

    // Validate partial profile form
    const profileForm = document.getElementById('partial_profile_form');
    if (profileForm) {
        profileForm.addEventListener('submit', function (e) {
            const firstName = document.getElementById('first_name').value.trim();
            const lastName = document.getElementById('last_name').value.trim();
            const contact = document.getElementById('contact').value.trim();
            const errorBox = document.getElementById('form-error');

            if (!firstName || !lastName || !contact) {
                e.preventDefault();
                errorBox.style.display = 'block';

                setTimeout(() => {
                    errorBox.style.display = 'none';
                }, 3000);
            }
        });
    }
});

