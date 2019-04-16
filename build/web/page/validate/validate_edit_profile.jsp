<%-- 
    Document   : validate_edit_profile
    Created on : Mar 19, 2019, 4:15:46 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
    function validateFormEditProfile() {
        // Bước 1: Lấy giá trị của username và password
        var name = document.getElementById('name').value;
        var icard = document.getElementById('icard').value;
        var address = document.getElementById('address').value;
        var phone = document.getElementById('phone').value;
        var email = document.getElementById('email').value;

        var txtContent = document.getElementById('txtContent').value;


        // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
        if (name === "" || name.length < 6) {
            document.getElementById('nameMessage').innerHTML = 'must more than 10 character';
            document.getElementById('nameForm').classList.add("has-error");
        } else {
            document.getElementById('nameMessage').innerHTML = '';
            document.getElementById('nameForm').classList.remove("has-error");
        }

        var re16digit = /^\d{9}$/;
        if (icard === "" || icard.search(re16digit) === -1) {
            document.getElementById('icardMessage').innerHTML = 'Enter 9 Number ';
            document.getElementById('icardForm').classList.add("has-error");
        } else {
            document.getElementById('icardMessage').innerHTML = '';
            document.getElementById('icardForm').classList.remove("has-error");
        }

        if (address === "" || address.length < 10) {
            document.getElementById('addressMessage').innerHTML = 'must more than 10 character';
            document.getElementById('addressForm').classList.add("has-error");
        } else {
            document.getElementById('addressMessage').innerHTML = '';
            document.getElementById('addressForm').classList.remove("has-error");
        }

        var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
        if (phone === "" || vnf_regex.test(phone) === false) {
            document.getElementById('phoneMessage').innerHTML = 'Enter sai dinh dang ';
            document.getElementById('phoneForm').classList.add("has-error");
        }else {
            document.getElementById('phoneMessage').innerHTML = '';
            document.getElementById('phoneForm').classList.remove("has-error");
        }

        var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (!filter.test(email)) {
            document.getElementById('emailMessage').innerHTML = 'sai dinh dang';
            document.getElementById('emailForm').classList.add("has-error");
        } else {
            document.getElementById('emailMessage').innerHTML = '';
            document.getElementById('emailForm').classList.remove("has-error");
        }
            
        

        if (txtContent === "" || txtContent.length < 200) {
            document.getElementById('descriptionMessage').innerHTML = 'must more than 200 character';
            document.getElementById('descriptionForm').classList.add("has-error");
        } else {
            document.getElementById('descriptionMessage').innerHTML = '';
            document.getElementById('descriptionForm').classList.remove("has-error");
        }
    }
</script>