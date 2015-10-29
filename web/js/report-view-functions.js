//function to initiate jquery.gritter

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

function blockAd() {
    if (document.getElementById('contentidBA-body').value.length === 0) {
        manualNotification("<button class=\"btn btn-red\"><i  class=\""
                + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                + "<strong></strong><br>"
                + "Please enter the Reason for Ad block\n");

    } else {
        var num = document.getElementById("ad").innerHTML;
        if (num === "1") {
            document.getElementById("ad").innerHTML = "";
        } else {
            num = num - 1;
            document.getElementById("ad").innerHTML = num;

        }
        $('tr').each(function () {
            var tr = $(this);
            if (tr.find('td:eq(0)').text() === document.getElementById('reportidBA').value && tr.find('td:eq(2)').text() === document.getElementById('itemidBA').value)
                tr.css({'display': "none"});

        });
        $('#itemBA').modal('hide');
        manualNotification("<button class=\"btn btn-green\"><i  class=\""
                + "glyphicon glyphicon-ok-sign\"></i></button><br>"
                + "Processing request. ad will be blocked. ");
        $.ajax({
            type: "POST",
            url: "BlockAdJson",
            data: {
                toBA: document.getElementById('toidBA').value,
                subjectBA: document.getElementById('subjectidBA').value,
                contentBA_header: document.getElementById('contentidBA-header').value,
                contentBA_body: document.getElementById('contentidBA-body').value,
                itemBA: document.getElementById('itemidBA').value,
                reportBA: document.getElementById('reportidBA').value,
                reasonBA: document.getElementById('reasonidBA').value

            },
            dataType: "json",
            success: function (data) {
                loadAdReport();
                loadReportCount();
                loadMessageReport();
                loadInquiryReport();
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
}
function blockAdUser(id, to) {
    var num = document.getElementById("ad").innerHTML;
    if (num === "1") {
        document.getElementById("ad").innerHTML = "";
    } else {
        num = num - 1;
        document.getElementById("ad").innerHTML = num;

    }
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === id)
            tr.css({'display': "none"});

    });
    $('#confirm_blockU' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. user will be blocked. ");
    $.ajax({
        type: "POST",
        url: "BlockAdUserJson",
        data: {
            toBU: to,
            reportBU: id

        },
        dataType: "json",
        success: function (data) {
            loadAdReport();
            loadReportCount();
            loadMessageReport();
            loadInquiryReport();
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
function removeAdReport(id) {
    $('#confirm_remove' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. report will be removed. ");
    $.ajax({
        type: "POST",
        url: "RemoveAdReportJson",
        data: {
            removeReport: id

        },
        dataType: "json",
        success: function (data) {
            loadAdReport();
            loadReportCount();
            loadMessageReport();
            loadInquiryReport();
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
function blockMessages(id, to, content) {
    $('#confirm_blockM' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. message will be blocked. ");
    $.ajax({
        type: "POST",
        url: "BlockMessageJson",
        data: {
            toBM: to,
            messageBM: id,
            message_contentBM: content
        },
        dataType: "json",
        success: function (data) {
            loadMessageReport();
            loadReportCount();
            loadAdReport();
            loadInquiryReport();
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
function blockMessaggeUser(id, to) {
    var num = document.getElementById("msg").innerHTML;
    if (num === "1") {
        document.getElementById("msg").innerHTML = "";
    } else {
        num = num - 1;
        document.getElementById("msg").innerHTML = num;

    }
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === id && tr.find('td:eq(1)').text()===to)
            tr.css({'display': "none"});
            
    });
    $('#confirm_blockMU' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. user will be blocked. ");
    $.ajax({
        type: "POST",
        url: "BlockMessageUserJson",
        data: {
            toBMU: to,
            messageBMU: id

        },
        dataType: "json",
        success: function (data) {
            loadMessageReport();
            loadReportCount();
            loadAdReport();
            loadInquiryReport();
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
function removeMessageReport(id) {
    $('#confirm_removeMR' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. report will be removed. ");
    $.ajax({
        type: "POST",
        url: "RemoveMessageReportJson",
        data: {
            removeReport: id
        },
        dataType: "json",
        success: function (data) {
            loadMessageReport();
            loadReportCount();
            loadAdReport();
            loadInquiryReport();
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

function blockInquiry(id, to, content) {
    $('#confirm_blockI' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. inquiry will be blocked. ");
    $.ajax({
        type: "POST",
        url: "BlockInquiryJson",
        data: {
            toBI: to,
            inquiryBI: id,
            inquiry_contentBI: content
        },
        dataType: "json",
        success: function (data) {
            loadInquiryReport();
            loadReportCount();
            loadAdReport();
            loadMessageReport();
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
function blockInquiryUser(id, to) {
    var num = document.getElementById("inq").innerHTML;
    if (num === "1") {
        document.getElementById("inq").innerHTML = "";
    } else {
        num = num - 1;
        document.getElementById("inq").innerHTML = num;

    }
    $('tr').each(function () {
        var tr = $(this);
        if (tr.find('td:eq(0)').text() === id && tr.find('td:eq(1)').text()===to)
            tr.css({'display': "none"});
            
    });
    $('#confirm_blockIU' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. user will be blocked. ");
    $.ajax({
        type: "POST",
        url: "BlockInquiryUser",
        data: {
            toBIU: to

        },
        dataType: "json",
        success: function (data) {
            loadInquiryReport();
            loadReportCount();
            loadAdReport();
            loadMessageReport();
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
function removeInquiryReport(id) {
    $('#confirm_removeIR' + id).modal('hide');
    manualNotification("<button class=\"btn btn-green\"><i  class=\""
            + "glyphicon glyphicon-ok-sign\"></i></button><br>"
            + "Processing request. report will be removed. ");
    $.ajax({
        type: "POST",
        url: "RemoveInquiryReportJson",
        data: {
            removeReport: id
        },
        dataType: "json",
        success: function (data) {
            loadInquiryReport();
            loadReportCount();
            loadAdReport();
            loadMessageReport();
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
function loadAdReport() {
    $.ajax({
        type: "POST",
        url: "LoadAdReports",
        dataType: "json",
        success: function (data) {
            var dataTable = $('table.display-ads').dataTable();
            dataTable.fnClearTable();
            var list = data.ReportedItems;
            jQuery.each(list, function () {

                dataTable.fnAddData([
                    this.report_id,
                    this.reporter_email,
                    this.item_number,
                    this.title,
                    '<div>'
                            + '<div class="btn-group">'
                            + '<a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">'
                            + '<i class="fa fa-cog"></i> <span class="caret"></span>'
                            + '</a>'
                            + '<ul role="menu" class="dropdown-menu pull-right">'
                            + '<li role="presentation">'
                            + '<clickedReport id="VR' + this.report_id + '">&nbsp;&nbsp;&nbsp;&nbsp;'
                            + '<a role="menuitem" tabindex="-1" href="#view_report"  data-toggle="modal">'
                            + '<i class="fa clip-pencil-2"></i> <span>View Report</span>'
                            + '<input type="hidden" id="itemREVR' + this.report_id + '" value="' + this.reporter_email + '">'
                            + '<input type="hidden" id="itemTVR' + this.report_id + '" value="' + this.title + '">'
                            + '<input type="hidden" id="itemSVR' + this.report_id + '" value="' + this.status + '">'
                            + '<input type="hidden" id="itemRVR' + this.report_id + '" value="' + this.report_reason + '">'
                            + '<input type="hidden" id="itemMVR' + this.report_id + '" value="' + this.reporter_message + '">'
                            + '</a>'
                            + '</clickedreport>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#" target="blank">'
                            + '<i class="fa clip-images-3"></i> View ad'
                            + '</a>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#blockA' + this.report_id + '"  data-toggle="modal">'
                            + '<i class="fa clip-locked"></i><span>Block Ad</span>'
                            + '</a>'
                            + '<div id="blockA' + this.report_id + '" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<label class=" control-label">'
                            + '<span class=" badge">Reason for Blocking Ad:</span><span class="symbol required"></span>'
                            + '</label>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<input type="hidden" id="itemINBA' + this.report_id + '" value="' + this.item_number + '">'
                            + '<input type="hidden" id="itemRIBA' + this.report_id + '" value="' + this.report_id + '">'
                            + '<input type="hidden" id="itemTBA' + this.report_id + '" value="' + this.title + '">'
                            + '<input type="hidden" id="itemUBA' + this.report_id + '" value="' + this.username + '">'
                            + '<div class="form-group">'
                            + '<div>'
                            + '<textarea class="autosize form-control" id="itemRBA' + this.report_id + '" required="" placeholder="Reason for blocking ad"  rows="5"  style="overflow-y: auto; word-wrap: break-word; resize: none;"></textarea>'
                            + '</div>'
                            + '</div>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-default" onclick="document.getElementById(\'itemRBA' + this.report_id + '\').value = \'\'">'
                            + 'Cancel'
                            + '</button>'
                            + '<clickedReportBlockAd id="BA' + this.report_id + '">'
                            + '<button type="button" class="btn btn-primary">'
                            + 'Block'
                            + '</button>'
                            + '</clickedReportBlockAd>'
                            + '</div>'
                            + '</div>    '
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_blockU' + this.report_id + '"  data-toggle="modal">'
                            + '<i class="fa clip-locked"></i><span>Block User</span>'
                            + '</a>'
                            + '<div id="confirm_blockU' + this.report_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Block user ' + this.username + '?</span>'
                            + '<form onsubmit="return false">'
                            + '<input type="hidden"  id="toidBU' + this.report_id + '" value="' + this.username + '">'
                            + '<input type="hidden"  id="reportidBU' + this.report_id + '" value="' + this.report_id + '">'
                            + '</form>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="blockAdUser(\'' + this.report_id + '\',\'' + this.username + '\')">'
                            + 'Block'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_remove' + this.report_id + '" data-toggle="modal">'
                            + '<i class="fa clip-remove"></i> Remove Report'
                            + '</a>'
                            + '<div id="confirm_remove' + this.report_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Remove report?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="removeAdReport(' + this.report_id + ')">'
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
function loadMessageReport() {
    $.ajax({
        type: "POST",
        url: "LoadMessageReports",
        dataType: "json",
        success: function (data) {
            var dataTable = $('table.display-msgs').dataTable();
            dataTable.fnClearTable();
            var list = data.ReportedMessages;
            jQuery.each(list, function () {

                dataTable.fnAddData([
                    this.message_id,
                    this.sender,
                    this.message_time_stamp,
                    '<div>'
                            + '<div class="btn-group">'
                            + '<a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">'
                            + '<i class="fa fa-cog"></i> <span class="caret"></span>'
                            + '</a>'
                            + '<ul role="menu" class="dropdown-menu pull-right">'
                            + '<li role="presentation">'
                            + '<clickedViewMessage id="VM' + this.message_id + '">&nbsp;&nbsp;&nbsp;&nbsp;'
                            + '<a role="menuitem" tabindex="-1" href="#view_message"  data-toggle="modal">'
                            + '<i class="fa clip-bubbles-3"></i> <span>View Message</span>'
                            + '</a>'
                            + '<input type="hidden" id="messageSVM' + this.message_id + '" value="' + this.sender + '">'
                            + '<input type="hidden" id="messageRVM' + this.message_id + '" value="' + this.receiver + '">'
                            + '<input type="hidden" id="messageCVM' + this.message_id + '" value="' + this.content + '">'
                            + '<input type="hidden" id="messageTVM' + this.message_id + '" value="' + this.message_time_stamp + '">'
                            + '</clickedViewMessage>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_blockM' + this.message_id + '" data-toggle="modal">'
                            + '<i class="fa clip-cancel-circle"></i> <span>Block Message</span>'
                            + '</a>'
                            + '<div id="confirm_blockM' + this.message_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Block message id : ' + this.message_id + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="blockMessages(\'' + this.message_id + '\',\'' + this.sender + '\',\'' + this.content + '\')">'
                            + 'Block'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_blockMU' + this.message_id + '" data-toggle="modal">'
                            + '<i class="fa clip-users"></i> <span>Block User</span>'
                            + '</a>'
                            + '<div id="confirm_blockMU' + this.message_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Block message User : ' + this.sender + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="blockMessaggeUser(\'' + this.message_id + '\',\'' + this.sender + '\')">'
                            + 'Block'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_removeMR' + this.message_id + '" data-toggle="modal">'
                            + '<i class="fa clip-remove"></i> Remove Report'
                            + '</a>'
                            + '<div id="confirm_removeMR' + this.message_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Remove report : ' + this.message_id + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="removeMessageReport(' + this.message_id + ')">'
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
function loadInquiryReport() {
    $.ajax({
        type: "POST",
        url: "LoadInquiryReports",
        dataType: "json",
        success: function (data) {
            var dataTable = $('table.display-inqs').dataTable();
            dataTable.fnClearTable();
            var list = data.ReportedInquiries;
            jQuery.each(list, function () {

                dataTable.fnAddData([
                    this.inquiry_id,
                    this.message_from,
                    this.inquiry_time_stamp,
                    '<div>'
                            + '<div class="btn-group">'
                            + '<a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">'
                            + '<i class="fa fa-cog"></i> <span class="caret"></span>'
                            + '</a>'
                            + '<ul role="menu" class="dropdown-menu pull-right">'
                            + '<li role="presentation">'
                            + '<clickedViewInquiry id="VI' + this.inquiry_id + '">&nbsp;&nbsp;&nbsp;&nbsp;'
                            + '<a role="menuitem" tabindex="-1" href="#view_inquiry"  data-toggle="modal">'
                            + '<i class="fa clip-bubbles-3"></i> <span>View Inquiry</span>'
                            + '<input type="hidden" id="inquiryINVI' + this.inquiry_id + '" value="' + this.item_number + '">'
                            + '<input type="hidden" id="inquiryMFVI' + this.inquiry_id + '" value="' + this.message_from + '">'
                            + '<input type="hidden" id="inquiryMTVI' + this.inquiry_id + '" value="' + this.message_to + '">'
                            + '<input type="hidden" id="inquiryIMVI' + this.inquiry_id + '" value="' + this.inquiry_message + '">'
                            + '<input type="hidden" id="inquiryITVI' + this.inquiry_id + '" value="' + this.inquiry_time_stamp + '">'
                            + '<input type="hidden" id="inquiryIRVI' + this.inquiry_id + '" value="' + this.inquiry_response + '">'
                            + '<input type="hidden" id="inquiryRTVI' + this.inquiry_id + '" value="' + this.response_time_stamp + '">'
                            + '</a>'
                            + '</clickedViewInquiry>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_blockI' + this.inquiry_id + '"  data-toggle="modal">'
                            + '<i class="fa clip-cancel-circle"></i> <span>Block Inquiry</span>'
                            + '</a>'
                            + '<div id="confirm_blockI' + this.inquiry_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Block inquiry id : ' + this.inquiry_id + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="blockInquiry(' + this.inquiry_id + ', \'' + this.message_from + '\', \'' + this.inquiry_message + '\')">'
                            + 'Block'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_blockIU' + this.inquiry_id + '"  data-toggle="modal">'
                            + '<i class="fa clip-users"></i><span>Block User</span>'
                            + '</a>'
                            + '<div id="confirm_blockIU' + this.inquiry_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Block inquiry User : ' + this.message_from + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="blockInquiryUser(\'' + this.inquiry_id + '\', \'' + this.message_from + '\')">'
                            + 'Block'
                            + '</button>'
                            + '</div>'
                            + '</div>'
                            + '</li>'
                            + '<li role="presentation">'
                            + '<a role="menuitem" tabindex="-1" href="#confirm_removeIR' + this.inquiry_id + '" data-toggle="modal">'
                            + '<i class="fa clip-remove"></i> Remove Report'
                            + '</a>'
                            + '<div id="confirm_removeIR' + this.inquiry_id + '"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">'
                            + '<div class="modal-header">'
                            + '<h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>'
                            + '</div>'
                            + '<div class="modal-body">'
                            + '<span class="badge badge-info">Remove report : ' + this.inquiry_id + '?</span>'
                            + '</div>'
                            + '<div class="modal-footer">'
                            + '<button type="button" data-dismiss="modal" class="btn btn-light-grey">'
                            + 'Cancel'
                            + '</button>'
                            + '<button type="button" class="btn btn-blue" onclick="removeInquiryReport(' + this.inquiry_id + ')">'
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
            manualNotification("<buttoan class=\"btn btn-red\"><i  class=\""
                    + "glyphicon glyphicon-remove-circle\"></i></button><br>"
                    + "<strong>Server is offline..</strong><br>\n"
                    + "Please try again in a minute\n");
        }
    });
}
function loadReportCount() {
    $.ajax({
        type: "POST",
        url: "LoadReportCountJson",
        data: {
        },
        dataType: "json",
        success: function (data) {

            $('#ad').html(data.reportCount);
            $('#msg').html(data.message_report_count);
            $('#inq').html(data.Inquiry_report_count);
        },
        error: function (jqXHR, textStatus, errorThrown) {

        }
    });
}