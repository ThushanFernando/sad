<%-- 
    Document   : report_view_models
    Created on : Aug 12, 2015, 9:41:25 AM
    Author     : SithuDewmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div id="view_message" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Content of the message</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-14">
                        <form action="ViewReports" method="POST" role="form" class="smart-wizard form-horizontal" id="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Sender: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control"  id="senderVMId" name="senderVM" value="" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Receiver: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control"  id="receiverVMId" name="receiverVM" value="" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Content: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" id="contentVMId" name="contentVM" rows="4" readonly style="resize: none; overflow-y: auto"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Sent at: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control"  id="sentVMId" name="sentVM" value="" >
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div id="itemBA" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Message to the user</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-14">
                        <form onsubmit="return false" role="form" class="smart-wizard form-horizontal" id="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    From: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control"  name="fromname" value="Superb.lk" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    To: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control" id="toidBA"  placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Subject: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" id="subjectidBA"  rows="2" readonly style="resize: none; overflow-y: auto;"></textarea>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Reason for Ad block: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="hidden form-control"  id="contentidBA-header"></textarea>
                                    <textarea class="autosize form-control" id="contentidBA-body" rows="8" style="overflow-y: auto; resize: none; word-wrap: break-word;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-7">
                                    <input type="hidden" id="itemidBA"  value="">
                                    <input type="hidden" id="reportidBA"  value="">
                                    <input type="hidden" id="reasonidBA"  value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-6">
                                    <button class="btn btn-blue next-step btn-block" onclick="blockAd()">
                                        Send <i class="fa fa-arrow-circle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>    
                    </div>

                </div>
            </div>

        </div>

        <div id="view_report" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Content of the report</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-14">
                        <form action="#" role="form" class="smart-wizard form-horizontal" id="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Reporter: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="itemreporter"  placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Ad title: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="itemtitle" placeholder=""><span class="badge badge-info"><span id='itemstatus'></span></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Reason: 
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="autosize form-control" readonly="true" id="itemreason" style="overflow-y: auto; word-wrap: break-word; resize: none; height: 69px;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Message: 
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="autosize form-control" readonly="true" id="itemreportmessage" style="overflow-y: auto; word-wrap: break-word; resize: none; height: 69px;"></textarea>
                                </div>
                            </div>

                        </form>    
                    </div>

                </div>
            </div>

        </div>




        <div id="view_inquiry" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Content of the Inquiry</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-14">
                        <form action="#" role="form" class="smart-wizard form-horizontal" id="">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Item number: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="inquiryItem"  placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Inquiry From: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="inquiryFrom" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Inquiry To: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="inquiryTo" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Inquiry Message: 
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="autosize form-control" readonly="true" rows="3" id="inquiryMessage" style="overflow-y: auto; word-wrap: break-word; resize: none;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Inquiry Time: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="inquiryTime" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Inquiry Response: 
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="autosize form-control" readonly="true" rows="3" id="inquiryResponse" style="overflow-y: auto; word-wrap: break-word; resize: none;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Response Time: 
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" class="form-control" readonly="true" id="responseTime" placeholder="">
                                </div>
                            </div>

                        </form>    
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
