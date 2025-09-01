// Get the Vehicle Reg and send it to pre-checkout page
function searchVehicle() {
    const vehicleReg = document.getElementById("get_vehicle").value.toUpperCase().replace(/\s/g, '');
    if (!vehicleReg) {
        alert("Please enter Vehicle Reg.");
        return;
    }
    window.location.href = `/fetch-vehicle/${vehicleReg}/`;
}