$(document).ready(function () {
    $("#sendReport").on("click", function () {
        const reportText = $("#reportText");
        if (reportText.val().trim() !== "") {
            $.post("handle_report.php", { reportText: reportText.val() }, function (data) {
                if (data == "sukces") {
                    alert("Wysłano zgłoszenie!");
                    reportText.val("");
                }
            }
            );
        }
    })
});