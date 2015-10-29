

function refresh_data() {

    $.ajax({
        type: "POST",
        url: "DataCountsJson",
        dataType: "json",
        success: function (data) {
            var msgcount = data.messageCount;
            var reviewads = data.ads;
            var topads = data.topads;
            var viewreports = data.reports;

            $("#MC").html(msgcount);
            $("#MC1").html(msgcount);
            $("#MC2").html(msgcount);
            $("#RA").html(reviewads);
            $("#TA").html(topads);
            $("#VR").html(viewreports);

        }
    });


    



}
;


function customData() {
    var firstDate = document.getElementById('firstdate').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddate').value + ' 00:00:00';
    $.ajax({
        type: "POST",
        url: "CustomDataJson",
        dataType: "json",
        data: {
            fd: firstDate,
            sd: secondDate
        },
        success: function (data) {
            $("#CustomDataJson").html("");
            var result = data.result;
            $("#CustomDataJson").append(result);

        }
    });
}
function customDataUser() {
    var firstDate = document.getElementById('firstdateuser').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddateuser').value + ' 00:00:00';
    $.ajax({
        type: "POST", url: "CustomDataUserJson",
        dataType: "json",
        data: {
            fd: firstDate,
            sd: secondDate},
        success: function (data) {
            $("#CustomDataUserJson").html("");

            var result = data.result;
            $("#CustomDataUserJson").append(result);
        }
    });
}
function customDataAds() {
    var firstDate = document.getElementById('firstdateads').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddateads').value + ' 00:00:00';
    $.ajax({
        type: "POST", url: "CustomDataAdsJson",
        dataType: "json",
        data: {
            fd: firstDate,
            sd: secondDate
        },
        success: function (data) {
            $("#CustomDataAdsJson").html("");

            var result = data.result;
            $("#CustomDataAdsJson").append(result);

        }
    });
}
function clr() {
    document.getElementById("firstdate").value = "";
    document.getElementById("firstdateuser").value = "";
    document.getElementById("firstdateads").value = "";
    document.getElementById("seconddate").value = "";
    document.getElementById("seconddateuser").value = "";
    document.getElementById("seconddateads").value = "";
    document.getElementById("CustomDataJson").innerHTML = "";
    document.getElementById("CustomDataUserJson").innerHTML = "";
    document.getElementById("CustomDataAdsJson").innerHTML = "";
    document.getElementById("CheckPassJson").innerHTML = "";
    document.getElementById("username").value = "";
    document.getElementById("password").value = "";

}

function login_check() {
    $("#CheckPassJson").html("");
    var username = document.getElementById('username').innerHTML;

    var password = document.getElementById('password').value;

    if (password !== "") {
        $("#CheckPassJson").html("<div class=\"alert alert-success\">\n"
                + "<button data-dismiss=\"alert\" class=\"close\">\n"
                + "&times;\n"
                + "</button>\n"
                + "<i class=\"fa fa-check-circle\"></i>\n"
                + "<String>Validating..</strong>\n"
                + "</div>");

        $.ajax({
            type: "POST",
            url: "CheckPassJson",
            dataType: "json",
            data: {
                username: username,
                password: password

            },
            success: function (data) {



                var result = data.result;
                if (result === true) {
                    window.location.replace("LoginChange");
                } else {
                    $("#CheckPassJson").html("<div class=\"alert alert-danger\">\n"
                            + "<button data-dismiss=\"alert\" class=\"close\">\n"
                            + "&times;\n"
                            + "</button>\n"
                            + "Please enter the valid password\n"
                            + "</div>");
                }



            },
            error: function () {
                $("#CheckPassJson").html("<div class=\"errorHandler alert alert-danger \">\n"//returning notification of the success or the failure
                        + "<button data-dismiss=\"alert\" class=\"close\">\n"
                        + "&times;\n"
                        + "</button>\n"
                        + "<strong>Server is offline..</strong><br>\n"
                        + "Please try again in a minute\n"
                        + "</div>");
            }
        });
    }
    return false;
}
       