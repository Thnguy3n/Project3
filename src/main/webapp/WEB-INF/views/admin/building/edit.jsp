<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 2/28/2024
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Tên tòa nhà</title>
</head>
<body>
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

            <div class="page-header" >
                <h1 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                    Sửa đổi hoặc thêm tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <form:form modelAttribute="buildingEdit" id="listForm" method="GET" >
                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                    <div class="col-xs-12">
                        <form action="" class="form-horizontal" role="form" >
                            <div class="form-group">
                                <div class="col-xs-3">Tên tòa nhà</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-3">Quận</div>
                                <div class="col-xs-9">
                                    <form:select path="district" class="form-control" >
                                        <form:option value="">---Chọn quận---</form:option>
                                        <form:options items="${districts}"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-3">Phường</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="ward"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Đường</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="street"/>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Kết cấu</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="structure" id="structure">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Số tầng hầm</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="numberOfBasement"/>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Diện tích sàn</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="floorArea"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-3">Hướng </div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="direction"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Hạng</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="level"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Diện tích thuê</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentArea"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Giá thuê</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentPrice"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Mô tả giá</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="rentpricedescription" id="rentpricedescription">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí dịch vụ</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" name="servicefee" id="servicefee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí ô tô</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" name="carfee" id="carfee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí mô tô</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" name="motorbikefee" id="motorbikefee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí ngoài giờ</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" name="overtimefee" id="overtimefee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Tiền điện</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" name="electricityfee" id="electricityfee">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Đặt cọc</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="deposit" id="deposit">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thanh toán</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="payment" id="payment">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thời hạn thuê</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="renttime" id="renttime">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thời gian trang trí</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="decorationtime" id="decorationtime">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Tên quản lý</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="managername" id="managername">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">SĐT quản lý</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="managerphonenumber" id="managerphonenumber">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí mô giới</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="" id="">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Loại tòa nhà</div>
                                <div class="col-xs-9">
                                    <form:checkboxes  items="${typeCodes}" path="typeCode"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Ghi chú</div>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" name="" id="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm mới tòa nhà</button>
                                        <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>
                            <form:hidden path="id" id="buildingId"/>
                        </form>

                    </div>
                </div>

            </form:form>
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode= [];
        var formData = $('#listForm').serializeArray();
        $.each(formData,function(i,v){
            if(v.name!='typeCode')
                data[""+v.name+""]=v.value;
            else
                typeCode.push(v.value);
        })
        data['typeCode']=typeCode;
        if(typeCode !=''){
            addOrUpdateBuilding(data);
        }
        else{
            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>";
        }
        function addOrUpdateBuilding(data){
            $.ajax({
                type:"POST",
                url:"${buildingAPI}",
                data:JSON.stringify(data),
                contentType:"application/json",
                dataType:"JSON",
                success:function(respond){
                    console.log("success");
                },
                error:function(respond){
                    console.log("fail");
                    console.log(respond);
                }
            });
        };

        $('#btnCancel').click(function () {
            window.location.href = "/admin/building-list";
        });
    })
</script>

</body>
</html>
