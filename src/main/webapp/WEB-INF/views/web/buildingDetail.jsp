<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 5/18/2024
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title></title>
</head>
<body>
<section class="py-5">
    <c:forEach items="BuildingDTO" var="item"></c:forEach>
    <div class="container">
        <div class="row ">
            <div class="col-xs-12" style="display: flex;margin-bottom: 40px">
                <div class="col-sm-6">
                    <div class="  justify-content-left">
                        <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image">
                            <img style="max-width: 100%; max-height: 50vh; margin: auto;" class="rounded-4 fit"
                                 src="/repository${BuildingDTO.image}"/>
                        </a>
                    </div>
                </div>
                <div class="col-sm-6">
                    <h1 class="title text-dark font-weight-bolder tab-size-bigger">
                        ${BuildingDTO.name}
                    </h1>
                    <div class="mb-3">
                        <span class="h5">${BuildingDTO.rentPriceDescription}</span>
                    </div>
                    <div class="mb-3">
                        <span class="h5">Địa chỉ: ${BuildingDTO.street},${BuildingDTO.ward},${BuildingDTO.district}</span>
                    </div>
                    <div class="mb-3">
                        <span class="h5">Quản lý: ${BuildingDTO.managerName} - ${BuildingDTO.managerPhone}</span>
                    </div>
                    <div class="mb-3">
                        <span class="h5">Diện tích sàn: ${BuildingDTO.floorArea} m2</span>
                    </div>
                    <div class="mb-3">
                        <span class="h5">Hướng: ${BuildingDTO.direction} - Số tầng: ${BuildingDTO.numberOfBasement}</span>
                    </div>
                    <div class="mb-3">
                        <button type="button" class="btn btn-primary px-4 mt-3" id="">
                            Đặt lịch đi xem nhà
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-xs-12">
                <div class="ps-lg-3">
                    <pre style="font-family: sans-serif;font-size: 18px;">${BuildingDTO.note}</pre>
                    <div class="row">
                        <dt class="col-5">Loại tòa nhà: ${BuildingDTO.typeCode}</dt>
                    </div>
                    <hr/>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="google-map margin-bottom-30">
                    <div class="maps_iframe">
                        <iframe style="width: 100%;"
                                src="${BuildingDTO.map}"
                                width="600" height="450" style="border:0;" allowfullscreen=""
                                loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </div>
        <div class="box-lienhe mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <h2 class="title-lienhe"><strong>Công ty cổ phần bất động sản SkyLand</strong></h2>
                        <div class="desc-lienhe">
                            <p>Được thành lập vào ngày 28/08/2004 với niềm đam mê và khát vọng thành công trong lĩnh vực
                                bất động sản. Nhờ chiến lược rõ ràng và hướng đi đúng, SkyLand đã nhanh chóng phát triển
                                và đạt được những thành công nhất định.</p>
                            <ul class="margin-bottom-15 link" style="list-style-type: none;">
                                <li>
                                    <span class="block_fonticon"><i class="fa fa-map-marker icon-lienhe"></i></span>
                                    <span class="title-li"> 51 Giải Phóng, Quận Tân Bình, TP. HCM</span>
                                </li>
                                <li>
                                    <span class="block_fonticon"><i class="fa fa-mobile icon-lienhe"></i></span>
                                    <span class="title-li">
                                        Hotline: <a style="color: #434a6e;" class="fone" href="">0905244079</a>

                                    </span>
                                </li>
                                <li>
                                    <span class="block_fonticon"><i class="fa fa-envelope icon-lienhe"></i></span>
                                    <span class="title-li">Email: <a style="color: #434a6e;"
                                                                     href="">hoangthenguyen@gmail.com</a></span>
                                </li>
                            </ul>
                        </div>
                    </div>
<%--                    <div class="col-12 col-md-6">--%>
<%--                        <h2 class="title-lienhe"><strong>Liên hệ với chúng tôi</strong></h2>--%>
<%--                        <div class="row">--%>
<%--                            <div class="col">--%>
<%--                                <input class="form-control mt-3" type="text" name="" id="fullName"--%>
<%--                                       placeholder="Họ và tên"></div>--%>
<%--                            <div class="col">--%>
<%--                                <input class="form-control mt-3" type="text" name="" id="email" placeholder="Email">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <input class="form-control mt-3" type="text" name="" id="phone" placeholder="Số điện thoại">--%>
<%--                        <input type="text" class="form-control mt-3" placeholder="Nội dung">--%>
<%--                        <button type="button" class="btn btn-primary px-4 mt-3" id="btnAddOrUpdateCustomerss">--%>
<%--                            Gửi liên hệ--%>
<%--                        </button>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="application/javascript">
        $('#btnAddOrUpdateCustomerss').click(function () {
            var data = {};
            data['fullName'] = $('#fullName').val();
            data['phone'] = $('#phone').val();
            data['email'] = $('#email').val();
            data['isActive'] = 1;
            addOrUpdate(data);

            function addOrUpdate(data) {
                $.ajax({
                    type: "POST",
                    url: "${customerAPI}",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "JSON",
                    success: function (respond) {
                        console.log("success");
                    },
                    error: function (respond) {
                        console.log("fail");
                        console.log(respond);
                    }
                });
            };
        })
    </script>

</section>
</body>
</html>