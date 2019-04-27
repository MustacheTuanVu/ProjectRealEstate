<%-- 
    Document   : validate_search_feature
    Created on : Mar 20, 2019, 2:11:19 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormAddFeature() {
        // Bước 1: Lấy giá trị của username và password
        var featureName = document.getElementById('featureName').value;
        

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (featureName === "" || featureName.length<5) {

            document.getElementById('featureNameMessage').innerHTML = 'Ít nhất 5 kí tự';

            document.getElementById('featureNameForm').classList.add("has-error");
        }else{
            document.getElementById('featureNameMessage').innerHTML = '';
            document.getElementById('featureNameForm').classList.remove("has-error");
        }
        
        
    }
</script>
