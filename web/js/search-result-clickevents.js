$(document).on('click', 'clickedID', function () {

    var selection = this.id;
    $.ajax({
        type: "POST",
        url: "DetailedViewJson",
        data: {
            id: selection
        },
        dataType: "json",
        success: function (data) {
            $("#PlaceData").html("<br>");
            $("#PlaceHeader").html("");
            
                if (selection.charAt(0) === "U") {
                    var username = data.username;
                    var email = data.email;
                    var tel = data.tel;
                    var reg = data.reg;
                    var status = data.status;
                    var activation = data.activation;
                    var login = data.login;
                    var ads = data.ads;
                    $("#PlaceHeader").append("<h3>User Detailed view</h3>");

                    $("#PlaceData").append('<form action="#" role="form" class="smart-wizard form-horizontal" >'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">User name:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + username + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Email:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + email + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Tel:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   vlaue="' + tel + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Registration:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   vlaue="' + reg + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Status:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + status + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Activation:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + activation + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Last login:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + login + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">No. of ads:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + ads + '">'
                            + '</div>'
                            + '</div>'
                            + '</form>');


                }
                else if (selection.charAt(0) === "M") {
                    var id = data.id;
                    var sender = data.sender;
                    var reciever = data.reciever;
                    var content = data.content;
                    var time = data.time;
                    $("#PlaceHeader").append("<h3>Message Detailed view</h3>");
                    $("#PlaceData").append('<form action="#" role="form" class="smart-wizard form-horizontal" >'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + id + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Sender:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + sender + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reciever:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + reciever + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Content:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + content + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Sent on:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + time + '">'
                            + '</div>'
                            + '</div>'
                            + '</form>');
                }
                else if (selection.charAt(0) === "1") {
                    var id =data.id;
                    var email =data.email;
                    var reason =data.reason;
                    var message =data.message;
                    var item =data.item;
                    var title =data.title;
                    $("#PlaceHeader").append("<h3>Item report Detailed view</h3>");
                    $("#PlaceData").append('<form action="#" role="form" class="smart-wizard form-horizontal" >'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + id + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reporter\'s email:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + email + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reason for the report:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + reason + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reporter\'s message:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + message + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Item id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + item + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Item title:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + title + '">'
                            + '</div>'
                            + '</div>'
                            + '</form>');
                }
                else if (selection.charAt(0) === "2") {
                    var id =data.id;
                    var item =data.item;
                    var message_to =data.message_to;
                    var message_from =data.message_from;
                    var message =data.message;
                    var message_time =data.message_time;
                    var response =data.response;
                    var response_time =data.response_time;
                    $("#PlaceHeader").append("<h3>Inquiry report Detailed view</h3>");
                    $("#PlaceData").append('<form action="#" role="form" class="smart-wizard form-horizontal" >'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Inquiry id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + id + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Item id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + item + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Inquiry to:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + message_to + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Inquiry from:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + message_from + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Inquiry:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + message + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Inquiry time:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + message_time + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Response:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + response + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Response time:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + response_time + '">'
                            + '</div>'
                            + '</div>'
                            + '</form>');


                } else if (selection.charAt(0) === "3") {
                    var id = data.id;
                    var sender = data.sender;
                    var reciever = data.reciever;
                    var content = data.content;
                    var message_time = data.message_time;
                    var reported_time = data.reported_time;
                    $("#PlaceHeader").append("<h3>Message report Detailed view</h3>");
                    $("#PlaceData").append('<form action="#" role="form" class="smart-wizard form-horizontal" >'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Id:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + id + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Sender:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + sender + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reciever:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + reciever + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Content:</label>'
                            + '<div class="col-sm-7">'
                            + '   <textarea rows="3" class="form-control" readonly="true" style="resize: none; overflow-y: auto;" >' + content + '</textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Messaged time:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + message_time + '">'
                            + '</div>'
                            + '</div>'
                            + '<div class="form-group">'
                            + '<label class="col-sm-3 control-label">Reported time:</label>'
                            + '<div class="col-sm-7">'
                            + '   <input type="text" class="form-control" readonly="true"   value="' + reported_time + '">'
                            + '</div>'
                            + '</div>'
                            + '</form>');
                } else {
                    var id = data.id;
                    $("#PlaceHeader").append("<h3>Item Detailed view</h3>");
                    $("#PlaceData").append("<a href='www.google.com' target='blank'>Click to view the ad \"" + id + "\"</a><br>"
                            + "<hr>");
                }
            
            $("#GetData").html('AJAX Request is succeded!');
        },
        error: function () {
            $("#GetData").html('An error occurred while processing XML file!');
        }
    });
});