$(document).ready(function () {
    $("table tr td").on("click", "button", function (e) {
        const id = $(e.currentTarget).data("id");
        $.post("deleteFriend.php", { idZnajomego: id }, function (data) {
            if (data == "sukces") {
                $(`#${id}`).remove();
                if ($("table tr").length === 1) {
                    $("table").replaceWith("Nie znaleziono żadnych znajomych.");
                }
            }
        });
    });

    $("#sendFriendRequest").on("click", function () {
        const loginZnajomego = $("#loginZnajomego");
        if (loginZnajomego.val().trim() !== "") {
            $.post("sendFriendRequest.php", { login: loginZnajomego.val().trim() }, function (data) {
                console.log(data);
                if (data == "sukces") {
                    alert("Wysłano zaproszenie do znajomych!");
                    loginZnajomego.val("");
                }
                else {
                    alert(data);
                }
            });

        }
    });
});