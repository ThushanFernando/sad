$(document).on('click', 'clickedReportModifyAd', function () {
    if (document.getElementById('itemR' + this.id).value === "") {
        manualNotification("<button class=\"btn btn-red\">"             //returning notification of the failure 
                + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                + "</i></button><br><strong> Please enter the reason for modification !</strong>");
    } else {
        document.getElementById("toid").value = document.getElementById('MIU' + this.id).value;
        document.getElementById("subjectid").value = 'Your ad "' + document.getElementById('MIT' + this.id).value + '" needs to be edited';
        document.getElementById("content-header").value = 'Your ad "' + document.getElementById('MIT' + this.id).value + ' ", posted on Superb.lk, does not follow our rules. You must make some changes to the ad before we can publish it. The reason why we could not approve your ad:';
        document.getElementById("content-body").innerHTML = '- Illegal item or service:- \nYour ad features an item or service that is illegal, which we cannot allow on our site. Please change the item or service that you are offering in your ad.';
        document.getElementById("itemid").value = document.getElementById('MIN' + this.id).value;
        document.getElementById("reasonid").value = document.getElementById('itemR' + this.id).value;
        document.getElementById('itemR' + this.id).value = "";
        $('#Modify'+document.getElementById('MIN' + this.id).value).modal('hide');
        $('#message').modal('show');
    }

});