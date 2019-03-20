<%-- 
    Document   : validate_create_project
    Created on : Mar 20, 2019, 7:30:16 AM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormCreateProject() {
        // Bước 1: Lấy giá trị của username và password
        var projectName = document.getElementById('projectName').value;
        var blockNumber = document.getElementById('blockNumber').value;
        var floorNumber = document.getElementById('floorNumber').value;
        var address = document.getElementById('address').value;
        var projectContent = document.getElementById('projectContent').value;

        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (projectName === "" || projectName.length<6) {
            document.getElementById('projectNameMessage').innerHTML = 'must more than 6 character';
            document.getElementById('projectNameForm').classList.add("has-error");
        }else{
            document.getElementById('projectNameMessage').innerHTML = '';
            document.getElementById('projectNameForm').classList.remove("has-error");
        }
        
        if (blockNumber === "" || blockNumber < 0 || blockNumber > 5) {
            document.getElementById('blockNumberMessage').innerHTML = 'Enter a Number between 0 and 5';
            document.getElementById('blockNumberForm').classList.add("has-error");
        }else{
            document.getElementById('blockNumberMessage').innerHTML = '';
            document.getElementById('blockNumberForm').classList.remove("has-error");
        }
        
        if(floorNumber === "" || floorNumber < 1 || floorNumber > 10 ){
            document.getElementById('floorNumberMessage').innerHTML = 'Enter a Number between 1 and 10';
            document.getElementById('floorNumberForm').classList.add("has-error");
        }else{
            document.getElementById('floorNumberMessage').innerHTML = '';
            document.getElementById('floorNumberForm').classList.remove("has-error");
        }
        
        if(address === "" || address.length<10 ){
            document.getElementById('addressMessage').innerHTML = 'must more than 10 character';
            document.getElementById('addressForm').classList.add("has-error");
        }else{
            document.getElementById('addressMessage').innerHTML = '';
            document.getElementById('addressForm').classList.remove("has-error");
        }
        
        if(projectContent === "" || projectContent.length<200 ){
            document.getElementById('contentMessage').innerHTML = 'must more than 200 character';
            document.getElementById('contentForm').classList.add("has-error");
        }else{
            document.getElementById('contentMessage').innerHTML = '';
            document.getElementById('contentForm').classList.remove("has-error");
        }
    }
</script>