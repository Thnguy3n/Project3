<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 4/28/2024
  Time: 5:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>
<html>
<head>
    <title>Chỉnh sửa thông tin khách hàng</title>
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
                        Sửa đổi hoặc thêm khách hàng
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div>

                <form:form modelAttribute="customerEdit" id="listForm" method="GET" >
                    <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                        <div class="col-xs-12">
                            <form action="" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <div class="col-xs-3">Tên khách hàng</div>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="fullName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-3">Số điện thoại</div>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="phone"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-3">Email</div>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="email"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-3">Tên công ty</div>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="companyName"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-3">Nhu cầu</div>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="demand"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-3">Tình trạng</div>
                                    <div class="col-xs-9">
                                        <form:select path="status" class="form-control" >
                                            <form:option value="">---Chọn tình trạng---</form:option>
                                            <form:options items="${statusType}"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-xs-3"></label>
                                    <div class="col-xs-9">
                                        <c:if test="${not empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Cập nhật khách hàng</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty customerEdit.id}">
                                            <button type="button" class="btn btn-primary" id="btnAddOrUpdateCustomer">Thêm mới khách hàng</button>
                                            <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                                <form:hidden path="id" id="customerId"/>
                            </form>
                        </div>
                    </div>
                </form:form>
            </div>

            <c:forEach var="item" items="${transactionType}">
                <div class="col-xs-12">
                    <div class="col-sm-12">
                        <h3 class="header smaller lighter blue">${item.value}</h3>
                        <button class="btn btn-lg btn-primary" style="margin: 12px" onclick="transactionType('${item.key}',${customerEdit.id})">
                            <i class="orange ace-icon fa fa-location-arrow bigger-130">Add</i>
                        </button>
                        <c:if test="${item.key == 'CSKH'}">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Ngày tạo</th>
                                        <th>Người tạo</th>
                                        <th>Ngày sửa</th>
                                        <th>Người sửa</th>
                                        <th>Chi tiết giao dich</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="items" items="${ListType1}">
                                        <tr>
                                            <td>${items.createdDate}</td>
                                            <td>${items.createdBy}</td>
                                            <td>${items.modifiedDate}</td>
                                            <td>${items.modifiedBy}</td>
                                            <td>${items.note}</td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-info" data-toggle="tooltip" title="sửa thông tin giao dịch"
                                                            onclick="UpdateTransaction(${items.id},'${items.note}','${items.code}','${items.createdBy}','${items.createdDate}','${items.modifiedDate}','${items.modifiedBy}')">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>

                        <c:if test="${item.key == 'DDX'}">
                            <div class="col-xs-12">
                                <table id="simple-table" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>Ngày tạo</th>
                                        <th>Người tạo</th>
                                        <th>Ngày sửa</th>
                                        <th>Người sửa</th>
                                        <th>Chi tiết giao dich</th>
                                        <th>Thao tác</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach var="items" items="${ListType2}">
                                        <tr>
                                            <td>${items.createdDate}</td>
                                            <td>${items.createdBy}</td>
                                            <td>${items.modifiedDate}</td>
                                            <td>${items.modifiedBy}</td>
                                            <td>${items.note}</td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-info" data-toggle="tooltip" title="sửa thông tin giao dịch"
                                                            onclick="UpdateTransaction(${items.id},'${items.note}','${items.code}','${items.createdBy}','${items.createdDate}','${items.modifiedDate}','${items.modifiedBy}')">
                                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>

                            </div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <div class="modal fade" id="transactionTypeModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
<%--                    <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                    <h4 class="modal-title">Nhập giao dịch</h4>
                </div>
                <div class="modal-body">
                   <div class="form-group has-success">
                       <label for="note" class="col-xs-12 col-sm-3 control-label no-padding-right">
                           Chi tiết giao dịch
                       </label>
                       <div class="col-xs-12 col-sm-9">
                           <span class="block input-icon input-icon-right">
                               <input type="text" id="note" class="width-100">
                           </span>
                       </div>
                       <input type="hidden" name="customerId" id="customerId" value="">
                       <input type="hidden" name="code" id="code" value="">
                       <input type="hidden" name="id" id="id" value="">
                       <input type="hidden" name="createdBy" id="createdBy" value="">
                       <input type="hidden" name="createdDate" id="createdDate" value="">
                   </div>
                </div>
                <div class="modal-footer">
                        <button type="button" class="btn btn-default" id="btnAddOrUpdateTransaction">Thêm giao dịch</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function transactionType(code, customerId) {
            $('#transactionTypeModal').modal();
            $('#customerId').val(customerId);
            $('#code').val(code);
        }

        function UpdateTransaction(id,note,code,createdBy,createdDate){
            $('#transactionTypeModal').modal();
            $('#id').val(id);
            $('#code').val(code);
            $('#note').val(note);
            $('#createdBy').val(createdBy);
            $('#createdDate').val(createdDate);

        }

        $('#btnAddOrUpdateTransaction').click(function (e){
            e.preventDefault();
            var data={};
            data['id']=$('#id').val();
            data['customerId']=$('#customerId').val();
            data['code']=$('#code').val();
            data['note']=$('#note').val();
            if (data.note!=''){
                addOrUpdateTransaction(data);
                window.alert("Add Transaction Successful")
                location.reload();
            }
            function addOrUpdateTransaction(data){
                $.ajax({
                    type:"POST",
                    url:"${customerAPI}/transaction",
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
            }

        });



        $('#btnAddOrUpdateCustomer').click(function(){
            var data = {};
            data['isActive']=1;
            var formData=$('#listForm').serializeArray();

            $.each(formData,function(i,v){
                data[""+v.name+""]=v.value;
            })
            addOrUpdate(data);
            function addOrUpdate(data){
                $.ajax({
                    type:"POST",
                    url:"${customerAPI}",
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
                window.location.href = "/admin/customer-list";
            });
        })
    </script>
</body>
</html>
