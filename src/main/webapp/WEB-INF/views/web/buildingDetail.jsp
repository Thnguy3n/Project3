<%--
  Created by IntelliJ IDEA.
  User: HP Victus
  Date: 5/18/2024
  Time: 9:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="customerAPI" value="/api/customer"/>

<html>
<head>
    <title></title>
</head>
<body>
<section class="py-5">
    <c:forEach items="BuildingDTO" var="item"></c:forEach>
    <div class="container">
        <div class="row gx-5">
            <div class="form-group">
             <div class="col-xs-12">
                <div class="col-sm-9">
                     <div class="  justify-content-left">
                        <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image"   >
                          <img style="max-width: 100%; max-height: 50vh; margin: auto;" class="rounded-4 fit" src="/repository${BuildingDTO.image}" />
                        </a>
                     </div>
                </div>
                <div class="col-sm-3">
                    <h1 class="title text-dark font-weight-bolder tab-size-bigger">
                        ${BuildingDTO.name}
                    </h1>
                    <div class="mb-3">
                        <span class="h5">${BuildingDTO.rentPriceDescription}</span>
                    </div>
                </div>
            </div>
            </div>

            <main class="col-xs-12">
                <div class="ps-lg-3">
                    <pre style="font-family: sans-serif;font-size: 18px;">${BuildingDTO.note}</pre>
                    <div class="row">
                        <dt class="col-3">Type: ${BuildingDTO.typeCode}</dt>
                        <dd class="col-9">Regular</dd>
                    </div>
                    <hr />
                    </div>
            </main>
        </div>
         <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="google-map margin-bottom-30">
                        <div class="maps_iframe">
                            <iframe style="width: 100%;"
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.577731862711!2d106.7695372142139!3d10.850261760047032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f8d0e993b05%3A0x8abf4c480f8b822b!2zOTcgTWFuIFRoacOqbiwgUGjDuiBIaeG7h3AgSMaw4budYywgbmjhuq10IHPDumMgVHJ1w6JuIFbEg25nLCBWaeG7h3QgTmFt!5e0!3m2!1sen!2s!4v1652520257601!5m2!1sen!2s"
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
                <div class="col-12 col-md-6" >
                    <h2 class="title-lienhe"><strong>Liên hệ với chúng tôi</strong></h2>
                        <div class="row">
                            <div class="col">
                                <input class="form-control mt-3" type="text" name="" id="fullName"  placeholder="Họ và tên">                            </div>
                            <div class="col">
                                <input class="form-control mt-3" type="text" name="" id="email"  placeholder="Email">
                            </div>
                        </div>
                        <input class="form-control mt-3" type="text" name="" id="phone"  placeholder="Số điện thoại">
                        <input type="text" class="form-control mt-3" placeholder="Nội dung">
                        <button type="button" class="btn btn-primary px-4 mt-3" id="btnAddOrUpdateCustomerss">
                            Gửi liên hệ
                        </button>
                </div>
            </div>
        </div>
    </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="application/javascript">
    $('#btnAddOrUpdateCustomerss').click(function(){
        var data = {};
        data['fullName']=$('#fullName').val();
        data['phone']=$('#phone').val();
        data['email']=$('#email').val();
        data['isActive']=1;
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
    })
</script>

</section>
</body>
</html>
