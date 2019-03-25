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
                        <a href="<%=request.getContextPath()%>/index">Home</a>
                        <a href="<%=request.getContextPath()%>/EstateList?user=guest&estateStatus=all&estateType=all">Estate</a>
                        <a href="<%=request.getContextPath()%>/EmployeeList?user=guest">Agent</a>
                        <a href="<%=request.getContextPath()%>/ProjectList?user=guest">Project</a>
                        <a href="<%=request.getContextPath()%>/BlogListAllUser?cat=all&user=guest">Blog</a>
                    </nav>
                    <!-- end of block .nav-footer-->
                </div>
            </div>
        </div>
        <!-- end of block .footer__col-first-->
        <div class="footer__col footer__col--second">
            <div class="widget js-widget widget--footer">
                <div class="widget__header">
                    <h2 class="widget__title">Contact</h2>
                </div>
                <div class="widget__content">
                    <section class="address address--footer">
                        <h4 class="address__headline">Our office</h4>
                        <address class="address__main"><span>17/5 CMT8, Phuong 3, Quan 10, Ho Chi Minh City</span><span>08 - 17 mon-fr</span><a href="tel:+442240052225">+1 202 555 0135</a><a href="tel:+442240052225">+1 202 555 0135</a><span>Fax: +1 202 555 0135</span><a href="mailto:hello@example.com">hello@example.com</a></address>
                    </section>
                    <!-- end of block .address-->
                </div>
            </div>
        </div>
        <div class="footer__col footer__col--third">
            <div class="widget js-widget widget--footer">
                <div class="widget__header">
                    <h2 class="widget__title">About</h2>
                </div>
                <div class="widget__content">
                    <aside class="widget_text">
                        <div class="textwidget">
                            RealEstate24H is the leader in online real estate and operator of the HCM of real estate web site for consumers and real estate professionals. Real Estate of websites captures more than 20 million monthly visitors
                            <p>RealEstate24H is the leader in online real estate and operator of the HCM of real</p>
                            <p></p>
                        </div>

                    </aside>
                </div>
            </div>
        </div>
        <div class="clearfix"></div><span class="footer__copyright">&copy; 2019 RealEstate24H. All rights reserved</span>
        <!-- end of block .footer__copyright-->
    </div>
</div>