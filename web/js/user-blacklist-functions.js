function  email_unblock() {

    document.getElementById("email_unblock_spanid").innerHTML = 'Do you want to unblock email ' + document.getElementById("emailId").value + '?';
    document.getElementById("email_unblockid").value = document.getElementById("emailId").value;
}
function  email_block() {

    document.getElementById("email_block_spanid").innerHTML = 'Do you want to block email ' + document.getElementById("emailId").value + '?';
    document.getElementById("email_blockid").value = document.getElementById("emailId").value;
}
function email_val() {
    var email = document.getElementById("emailId");
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!filter.test(email.value)) {
        document.getElementById("B1").style.display = "none";
        document.getElementById("B2").style.display = "none";
    } else {
        document.getElementById("B1").style.display = "block";
        document.getElementById("B2").style.display = "block";
    }
}
function formBlockingProcess(id) {

    $('#confirm_block').modal('hide');
    runNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. user will be blocked. ");
    $.ajax({
        type: "POST",
        url: "UserBlacklistJson",
        data: {
            email_block: id
        },
        dataType: "json",
        success: function (data) {
            loadBlacklistUsers();
            runNotification(data.result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            runNotification("<button class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });
    document.getElementById('emailId').value = '';
    email_val();

}
;
function formUnblockingProcess(id) {

    $('#confirm_unblock').modal('hide');
    runNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. user will be unblocked. ");
    $.ajax({
        type: "POST",
        url: "UserBlacklistJson",
        data: {
            email_unblock: id
        },
        dataType: "json",
        success: function (data) {
            loadBlacklistUsers();
            runNotification(data.result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            runNotification("<button class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === document.getElementById('emailId').value || tr.find('td:eq(0)').text() === document.getElementById('email_unblockid').value)
            $(this).hide();
    });
    document.getElementById('emailId').value = '';
    email_val();

}
;

function loadBlacklistUsers() {
    $.ajax({
        type: "POST",
        url: "Load_BlacklistUsersJson",
        dataType: "json",
        success: function (data) {
            var dataTable = $('#sample_1').dataTable();
            dataTable.fnClearTable();
            var list = data.blacklistedEmails;
            jQuery.each(list, function () {
                dataTable.fnAddData([
                    this.email_address,
                    '<div>'
                            + '<div class="btn-group">'
                            + '<a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">'
                            + '<i class="fa fa-cog"></i> <span class="caret"></span>'
                            + '</a>'
                            + '<ul role="menu" class="dropdown-menu pull-right">'
                            + '<li role="presentation">'
                            + '<clickedUnblockingEmail id="' + this.email_address + '">&nbsp;&nbsp;&nbsp;&nbsp;'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_unblock" data-toggle="modal">'
                            + '<i class="fa fa-unlock"></i> Unblock'
                            + '</a>'
                            + '</clickedUnblockingEmail>'
                            + '</li>'
                            + '</ul>'
                            + '</div>'
                            + '</div>'
                ]);
            });
            Main.init();
        },
        error: function (jqXHR, textStatus, errorThrown) {
            manualNotification("<button class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });
}
//function to initiate jquery.gritter
function runNotification(alert) {
    var unique_id = $.gritter.add({
        // (string | mandatory) the heading of the notification
        title: 'Notification!',
        // (string | mandatory) the text inside the notification
        text: alert,
        // (bool | optional) if you want it to fade out on its own or just sit there
        sticky: false,
        // (int | optional) the time you want it to be alive for before fading out
        time: 4000,
        // (string | optional) the class name you want to apply to that specific message
        class_name: 'my-sticky-class'
    });
    // You can have it return a unique id, this can be used to manually remove it later using
    /*
     setTimeout(function(){
     $.gritter.remove(unique_id, {
     fade: true,
     speed: 'slow'
     });
     }, 6000)
     */

    return false;



}

