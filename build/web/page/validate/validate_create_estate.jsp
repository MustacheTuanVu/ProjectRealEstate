<%-- 
    Document   : validate_create_estate
    Created on : Mar 19, 2019, 1:55:16 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormCreateEstate() {
        // Bước 1: Lấy giá trị của username và password
        var estateName = document.getElementById('estateName').value;
        var garages = document.getElementById('garages').value;
        var price = document.getElementById('price').value;
        var areas = document.getElementById('areas').value;
        var address1 = document.getElementById('address1').value;
        var address2 = document.getElementById('address2').value;
        var content = document.getElementById('content').value;

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (estateName === "" || estateName.length<10) {
            document.getElementById('estateNameMessage').innerHTML = 'Ít nhất 10 kí tự';
            document.getElementById('estateNameForm').classList.add("has-error");
        }else{
            document.getElementById('estateNameMessage').innerHTML = '';
            document.getElementById('estateNameForm').classList.remove("has-error");
        }
        
        if (garages === "" || garages < 0 || garages > 10) {
            document.getElementById('garagesMessage').innerHTML = 'Nhập vào chữ số từ 0 đến 10';
            document.getElementById('garagesForm').classList.add("has-error");
        }else{
            document.getElementById('garagesMessage').innerHTML = '';
            document.getElementById('garagesForm').classList.remove("has-error");
        }
        
        if(price === "" || price < 10000 ){
            document.getElementById('priceMessage').innerHTML = 'Nhập giá phải lớn hơn 10000$';
            document.getElementById('priceForm').classList.add("has-error");
        }else{
            document.getElementById('priceMessage').innerHTML = '';
            document.getElementById('priceForm').classList.remove("has-error");
        }
        
        if(areas === "" || areas <0){
            document.getElementById('areasMessage').innerHTML = 'Vui lòng nhập vào chữ số';
            document.getElementById('areasForm').classList.add("has-error");
        }else{
            document.getElementById('areasMessage').innerHTML = '';
            document.getElementById('areasForm').classList.remove("has-error");
        }
        
        if(address1 === "" || address1.length<10 ){
            document.getElementById('address1Message').innerHTML = 'Ít nhất 10 kí tự';
            document.getElementById('address1Form').classList.add("has-error");
        }else{
            document.getElementById('address1Message').innerHTML = '';
            document.getElementById('address1Form').classList.remove("has-error");
        }
        
        if(address2 === "" || address2.length<10 ){
            document.getElementById('address2Message').innerHTML = 'Ít nhất 10 kí tự';
            document.getElementById('address2Form').classList.add("has-error");
        }else{
            document.getElementById('address2Message').innerHTML = '';
            document.getElementById('address2Form').classList.remove("has-error");
        }
        
        if(content === "" || content.length<200 ){
            document.getElementById('contentMessage').innerHTML = 'Ít nhất 200 kí tự';
            document.getElementById('contentForm').classList.add("has-error");
        }else{
            document.getElementById('contentMessage').innerHTML = '';
            document.getElementById('contentForm').classList.remove("has-error");
        }
    }
</script>
