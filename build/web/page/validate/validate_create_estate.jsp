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

        console.log("gara "+garages);

        var price = document.getElementById('price').value;
        var areas = document.getElementById('areas').value;
        var address1 = document.getElementById('address1').value;
        var address2 = document.getElementById('address2').value;
        var content = document.getElementById('content').value;

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (estateName === "" || estateName.length<10) {

            document.getElementById('estateNameMessage').innerHTML = 'must more than 10 character';
            document.getElementById('estateNameForm').classList.add("has-error");
            
            console.log("1-1");
        }else
        if (garages === "" || garages < 0 || garages > 10) {
            document.getElementById('garagesMessage').innerHTML = 'Enter a Number between 0 and 10';
            document.getElementById('garagesForm').classList.add("has-error");
            console.log("2-1");
        }else
        
        if(price === "" || price < 10000 ){
            document.getElementById('priceMessage').innerHTML = 'Enter price > 10000$';
            document.getElementById('priceForm').classList.add("has-error");
            console.log("3-1");
        }else
        if(areas === "" || areas <0){
            document.getElementById('areasMessage').innerHTML = 'Please enter a number';
            document.getElementById('areasForm').classList.add("has-error");
            console.log("4-1");
        }else
        
        if(address1 === "" || address1.length<10 ){
            document.getElementById('address1Message').innerHTML = 'must more than 10 character';
            document.getElementById('address1Form').classList.add("has-error");
            console.log("5-1");
        }else
        
        if(address2 === "" || address2.length<10 ){
            document.getElementById('address2Message').innerHTML = 'must more than 10 character';
            document.getElementById('address2Form').classList.add("has-error");
        }else
        
        if(content === "" || content.length<200 ){
            document.getElementById('contentMessage').innerHTML = 'must more than 200 character';
            document.getElementById('contentForm').classList.add("has-error");
        }else{
           return true;
        }
        return false;
    }
</script>
