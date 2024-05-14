<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/28/2024
  Time: 9:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>

<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content" >
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Danh sách tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->
                <div class="widget-box ui-sortable-handle collapsed">
                    <div class="widget-header">
                        <h5 class="widget-title">Tìm kiếm</h5>
                        <div class="widget-toolbar">
                            <a href="#" data-action="collapse">
                                <i class="ace-icon fa fa-chevron-down"></i>
                            </a>
                        </div>
                    </div>

                    <div class="widget-body" style="display: block;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;" >
                        <div class="widget-main" >
                            <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">
                                <!-- danh sach tim kiem -->
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <label class="name">Tên tòa nhà</label>
                                                <form:input class="form-control" path="name"/>
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="name">Diện tích sàn</label>
                                                <form:input class="form-control" path="floorArea"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-2">
                                                <label class="name">Quận</label>
                                                <form:select path="district" class="form-control" >
                                                    <form:option value="">---Chọn quận---</form:option>
                                                    <form:options items="${districts}"/>
                                                </form:select>
                                            </div>
                                            <div class="col-sm-5">
                                                <label class="name">Phường</label>
                                                <form:input class="form-control" path="ward"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <label class="name">Đường</label>
                                                <form:input class="form-control" path="street"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <label class="name">Số tầng hầm</label>
                                                <form:input class="form-control" path="numberOfBasement"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="name">Hướng</label>
                                                <form:input class="form-control" path="direction"/>
                                            </div>
                                            <div class="col-sm-4">
                                                <label class="name">Hạng</label>
                                                <form:input class="form-control" path="level"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-3">
                                                <label class="name">Diện tích từ</label>
                                                <form:input class="form-control" path="areaFrom"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="name">Diện tích đến</label>
                                                <form:input class="form-control" path="areaTo"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="name">Giá thuê từ</label>
                                                <form:input class="form-control" path="rentPriceFrom"/>
                                            </div>
                                            <div class="col-sm-3">
                                                <label class="name">Giá thuê đến</label>
                                                <form:input class="form-control" path="rentPriceTo"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-5">
                                                <label class="name">Tên quản lý</label>
                                                <form:input class="form-control" path="managerName"/>
                                            </div>
                                            <div class="col-sm-5">
                                                <label class="name">Số điện thoại quản lý</label>
                                                <form:input class="form-control" path="managerPhone"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <security:authorize access="hasRole('MANAGER')">
                                                    <label class="name">Nhân viên</label>
                                                    <form:select path="staffId" class="form-control">
                                                        <form:option value="">---Chọn nhân viên---</form:option>
                                                        <form:options items="${listStaffs}"/>
                                                    </form:select>
                                                </security:authorize>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <form:checkboxes  items="${typeCodes}" path="typeCode"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <button class="btn btn-danger" type="button" id="btnSearchBuilding">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div> <!-- /danh sach tim kiem -->
                            </form:form>

                        </div>
                    </div>

                    <div class="widget-title pull-right">
                        <a href="/admin/building-edit">
                            <button type="button" class="btn btn-info">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                    <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                    <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                    <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                </svg>
                            </button>
                        </a>
                        <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <!-- Danh sách kết quả -->
                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin-top: 80px;">
                    <div class="col-xs-12">
                    <display:table name="buildings" cellspacing="0" cellpadding="0"
                        requestURI="${buildingListURL}" partialList="true" sort="external"
                        size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                        id="tableList" pagesize="${model.maxPageItems}"
                        export="false"
                        class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                        style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                        headerClass="center select-cell">
                        <fieldset>
                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                   id="checkbox_${tableList.id}" class="check-box-element"/>
                        </fieldset>
                        </display:column>
                        <display:column headerClass="text-left" property="name" title="Tên tòa nhà"/>
                        <display:column headerClass="text-left" property="address" title="Tên tòa nhà"/>
                        <display:column headerClass="text-left" property="numberOfBasement" title="Số tầng hầm"/>
                        <display:column headerClass="text-left" property="managerName" title="Tên quản lí"/>
                        <display:column headerClass="text-left" property="managerPhone" title="Số điện thoại"/>
                        <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                        <display:column headerClass="text-left" property="emptyArea" title="Diện tích trống"/>
                        <display:column headerClass="text-left" property="rentArea" title="Diện tích thuê"/>
                        <display:column headerClass="text-left" property="brokerageFee" title="Phí môi giới"/>
                        <display:column title="Thao tác">
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${tableList.id})">
                                    <i class="ace-icon glyphicon glyphicon-align-justify"></i>
                                </button>
                            </security:authorize>
                            <a href="/admin/building-edit-${tableList.id}" >
                                <button class="btn btn-xs btn-info" >
                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                </button>
                            </a>
                            <security:authorize access="hasRole('MANAGER')">
                                <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                </button>
                            </security:authorize>
                        </display:column>
                    </display:table>




                    </div><!-- /.span -->
                </div>

            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->



    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<div class="modal fade" id="assignmentBuildingModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
            </div>
            <div class="modal-body">
                <table id="staffList" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">Chọn</th>
                        <th class="center">Tên nhân viên</th>
                    </tr>
                    </thead>

                    <tbody>
                    </tbody>
                </table>
                <input type="hidden" name="Building" id="buildingId" value="">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>


    <script>
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
        loadStaffs(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaffs(buildingId){
        $.ajax({
            type: "GET",
            url: "${buildingAPI}/"+ buildingId+'/staffs',
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                var row='';
                $.each(response.data, function (index,item){
                    row += '<tr>';
                    row += '<td class ="text-center" ><input type="checkbox" value='+ item.staffId + ' id="checkbox_'+item.staffId+ '" class = "check-box-element"' + item.checked+'></td>';
                    row += '<td class ="text-center">'+item.fullName+'</td>';
                    row += '</tr>';
                });
                $('#staffList tbody').html(row);
                console.info("success");

            },
            error : function (response) {
                console.log("fail");
                window.location.href = "<c:url value="/admin/building-list?message=error"/>";
            }
        });
    }

    function assignment(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("success");
            },
            error : function (respond) {
                console.info("Giao không thành công!")
                window.location.href = "<c:url value="/admin/building-list?message=error"/>";
            }
        });
    }

    $('#btnassignmentBuilding').click(function(e){
        var data={};
        data['buildingId']=$('#buildingId').val();
        var staffs=$('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs']=staffs;
        if(data['staffs']!=''){
            assignment(data);
        }
        console.log("ok");
    });

    $('#btnSearchBuilding').click(function(e){
        e.preventDefault();
        $('#listForm').submit()
    });

    function deleteBuilding(id){
        var buildingId = [id];
        deleteBuildings(buildingId);
    };

    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var data= {};
        data['buildingId'] = $('#buildingId').val();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteBuildings(buildingIds);
    });

    function deleteBuildings(data){
        $.ajax({
            type: "DELETE",
            url: "${buildingAPI}/"+data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error : function (respond) {
                console.log("fail");
                window.location.href = "<c:url value="/admin/building-list?message=success"/> ";
            }
        });
    }
    </script>

</body>
</html>
