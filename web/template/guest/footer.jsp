<%-- 
    Document   : footer
    Created on : Feb 14, 2019, 5:12:19 PM
    Author     : kiems
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
    <div class="footer__wrap">
        <div class="footer__col footer__col--first">
            <div class="widget js-widget widget--footer">
                <div class="widget__header">
                    <h2 class="widget__title">Menu</h2>
                </div>
                <div class="widget__content">

                    <nav class="nav nav--footer">
                        <a href="<%=request.getContextPath()%>/index">Trang chủ</a>
                        <a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=all&estateType=all">Bất động sản</a>
                        <a href="<%=request.getContextPath()%>/EmployeeList?user=guest">Nhân viên tư vấn</a>
                        <a href="<%=request.getContextPath()%>/ProjectList?user=guest">Dự án</a>
                        <a href="<%=request.getContextPath()%>/BlogListAllUser?cat=all&user=guest">Bài viết</a>
                    </nav>
                    <!-- end of block .nav-footer-->
                </div>
            </div>

        </div>
        <!-- end of block .footer__col-first-->
        <div class="footer__col footer__col--second">
            <div class="widget js-widget widget--footer">
                <div class="widget__header">

                    <h2 class="widget__title">Liên hệ</h2>
                </div>
                <div class="widget__content">
                    <section class="address address--footer">
                        <h4 class="address__headline">Văn phòng chúng tôi</h4>
                        <address class="address__main"><span>17/5 CMT8, Phường 3, Quận 10, Tp. Hồ Chí Minh</span><span>08 - 17 mon-fr</span><a href="tel:+442240052225">+1 202 555 0135</a><a href="tel:+442240052225">+1 202 555 0135</a><span>Fax: +1 202 555 0135</span><a href="mailto:hello@example.com">hello@example.com</a></address>

                    </section>
                    <!-- end of block .address-->
                </div>
            </div>
        </div>
        <div class="footer__col footer__col--third">
            <div class="widget js-widget widget--footer">
                <div class="widget__header">
                    <h2 class="widget__title">Về chúng tôi</h2>
                </div>
                <div class="widget__content">
                    <aside class="widget_text">
                        <div class="textwidget">
                            SGEstate24h là công ty hàng đầu trong lĩnh vực bất động sản trực tuyến và nhà điều hành HCM của trang web bất động sản dành cho người tiêu dùng và các chuyên gia bất động sản. Bất động sản của các trang web thu hút hơn 20 triệu khách truy cập hàng tháng
                            <p>SGEstate24h là công ty hàng đầu trong lĩnh vực bất động sản và điều hành trực tuyến của HCM</p>
                            <p></p>
                        </div>

                    </aside>
                </div>
            </div>
        </div>
        <div class="clearfix"></div><span class="footer__copyright">&copy; 2019 SGEstate24h. All rights reserved</span>

        <!-- end of block .footer__copyright-->
    </div>
</div>