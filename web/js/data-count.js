




function customData() {
    var firstDate = document.getElementById('firstdate').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddate').value + ' 00:00:00';
    $.ajax({
        type: "GET",
        url: "CustomDataXML",
        dataType: "xml",
        data: {
            fd: firstDate,
            sd: secondDate
        },
        success: function (xml) {
            $("#CustomDataXML").html("");

            $(xml).find('value').each(function () {

                var result = $(this).find('Result').text();



                $("#CustomDataXML").append(result);


            });


        }
    });
}
function customDataUser() {
    var firstDate = document.getElementById('firstdateuser').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddateuser').value + ' 00:00:00';
    $.ajax({
        type: "GET",
        url: "CustomDataXMLUser",
        dataType: "xml",
        data: {
            fd: firstDate,
            sd: secondDate
        },
        success: function (xml) {
            $("#CustomDataXMLUser").html("");

            $(xml).find('value').each(function () {

                var result = $(this).find('Result').text();



                $("#CustomDataXMLUser").append(result);


            });


        }
    });
}
function customDataAds() {
    var firstDate = document.getElementById('firstdateads').value + ' 00:00:00';
    var secondDate = document.getElementById('seconddateads').value + ' 00:00:00';
    $.ajax({
        type: "GET",
        url: "CustomDataXMLAds",
        dataType: "xml",
        data: {
            fd: firstDate,
            sd: secondDate
        },
        success: function (xml) {
            $("#CustomDataXMLAds").html("");

            $(xml).find('value').each(function () {

                var result = $(this).find('Result').text();



                $("#CustomDataXMLAds").append(result);


            });


        }
    });
}

        