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
        <div id="confirm_unblock"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">
            <div class="modal-header">
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>
            </div>
            <div class="modal-body">
                <span id="email_unblock_spanid"></span>
                <form>
                    <input type="hidden" id="email_unblockid"  value="">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                    Cancel
                </button>
                <button type="button" class="btn btn-blue" onclick="formUnblockingProcess(document.getElementById('email_unblockid').value)">
                    Unblock
                </button>
            </div>
        </div>

        <div id="confirm_block"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">
            <div class="modal-header">
                <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>
            </div>
            <div class="modal-body">
                <span id="email_block_spanid"></span>
                <form >
                    <input type="hidden" id="email_blockid"  value="">
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                    Cancel
                </button>
                <button type="button" class="btn btn-blue" onclick="formBlockingProcess(document.getElementById('email_blockid').value)">
                    Block
                </button>
            </div>
        </div>
        
    </body>

</html>
