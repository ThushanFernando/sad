<%-- 
    Document   : ads_review_modals
    Created on : Aug 15, 2015, 11:14:31 AM
    Author     : SithuDewmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div id="message" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" name="optionsRadios12">Message to the user</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-14">
                        <form  role="form" class="smart-wizard form-horizontal" id="form" onsubmit="return modify()">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    From: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control" id="fromid" name="fromname" value="Superb.lk" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    To: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <input type="text" readonly class="form-control" id="toid"  placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Subject: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="form-control" id="subjectid" rows="2" readonly style="resize: none"></textarea>

                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">
                                    Reason & solution: <span class="symbol required"></span>
                                </label>
                                <div class="col-sm-7">
                                    <textarea class="hidden form-control"  id="content-header" rows="8" readonly ></textarea>
                                    <textarea class="autosize form-control"  id="content-body" rows="7" style="resize: none; overflow-y: auto; word-wrap: break-word;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-7">
                                    <input type="hidden" id="itemid" value="">
                                    <input type="hidden" id="reasonid" value="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-6">
                                    <button class="btn btn-blue next-step btn-block">
                                        Send <i class="fa fa-arrow-circle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>  
                        
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
