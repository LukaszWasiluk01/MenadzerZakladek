$(document).ready(function () {
    $("table tr td").on("click", "button", function (e) {
        const id = $(e.currentTarget).data("id");
        $.post("deleteFriend.php", { idZnajomego: id }, function (data) {
            if (data == "sukces") {
                $(`#${id}`).remove();
                if($("table tr").length === 1){
                    $("table").replaceWith("Nie znaleziono żadnych znajomych.");
                }
            }
        });
    });
});