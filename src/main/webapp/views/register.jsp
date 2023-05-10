<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let register_form = {
        init:function(){
            $('#register_btn').addClass('disabled');
            $('#register_btn').click(function(){
                register_form.send();
            });
            $('#name').keyup(function (){
                var id = $('#id').val();
                var pwd = $('#pwd').val();
                var lev = $('#lev').val();
                if(id != '' && pwd != '' && lev != ''){
                    $('#register_btn').removeClass('disabled');
                }
            });
            $('#id').keyup(function (){
                var txt_id = $(this).val();
                if (txt_id.length <= 3){
                    return;
                }
                $.ajax({
                    url:'/checkid',
                    data:{'id':txt_id},
                    success:function(result){
                        if(result == 0){
                            $('#check_id').text('사용가능합니다.');
                            $('#pwd').focus();
                        }else{
                            $('#check_id').text('사용불가능합니다.');
                        }
                    }
                });
            });

        },
        send:function(){
            var id = $('#id').val();
            var pwd = $('#pwd').val();
            var lev = $('#lev').val();
            if(id.length <=  3){
                $('#check_id').text('4자리 이상이어야 합니다.');
                $('#id').focus();
                return;
            }
            if(pwd == ''){
                $('#pwd').focus();
                return;
            }
            if(lev == ''){
                $('#lev').focus();
                return;
            } //공백일 땐 서버로 전송안된다

            $('#register_form').attr({
                'action':'/registerimpl',
                'method':'post'
            });
            $('#register_form').submit();
        }
    };

    $(function(){
        register_form.init();
    });
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Register</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Register</h6>
        </div>
        <div class="card-body">
            <div id="container">
                <div>
                    <div class="col-sm-6  text-left ">
                        <h1>Register Page</h1>
                        <form id="register_form" class="form-horizontal well">
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="id">ID:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="id" class="form-control" id="id" placeholder="Enter id">
                                </div>
                                <div class="col-sm-10">
                                    <span id="check_id" class="bg-danger"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="pwd">Password:</label>
                                <div class="col-sm-10">
                                    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="Enter password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-2" for="lev">Lev:</label>
                                <div class="col-sm-10">
                                    <input type="text" name="lev" class="form-control" id="lev" placeholder="Enter lev">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="register_btn" type="button" class="btn btn-default">Register</button>
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