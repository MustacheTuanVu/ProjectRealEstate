<%-- 
    Document   : validate_search_estate_type
    Created on : Mar 20, 2019, 2:21:00 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormAddEstateType() {
        // Bước 1: Lấy giá trị của username và password
        var estateTypeName = document.getElementById('estateTypeName').value;
        

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (estateTypeName === "" || estateTypeName.length<5) {

            document.getElementById('estateTypeNameMessage').innerHTML = 'Ít nhất 5 kí tự';

            document.getElementById('estateTypeNameForm').classList.add("has-error");
        }else{
            document.getElementById('estateTypeNameMessage').innerHTML = '';
            document.getElementById('estateTypeNameForm').classList.remove("has-error");
        }
        
        
    }
</script>
