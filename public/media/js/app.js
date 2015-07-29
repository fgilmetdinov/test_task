'use strict';
var myApp = angular.module('myApp', ['ngCookies']);
myApp.controller('AppCtrl', ['$scope', '$http', '$interval', '$filter', '$cookies',
    function($scope, $http, $interval, $filter, $cookies) {
        var stop;
        $scope.lastDate = new Date();
        $scope.form = {selectedInactive:"", selectedActive:""};
        $scope.codes = [];
        $scope.listActive = [];
        $scope.listInactive = [];
        $scope.rates = [];

        $scope.init = function () {
            // Retrieving a cookie
            var codesCookie = $cookies.codes;
            if (typeof codesCookie == 'undefined') {
                codesCookie = '840,978,974,980';
                $cookies.codes = codesCookie;
            }
            $scope.codes = codesCookie.split(",");

            $scope.getList();
            $scope.startInterval();
        };

        $scope.startInterval = function() {
            if ( angular.isDefined(stop) ) return;
            //console.log('timer started');
            stop = $interval(function() {
                var currentDate = new Date();
                if (currentDate.getDay() != $scope.lastDate.getDay())
                {
                    $scope.getList();
                }
            }, 60000);
        };

        $scope.stopInterval = function() {
            if (angular.isDefined(stop)) {
                $interval.cancel(stop);
                stop = undefined;
            }
        };

        $scope.$on('$destroy', function() {
            // Make sure that the interval is destroyed too
            $scope.stopInterval();
        });

        $scope.getList = function() {
            $scope.error = "loading...";
            var activeCodes = $scope.getActiveCodes();
            $http.get('/api/getlist', {
                params: {
                    codes: activeCodes
                }
                }).
                success(function(data, status, headers, config) {
                    if (data.status == 1) {
                        $scope.error = data.error;
                    }
                    else {
                        $scope.lastDate = new Date();
                        $scope.error = 'Ok';

                        $scope.listActive = [];
                        $scope.listInactive = [];
                        $scope.rates = [];

                        angular.forEach(data.data, function(value){
                            if ($scope.codes.indexOf(value["code"]) == -1) {
                                $scope.listInactive.push(value);
                            }
                            else {
                                $scope.listActive.push(value);
                                $scope.rates.push(value);
                            }
                        });
                        $scope.updateFilter();
                    }
                }).
                error(function(data, status, headers, config) {
                    $scope.error = "Error " + data;
                });
        };

        $scope.getActiveCodes = function() {
            var result = '';
            angular.forEach($scope.codes, function(value){
                result += value + ';';
            });
            return result;
        };

        $scope.updateFilter = function() {
            if ($scope.listInactive.length != 0)
                $scope.form.selectedInactive = $scope.listInactive[0].code;
            if ($scope.listActive.length != 0)
                $scope.form.selectedActive = $scope.listActive[0].code;
        };

        $scope.addToList = function() {
            if ($scope.form.selectedInactive == "")
                return;

            var index = -1;
            for(var i=0; i < $scope.listInactive.length; i++) {
                if ($scope.listInactive[i]["code"] == $scope.form.selectedInactive) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                $scope.listActive.push($scope.listInactive[index]);
                $scope.rates.push($scope.listInactive[index]);
                $scope.listInactive.splice(index, 1);
            }
            $scope.updateCodes();
            $scope.updateFilter();
            console.log($scope.rates);
        };

        $scope.deleteFromList = function() {
            if ($scope.form.selectedActive == "")
                return;

            var index = -1;
            for(var i=0; i < $scope.listActive.length; i++) {
                if ($scope.listActive[i]["code"] == $scope.form.selectedActive) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                $scope.listInactive.push($scope.listActive[index]);
                $scope.listActive.splice(index, 1);
                index = -1;
                for(var i=0; i < $scope.rates.length; i++) {
                    if ($scope.rates[i]["code"] == $scope.form.selectedActive) {
                        index = i;
                        break;
                    }
                }
                if (index != -1)
                    $scope.rates.splice(index, 1);
            }

            $scope.updateCodes();
            $scope.updateFilter();
        };

        $scope.updateCodes = function() {
            var codes = "";
            $scope.codes = [];
            for(var i = 0; i < $scope.listActive.length; i++) {
                $scope.codes.push($scope.listActive[i]["code"]);
            }
            $cookies.codes = $scope.codes.join(",");
        }
    }
]);