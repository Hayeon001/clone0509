<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .medium_img{
        width:80px;
    }
    .large_img{
        width: 300px;
    }
</style>

<script>
    let marker_search = {
        init: function (){
            $('#search_btn').click(function (){
                $('#search_form').attr({
                    method:'get',
                    action:'/marker/search'
                });
                $('#search_form').submit();
            });
        }
    };
    $(function (){
    marker_search.init();
    })
</script>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Marker ALL</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Marker ALL</h6>

            <form id="search_form" class="form-inline well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="loc">Location</label>&nbsp;&nbsp;
                    <div class="col-sm-2">
                        <select class="form-control" name="loc" id="loc">
                            <option value="">(瘤开)</option>
                            <option value="s" <c:if test="${ms.loc=='s'}">selected</c:if> >辑匡</option>
                            <option value="b" <c:if test="${ms.loc=='b'}">selected</c:if> >何魂</option>
                            <option value="j" <c:if test="${ms.loc=='j'}">selected</c:if> >力林</option>
                        </select>
                    </div>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="form-group">
                    <label class="control-label col-sm-2" for="title">Title</label>
                    <div class="col-sm-10">
                        <input type="text" name="title" class="form-control" id="title" placeholder="Enter title" value="${ms.title}">
                    </div>
                </div>
                &nbsp;&nbsp;
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-6">
                        <button id="search_btn" type="button" class="btn btn-info">Search</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGER</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>IMG</th>
                        <th>LOC</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>TITLE</th>
                        <th>TARGER</th>
                        <th>LAT</th>
                        <th>LNG</th>
                        <th>IMG</th>
                        <th>LOC</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${mlist}">

                        <tr>
                            <td><a href="/marker/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.title}</td>
                            <td>${obj.target}</td>
                            <td>${obj.lat}</td>
                            <td>${obj.lng}</td>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                    <img id="item_img" src="/uimg/${obj.img}">
                                </a>
                            </td>
                            <td>${obj.loc}</td>
                        </tr>

                        <!-- Modal -->
                        <div class="modal fade" id="target${obj.id}" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">Detail Image</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${obj.title}</p>
                                        <img src="/uimg/${obj.img}" class="large_img" >
                                    </div>

                                    <div class="modal-footer">
                                        <a href="/item/detail?id=${obj.id}" class="btn btn-info" role="button">Detail</a>
                                        <a href="#" class="btn btn-info" data-dismiss="modal" role="button">Close</a>
                                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                                    </div>
                                </div>
                            </div>
                        </div> <!-- Modal end-->

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

