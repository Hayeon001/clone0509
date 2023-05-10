<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let adminfo_form = {
        init:function(){
            $('#adminfo_btn').click(function(){
                adminfo_form.send();
            });

        },
        send:function(){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var name = $('#name').val();
            if(id.length <=  3){
                $('#check_id').text('4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(name == ''){
                $('#name').focus();
                return;
            } //공백일 땐 서버로 전송안된다

            $('#adminfo_form').attr({
                'action':'/adminfoimpl',
                'method':'post'
            });
            $('#adminfo_form').submit();
        }
    };

    $(function(){
        adminfo_form.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Adminfo Page</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Adminfo Page</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <div class="row content">
                    <div class="col-sm-6  text-left ">
                        <h1>Adminfo Page</h1>
                        <form id="adminfo_form" class="form-horizontal well">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" value="${adminfo.id}" readonly>
                                </div>
                                <div class="col-sm-10">
                                    <span id="check_id" class="bg-danger"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" name="pwd" class="form-control" id="pwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lev">LEVEL:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="lev" class="form-control" id="lev" value="${adminfo.lev}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="adminfo_btn" type="button" class="btn btn-default">Register</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>