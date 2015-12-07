// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular
//= require angular-animate
//= require angular-resource
//= require_tree .

angular.element(document).ready(function () {

    // initializing the website with one random vid
    console.log('initialize vid');

    $.get('/videos').then(function(response) {

        console.log(response);

        var randomNumber = Math.floor(Math.random() * (response.length - 0 + 1)) + 0;
        var randomVidURL = response[randomNumber].url;

        // append iframe with random vid url
        $('#video-div').append("<iframe id='iframe-vid' src='" + randomVidURL + "' style='border: 0; width: 100vw; height: 100vh;'  frameborder='0'></iframe>");

    });

});

angular.module('Videos',[]).directive('ngvideo', function() {

    return {

        controllerAs: 'video',
        controller: ['$http', function VidsCtrl($http) {
            this.$http = $http;

            // to always capture this as its current value, it is assigned to a var.
            var self = this;

            // function for grabbing all of the videos in the db and returning a random one.
            this.generateNewVid = function() {

                console.log('getting a new random vid');

                self.$http.get('/videos').then(function(response) {

                    var randomNumber = Math.floor(Math.random() * (response.data.length - 0 + 1)) + 0;
                    var randomVidURL = response.data[randomNumber]['url'];

                    // replace the iframe's src with new vid url
                    $('#iframe-vid').attr('src', randomVidURL);

                });

            }

        }] // close controller

    } // close return object

}) // close angular module

