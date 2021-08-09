function cancelPendingOrderConfirm() {
    return comfirmValueBox("confirmCancelPendingOrder", "Are you sure you want to cancel this order? (This action can be undone at Canceled Orders!)");
}

function rependingCanceledOrderConfirm() {
    return comfirmValueBox("confirmRependingCanceledOrder", "Are you sure you want to re-pending this order?");
}
function approvePendingOrderConfirm() {
    return comfirmValueBox("confirmApprovePendingOrder", "Are you sure you want to approve this order?");
}
function successedDeliveryOrderConfirm() {
    return comfirmValueBox("confirmSuccessedDeliveryOrder", "Are you sure this order delivered successfully?");
}
function cancelFailedDeliveryOrderConfirm() {
    return comfirmValueBox("confirmCancelFailedDeliveryOrder", "Are you sure want to cancel this order?");
}
function rependingFailedDeliveryOrderConfirm() {
    return comfirmValueBox("confirmRependingFailedDeliveryOrder", "Are you sure want to re-pending this order?");
}
function returnedOrderConfirm() {
    return comfirmValueBox("confirmReturnedDeliveryOrder", "Are you sure this order has been returned? (Cancel order)");
}

function comfirmValueBox(nameInput, messageConfirm) {
    //tao hiden input
    let confirm_value = document.createElement("INPUT");
    confirm_value.type = "hidden";
    confirm_value.name = nameInput;

    //hien thi confirm dialog
    if (confirm(messageConfirm)) {
        confirm_value.value = "Yes";
    } else {
        confirm_value.value = "No";
        return false;
    }

    //gan hiden iput vao trang
    document.forms[0].appendChild(confirm_value);
}

function trackingOrder() {
    alert("This function will update when cooperating with a real delivery company.");
    return false;
}