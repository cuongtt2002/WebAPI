var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminGioiThieuCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.tieuDe = "";
        $scope.noiDung = "";
        $scope.anh ="";
    }

    //Lấy giới thiệu
	$scope.listGioiThieu; 
    $scope.pageSize = "20";   
    $scope.LoadGioiThieu = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/GioiThieu/get-gioithieu',
        }).then(function (response) {	
            $scope.listGioiThieu = response.data.data;
            console.log($scope.listGioiThieu);
        });
    };  
    $scope.LoadGioiThieu();


    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/GioiThieu/Get-theo-ma/' + ma,
        }).then(function (response) {
            let gioithieu = response.data;
            $scope.maGioiThieu = gioithieu.maGioiThieu;
            $scope.tieuDe = gioithieu.tieuDe;
            $scope.noiDung = gioithieu.noiDung;
            $scope.anh = gioithieu.anh;
            console.log(gioithieu);
        });
    }


    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maGioiThieu = $scope.maGioiThieu;
        obj.tieuDe = $scope.tieuDe;
        obj.noiDung = $scope.noiDung;
        var file = document.getElementById('file').files[0];

        if(file)
        {
            const formData = new FormData();
            formData.append('file', file);

            $http({
                method: 'POST',
                headers: {
                    "Authorization": 'Bearer ' + _user.token,
                    'Content-Type': undefined
                },
                data: formData,
                url:  Admin_current_url + '/api/GioiThieu/upload/',
            }).then(function (res) {

                obj.anh = res.data.filePath;

                if($scope.btnText == "Thêm")
                {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GioiThieu/Them-GioiThieu',
                    }).then(function (response) {
                        $scope.LoadGioiThieu();
                        alert('Thêm giới thiệu thành công!');
                    });
                }
                else
                {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GioiThieu/Cap-nhat-GioiThieu',
                    }).then(function (response) {
                        $scope.LoadGioiThieu();
                        alert('Sửa giới thiệu thành công!');
                    });
                }
            });
        }
        else
        {
            obj.anh = $scope.anh;

            if($scope.btnText == "Thêm")
            {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GioiThieu/Them-GioiThieu',
                    }).then(function (response) {
                        $scope.LoadGioiThieu();
                        alert('Thêm giới thiệu thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/GioiThieu/Cap-nhat-GioiThieu',
                    }).then(function (response) {
                        $scope.LoadGioiThieu();
                        alert('Sửa giới thiệu thành công!');
                    });
            }
        }
        $("#exampleModal").modal("hide");
    }
    $scope.Delete = function (ma) {
        if (confirm("Bạn có chắc muốn xóa không?")) {
            $http({
                method: 'DELETE',                
                headers: { "Authorization": 'Bearer ' + _user.token },
                url:  Admin_current_url + '/api/GioiThieu/xoa-gioithieu/' + ma,
            }).then(function (response) {
                $scope.LoadGioiThieu();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
    
});