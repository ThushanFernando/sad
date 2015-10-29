function manualNotification(alert) {
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

function approve(id, to, subject) {
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === id)
            tr.css({'display': "none"});
    });
    $('#confirm_approve' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. ad will be approved. ");
    $.ajax({
        type: "POST",
        url: "Apr_ReviewAdsJson",
        data: {
            item: id,
            to: to,
            subject: subject,
            action: 'Approve'
        },
        dataType: "json",
        success: function (data) {
            loadReviews();
            manualNotification(data.result);

        },
        error: function (jqXHR, textStatus, errorThrown) {
            manualNotification("<button class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });

}
function modify() {
    if (document.getElementById('content-body').value.length === 0) {
        manualNotification("<button class=\"btn btn-red\">"             //returning notification of the failure 
                + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                + "</i></button><br><strong> Please enter the Reason & solution for modification !</strong>");
    } else {
        $('tr').each(function () {
            var tr = $(this);
            if (tr.find('td:eq(0)').text() === document.getElementById('itemid').value)
                tr.css({'display': "none"});
        });
        $('#message').modal('hide');
        manualNotification("<button class=\"btn btn-green\"><i  class=\""
                + "glyphicon glyphicon-ok-sign\"></i></button><br>"
                + "Processing request. ad will be requested to modify. ");
        $.ajax({
            type: "POST",
            url: "Mod_ReviewAdsJson",
            data: {
                to: document.getElementById('toid').value,
                subject: document.getElementById('subjectid').value,
                content_header: document.getElementById('content-header').value,
                content_body: document.getElementById('content-body').value,
                itemname: document.getElementById('itemid').value,
                reason: document.getElementById('reasonid').value

            },
            dataType: "json",
            success: function (data) {
                loadReviews();
                manualNotification(data.result);

            },
            error: function (jqXHR, textStatus, errorThrown) {
                manualNotification("<button class=\"btn btn-red\"><i  class=\""
                        + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                        + "<strong>Server is offline..</strong><br>\n"
                        + "Please try again in a minute\n");
            }
        });
    }
    return false;
}

function removeAd(id, to, subject) {
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === id)
            tr.css({'display': "none"});
    });
    $('#confirm_remove' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. ad will be removed. ");
    $.ajax({
        type: "POST",
        url: "Rmv_ReviewAdsJson",
        data: {
            item: id,
            to: to,
            subject: subject,
            action: 'Remove'

        },
        dataType: "json",
        success: function (data) {
            loadReviews();
            manualNotification(data.result);

        },
        error: function (jqXHR, textStatus, errorThrown) {
            manualNotification("<button class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });

}

function loadReviews() {
    $.ajax({
        type: "POST",
        url: "Load_ReviewAdsJson",
        dataType: "json",
        success: function (data) {
            var dataTable = $('#sample_1').dataTable();
            dataTable.fnClearTable();
            var list = data.reviewAds;
            jQuery.each(list, function () {
                dataTable.fnAddData([
                    this.item_number,
                    this.title,
                    this.time_stamp,
                    '<div data-content="' + this.reason + '" data-placement="right" data-trigger="hover" class="btn popovers">' + this.status + '</div>',
                    '<div>'
                            + '<div class="btn-group">'
                            + '<a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">'
                            + '<i class="fa fa-cog"></i> <span class="caret"></span>'
                            + '</a>'
                            + '<ul role="menu" class="dropdown-menu pull-right">'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#" target="blank">'
                            + '<i class="fa clip-arrow-right-2"></i> View'
                            + '</a>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_approve' + this.item_number + '" data-toggle="modal">'
                            + '<i class="fa clip-checkbox-checked"></i><span> Approve</span>'
                            + '</a>'
                            + '<div id="confirm_approve' + this.item_number + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Approve the advertiesment?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="approve(\'' + this.item_number + '\',\'' + this.username + '\',\'' + this.title + '\')">'
                            + 'Approve'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1"  href="#Modify' + this.item_number + '" data-toggle="modal">'
                            + '<i class="fa clip-bulb"></i>Modify'
                            + '</a>'
                            + '<div id="Modify' + this.item_number + '" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<label class=" control-label">'
                            + '<span class=" badge">Reason for Modifying Ad:</span><span class="symbol required"></span>'
                            + '</label>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<input type="hidden" id="MINMA' + this.item_number + '" value="' + this.item_number + '">'
                            + '<input type="hidden" id="MITMA' + this.item_number + '" value="' + this.title + '">'
                            + '<input type="hidden" id="MIUMA' + this.item_number + '" value="' + this.username + '">'
                            + '<div class="form-group">'
                            + '<textarea class="autosize form-control" placeholder="Reason for modification" id="itemRMA' + this.item_number + '" required="true"  rows="5" style="overflow-y: auto;resize: none; word-wrap: break-word;"></textarea>'
                            + '</div>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-default">'
                            + 'Cancel'
                            + '</button>'
                            + '<clickedReportModifyAd id="MA' + this.item_number + '">'
                            + '<button class="btn btn-primary">'
                            + 'Proceed'
                            + '</button>'
                            + '</clickedReportModifyAd>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_remove' + this.item_number + '" data-toggle="modal">'
                            + '<i class="fa clip-remove"></i><span> Remove</span>'
                            + '</a>'
                            + '<div id="confirm_remove' + this.item_number + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Remove the advertiesment?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="removeAd(\'' + this.item_number + '\',\'' + this.username + '\',\'' + this.title + '\');">'
                            + 'Remove'
                            + '</button>'
                            + '</div>'
                            + '</div>'
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