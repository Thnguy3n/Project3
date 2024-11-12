<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form"%>
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
    <title>Chỉnh sửa tòa nhà</title>
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
                    Sửa đổi hoặc thêm Bất động sản

                </h1>
            </div><!-- /.page-header -->
            <form:form modelAttribute="buildingEdit" id="listForm" method="GET" var="item">
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
                                    <form:input class="form-control" path="rentPriceDescription"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí dịch vụ</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="serviceFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí ô tô</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="carFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí mô tô</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="motorbikeFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Phí ngoài giờ</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="overtimeFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Tiền điện</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="electricityFee"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Đặt cọc</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="deposit"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thanh toán</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="payment"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thời hạn thuê</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="rentTime"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Thời gian trang trí</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="decorationTime"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Tên quản lý</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">SĐT quản lý</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="managerPhone"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-3">Map</div>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="map"/>
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
                                    <form:textarea rows="12" class="form-control" path="note"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                <div class="col-sm-9">
                                    <c:if test="${not empty buildingEdit.image}">
                                        <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
                                        <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                    </c:if>
                                    <c:if test="${empty buildingEdit.image}">
                                        <img src="/admin/image/defaul.jpg" id="viewImage" width="300px" height="300px">
                                    </c:if>
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
    var imageBase64 = '';
    var imageName = '';
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode =[];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i, v){
            if(v.name != 'typeCode'){
                data[""+ v.name +""] = v.value;
            }
            else{
                typeCode.push(v.value);
            }
        });
        $.each(formData, function (i, e) {
            if ('' !== e.value && null != e.value) {
                data['' + e.name + ''] = e.value;
            }

            if ('' !== imageBase64) {
                data['imageBase64'] = imageBase64;
                data['imageName'] = imageName;
            }
        });
        var buildingId = data['id'];
        data['typeCode'] = typeCode;

        if(typeCode != ''){
            addOrupdate(data);
            window.location.href = "<c:url value="/admin/building-list?message=success"/>";
        }
        else{
            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>";
        }
        $('#loading_image').show();
    });
    function addOrupdate(data){
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("success!");

            },
            error : function (respond) {
                console.info("Fail!")
                console.log(respond);
            }
        });
    }

    $('#bntCancel').click(function (){
        window.location.href="/admin/building-list";
    });

    $('#uploadImage').change(function (event) {
        var reader = new FileReader();
        var file = $(this)[0].files[0];
        reader.onload = function(e){
            imageBase64 = e.target.result;
            imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
        };
        reader.readAsDataURL(file);
        openImage(this, "viewImage");
    });

    function openImage(input, imageView) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#' +imageView).attr('src', reader.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>


</body>
</html>
