<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 4/27/2024
  Time: 10:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerListURL" value="/admin/customer-list"/>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<body>
    <div class="main-content">
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
                            Quản lý khách hàng
                            <small>
                                <i class="ace-icon fa fa-angle-double-right"></i>
                                overview &amp; stats
                            </small>
                        </h1>
                    </div><!-- /.page-header -->
                </div>
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
                        <div class="widget-main">
                            <form:form id="listForm" modelAttribute="modelSearchs"  action="${customerListURL}" method="GET">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-4">
                                                <label class="name">Tên khách hàng</label>
                                                <form:input class="form-control" path="fullName"/>
                                            </div>
<%--                                            <div class="col-sm-4">--%>
<%--                                                <label class="name">Di động</label>--%>
<%--                                                <form:input class="form-control" path="phone"/>--%>
<%--                                            </div>--%>
<%--                                            <div class="col-sm-4">--%>
<%--                                                <label class="name">Email</label>--%>
<%--                                                <form:input class="form-control" path="email"/>--%>
<%--                                            </div>--%>
                                        </div>
                                    </div>
<%--                                    <security:authorize access="hasRole('MANAGER')">--%>
<%--                                        <div class="form-group">--%>
<%--                                            <div class="col-xs-12">--%>
<%--                                                <div class="col-sm-4">--%>
<%--                                                    <label class="name">Chọn nhân viên</label>--%>
<%--                                                    <form:select class="form-control" path="staffId">--%>
<%--                                                        <form:option value="">---Chọn nhân viên---</form:option>--%>
<%--                                                        <form:options items="${listStaffs}"/>--%>
<%--                                                    </form:select>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </security:authorize>--%>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-sm-6">
                                                <button class="btn btn-danger" type="button" id="btnSearchCustomer">Tìm kiếm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <div class="widget-title pull-right">
                                <a href="/admin/customer-edit">
                                    <button type="button" class="btn btn-info">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-customer-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>
                                <button class="btn btn-danger" title="Xóa khách hàng" id="btnDeleteCustomer">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-customer-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin-top: 80px;">
                            <div class="col-xs-12">
                                <display:table name="customers" cellspacing="0" cellpadding="0"
                                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                               style="margin: 3em 0 1.5em;"
                                               requestURI="${customerListURL}" partialList="true" sort="external"
                                               size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                               id="tableList" pagesize="${model.maxPageItems}"
                                               export="false">
                                    <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                    headerClass="center select-cell">
                                        <fieldset>
                                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                                   id="checkbox_${tableList.id}" class="check-box-element"/>
                                        </fieldset>
                                    </display:column>
                                    <display:column headerClass="text-left" property="fullName" title="Tên khách hàng"/>
                                    <display:column headerClass="text-left" property="phone" title="Di động"/>
                                    <display:column headerClass="text-left" property="email" title="Email"/>
                                    <display:column headerClass="text-left" property="demand" title="Nhu cầu"/>
                                    <display:column headerClass="text-left" property="createdBy" title="Người thêm "/>
                                    <display:column headerClass="text-left" property="createdDate" title="Ngày thêm"/>
                                    <display:column headerClass="text-left" property="status" title="Tình trạng"/>
                                    <display:column title="Thao tác">
<%--                                        <security:authorize access="hasRole('MANAGER')">--%>
<%--                                            <button class="btn btn-xs btn-success" title="Giao khách hàng cho nhân viên quản lý" onclick="assignmentCustomer(${tableList.id})">--%>
<%--                                                <i class="ace-icon glyphicon glyphicon-align-justify"></i>--%>
<%--                                            </button>--%>
<%--                                        </security:authorize>--%>
                                        <a href="/admin/customer-edit-${tableList.id}" >
                                            <button class="btn btn-xs btn-info" >
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </button>
                                        </a>
                                        <security:authorize access="hasRole('MANAGER')">
                                            <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </button>
                                        </security:authorize>
                                    </display:column>
                                </display:table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="assignmentCustomerModal" role="dialog">
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
                    <input type="hidden" name="Customer" id="customerId" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="btnassignmentCustomer">Giao khách hàng</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>
<script>
    $('#btnSearchCustomer').click(function(e){
        e.preventDefault();
        $('#listForm').submit()
    });
    function deleteCustomer(id){
        var customerId = [id];
        deleteCustomers(customerId);
    };

    $('#btnDeleteCustomer').click(function(e){
        e.preventDefault();
        var data= {};
        data['customerId'] = $('#customerId').val();
        var customerIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteCustomers(customerIds);
    });

    function deleteCustomers(data){
        $.ajax({
            type: "DELETE",
            url: "${customerAPI}/"+data,
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (respond) {
                console.log("Success");
            },
            error : function (respond) {
                console.log("fail");
                window.location.href = "<c:url value="/admin/customer-list?message=success"/> ";
            }
        });
    }

    function assignmentCustomer(customerId){
        $('#assignmentCustomerModal').modal();
        loadStaffs(customerId);
        $('#customerId').val(customerId);
    }

    function loadStaffs(customerId){
        $.ajax({
            type: "GET",
            url: "${customerAPI}/"+ customerId+'/staffs',
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
                window.location.href = "<c:url value="/admin/customer-list?message=error"/>";
            }
        });
    }

    function assignment(data){
        $.ajax({
            type: "POST",
            url: "${customerAPI}/" + 'assignment',
            data: JSON.stringify(data),
            contentType: "application/json",
            dataType: "JSON",
            success: function (response) {
                console.info("success");
            },
            error : function (respond) {
                console.info("Giao không thành công!")
                window.location.href = "<c:url value="/admin/customer-list?message=error"/>";
            }
        });
    }

    $('#btnassignmentCustomer').click(function(e){
        var data={};
        data['customerId']=$('#customerId').val();
        var staffs=$('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs']=staffs;
        if(data['staffs']!=''){
            assignment(data);
        }
        console.log("ok");
    });




</script>
</body>
</html>
