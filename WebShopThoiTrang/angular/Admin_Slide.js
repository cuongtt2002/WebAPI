var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminSlideCtrl", function ($scope, $http) {

    
    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.anh = "";
    }

    $scope.listdata;
    $scope.pageSize = 2;
    $scope.currentPage = 1;
    $scope.totalPages = 1;

    $scope.LoadSlide = function () {
        let obj = {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: Admin_current_url + '/api/Slide/get-slide',
        }).then(function (response) {
            $scope.listdata = response.data.data;
            $scope.totalPages = Math.ceil(response.data.totalItems/ $scope.pageSize);
            console.log(response.data);
        });
    };

    $scope.setPage = function (page) {
        if (page < 1 || page > $scope.totalPages) {
            return;
        }
        $scope.currentPage = page;
        if ($scope.currentPage === $scope.totalPages && $scope.listdata.length === 0) {
            $scope.currentPage = 1;
        }
        $scope.LoadSlide();
    };    

    $scope.LoadSlide();


    $scope.CapNhat = function (ma){
        $scope.btnText = "Sửa"
        $http({
            method: 'GET',
            headers: { "Authorization": 'Bearer ' + _user.token },
            url:  Admin_current_url + '/api/Slide/Get-theo-ma/' + ma,
        }).then(function (response) {
            let slide = response.data;
            $scope.maSlide = slide.maSlide;
            $scope.anh = slide.anh;
        });
    }

    $scope.CreateUpdate = function () {
        let obj = {};
        obj.maSlide = $scope.maSlide;
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
                url:  Admin_current_url + '/api/Slide/upload/',
            }).then(function (res) {

                obj.anh = res.data.filePath;

                if($scope.btnText == "Thêm")
                {
                    $http({
                        method: 'POST',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/Slide/Them-Slide',
                    }).then(function (response) {
                        $scope.LoadSlide();
                        alert('Thêm slide thành công!');
                    });
                }
                else
                {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/Slide/Cap-nhat-slide',
                    }).then(function (response) {
                        $scope.LoadSlide();
                        alert('Sửa slide thành công!');
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
                        url:  Admin_current_url + '/api/Slide/Them-Slide',
                    }).then(function (response) {
                        $scope.LoadSlide();
                        alert('Thêm slide thành công!');
                    });
            }
            else
            {
                    $http({
                        method: 'PUT',
                        headers: { "Authorization": 'Bearer ' + _user.token },
                        data: obj,
                        url:  Admin_current_url + '/api/Slide/Cap-nhat-slide',
                    }).then(function (response) {
                        $scope.LoadSlide();
                        alert('Sửa slide thành công!');
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
                url:  Admin_current_url + '/api/Slide/delete-Slide/' + ma,
            }).then(function (response) {
                $scope.LoadSlide();
                alert('Xóa thành công!');
            });
        } 
    };
    // Người dùng --------------------------------------
    $scope.hoTen = _user.hoten;
    $scope.anhDaiDien = _user.anhdaidien;
});