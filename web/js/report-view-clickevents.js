$(document).on('click', 'clickedReport', function () {

    document.getElementById("itemreporter").value = document.getElementById('itemRE' + this.id).value;
    document.getElementById("itemtitle").value = document.getElementById('itemT' + this.id).value;
    document.getElementById("itemstatus").innerHTML = 'State: ' + document.getElementById('itemS' + this.id).value;
    document.getElementById("itemreason").value = document.getElementById('itemR' + this.id).value;
    document.getElementById("itemreportmessage").value = document.getElementById('itemM' + this.id).value;
});

$(document).on('click', 'clickedReportBlockAd', function () {
    if (document.getElementById('itemR' + this.id).value === "") {
        manualNotification("<button class=\"btn btn-red\">"             //returning notification of the failure 
                + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                + "</i></button><br><strong> Please enter the reason for blocking ad !</strong>");
    } else {
        document.getElementById("subjectidBA").value = 'Temporarily disabeling your ad \"' + document.getElementById('itemT' + this.id).value + '\"';
        document.getElementById("contentidBA-header").value = 'Your ad "' + document.getElementById('itemT' + this.id).value  + ' ", posted on Superb.lk, does not follow our rules. You must make some changes to the ad before we can re-publish it.\n\nThe reason why we did disable your ad:\n\n';
        document.getElementById("contentidBA-body").value = '- Illegal item or service:- \nYour ad features an item or service that is illegal, which we cannot allow on our site. Please change the item or service that you are offering in your ad.';
        document.getElementById("itemidBA").value = document.getElementById('itemIN' + this.id).value;
        document.getElementById("reportidBA").value = document.getElementById('itemRI' + this.id).value;
        document.getElementById("reasonidBA").value = document.getElementById('itemR' + this.id).value;
        document.getElementById("toidBA").value = document.getElementById('itemU' + this.id).value;
        document.getElementById('itemR' + this.id).value = '';
        $('#blockA' + document.getElementById('itemRI' + this.id).value).modal('hide');
        $('#itemBA').modal('show');
    }

});

$(document).on('click', 'clickedViewMessage', function () {
    document.getElementById("senderVMId").value = document.getElementById('messageS' + this.id).value;
    document.getElementById("receiverVMId").value = document.getElementById('messageR' + this.id).value;
    document.getElementById("contentVMId").value = document.getElementById('messageC' + this.id).value;
    document.getElementById("sentVMId").value = document.getElementById('messageT' + this.id).value;


});


$(document).on('click', 'clickedViewInquiry', function () {
    document.getElementById("inquiryItem").value = document.getElementById('inquiryIN' + this.id).value;
    document.getElementById("inquiryFrom").value = document.getElementById('inquiryMF' + this.id).value;
    document.getElementById("inquiryTo").value = document.getElementById('inquiryMT' + this.id).value;
    document.getElementById("inquiryMessage").value = document.getElementById('inquiryIM' + this.id).value;
    document.getElementById("inquiryTime").value = document.getElementById('inquiryIT' + this.id).value;
    document.getElementById("inquiryResponse").value = document.getElementById('inquiryIR' + this.id).value;
    document.getElementById("responseTime").value = document.getElementById('inquiryRT' + this.id).value;


});
