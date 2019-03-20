<%-- 
    Document   : validate_edit_estate
    Created on : Mar 19, 2019, 6:33:38 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormEditEstate() {
        // Bước 1: Lấy giá trị của username và password
        var estateName = document.getElementById('estateName').value;
        var garages = document.getElementById('garages').value;
        var price = document.getElementById('price').value;
        var areas = document.getElementById('areas').value;
        var address1 = document.getElementById('address1').value;
        var address2 = document.getElementById('address2').value;
        var estateDescription = document.getElementById('estateDescription').value;

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (estateName === "" || estateName.length<10) {
            document.getElementById('estateNameMessage').innerHTML = 'must more than 10 character';
            document.getElementById('estateNameForm').classList.add("has-error");
        }else{
            document.getElementById('estateNameMessage').innerHTML = '';
            document.getElementById('estateNameForm').classList.remove("has-error");
        }
        
        if (garages === "" || garages < 0 || garages > 10) {
            document.getElementById('garagesMessage').innerHTML = 'Enter a Number between 0 and 10';
            document.getElementById('garagesForm').classList.add()("has-error");
        }else{
            document.getElementById('garagesMessage').innerHTML = '';
            document.getElementById('garagesForm').classList.remove("has-error");
        }
        
        if(price === "" || price < 10000 ){
            document.getElementById('priceMessage').innerHTML = 'Enter price > 10000$';
            document.getElementById('priceForm').classList.add("has-error");
        }else{
            document.getElementById('priceMessage').innerHTML = '';
            document.getElementById('priceForm').classList.remove("has-error");
        }
        
        if(areas === "" || areas <0){
            document.getElementById('areasMessage').innerHTML = 'Please enter a number';
            document.getElementById('areasForm').classList.add("has-error");
        }else{
            document.getElementById('priceMessage').innerHTML = '';
            document.getElementById('priceForm').classList.remove("has-error");
        }
        
        
        
        if(estateDescription === "" || estateDescription.length<200 ){
            document.getElementById('contentMessage').innerHTML = 'must more than 200 character';
            document.getElementById('contentForm').classList.add("has-error");
        }else{
            document.getElementById('contentMessage').innerHTML = '';
            document.getElementById('contentForm').classList.remove("has-error");
        }
    }
</script>
