var _user = JSON.parse(localStorage.getItem("user"));
var app = angular.module('AppBanHang', []);
app.controller("AdminTinTucCtrl", function ($scope, $http) {

    $scope.taomoi = function (){
        $scope.btnText = "Thêm"
        $scope.tieuDe = "";
        $scope.ngayDang = "";
        $scope.noiDung = "";
        $scope.anhTinTuc = "";
        $scope.maNguoiDung = "";
        $scope.listjson_tintuc ="";
    }

    //--------------------------------------------------------Lấy tất cả kho -----------------------------------------------------------------------
	$scope.listdata;
    $scope.pageSize = 2;
    $scope.currentPage = 1;
    $scope.totalPages = 1;

    $scope.LoadTT = function () {
        let obj = {};
        obj.page = $scope.currentPage.toString();
        obj.pageSize = $scope.pageSize.toString();
        $http({
            method: 'POST',
            headers: { "Authorization": 'Bearer ' + _user.token },
            data: obj,
            url: Admin_current_url + '/api/TinTuc/Get-tintuc',
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
        $scope.LoadTT();
    };    

    $scope.LoadTT();

});