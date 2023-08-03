var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminDonHangCtrl", function ($scope, $http) {

    //Lấy kho
	$scope.listdata; 
    $scope.pageSize = "20";   
    $scope.Loaddonhang = function () {	  
        let obj =  {};
        obj.page = "1";
        obj.pageSize = $scope.pageSize;
        $http({
            method: 'POST', 
            headers: { "Authorization": 'Bearer ' + _user.token},
            data: obj, 
            url:  Admin_current_url + '/api/DonHang/get-donhang',
        }).then(function (response) {	
            $scope.listdata = response.data.data;
        });
    };  
    $scope.Loaddonhang();


    $scope.ctdonhang = function(ma){
        $http({
            method:'GET',
            headers:{ "Authorization": 'Bearer ' + _user.token},
            url:  Admin_current_url + '/api/DonHang/Get-theo-ma/' + ma,

        }).then(function(response){
            let ct = response.data;
            $scope.listjson_chitietdonhang = ct.listjson_chitietdonhang;
            console.log($scope.listChiTietkho);
        })
    }

      // Người dùng --------------------------------------
      $scope.hoTen = _user.hoten;
      $scope.anhDaiDien = _user.anhdaidien;
});