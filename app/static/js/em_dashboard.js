// Confirm before changing booking status
let selectedForm = null;
let selectedSelect = null;
let previousValue = null;

document.addEventListener("DOMContentLoaded", function () {
    // Track focus and previous value
    document.querySelectorAll(".status-select").forEach(function (select) {
        select.addEventListener("focus", function () {
            previousValue = this.value;
        });
        // Show confirmation modal on change
        select.addEventListener("change", function () {
            selectedForm = this.form;
            selectedSelect = this;
            document.getElementById("confirm-box").style.display = "flex";
        });
    });
    // Submit form
    document.getElementById("confirm-yes").addEventListener("click", function () {
        document.getElementById("confirm-box").style.display = "none";
        if (selectedForm) selectedForm.submit();
    });
    document.getElementById("confirm-no").addEventListener("click", function () {
        document.getElementById("confirm-box").style.display = "none";
        if (selectedSelect) {
            selectedSelect.value = previousValue;
        }
    });
})