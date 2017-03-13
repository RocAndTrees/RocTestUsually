/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	var __weex_template__ = __webpack_require__(1)
	var __weex_style__ = __webpack_require__(2)
	var __weex_script__ = __webpack_require__(3)

	__weex_define__('@weex-component/9b2919f91c3655da2e6c544bb9f38d70', [], function(__weex_require__, __weex_exports__, __weex_module__) {

	    __weex_script__(__weex_module__, __weex_exports__, __weex_require__)
	    if (__weex_exports__.__esModule && __weex_exports__.default) {
	      __weex_module__.exports = __weex_exports__.default
	    }

	    __weex_module__.exports.template = __weex_template__

	    __weex_module__.exports.style = __weex_style__

	})

	__weex_bootstrap__('@weex-component/9b2919f91c3655da2e6c544bb9f38d70',undefined,undefined)

/***/ },
/* 1 */
/***/ function(module, exports) {

	module.exports = {
	  "type": "div",
	  "children": [
	    {
	      "type": "image",
	      "classList": [
	        "bgImg"
	      ],
	      "attr": {
	        "src": function () {return this.bgImg}
	      }
	    },
	    {
	      "type": "div",
	      "classList": [
	        "city"
	      ],
	      "events": {
	        "click": "btnCity"
	      },
	      "children": [
	        {
	          "type": "image",
	          "classList": [
	            "cityImg"
	          ],
	          "attr": {
	            "src": function () {return this.cityImg}
	          }
	        },
	        {
	          "type": "text",
	          "classList": [
	            "cityName"
	          ],
	          "attr": {
	            "value": "杭州"
	          }
	        }
	      ]
	    },
	    {
	      "type": "image",
	      "classList": [
	        "selectImg"
	      ],
	      "events": {
	        "click": "btnSelect"
	      },
	      "attr": {
	        "src": function () {return this.selectImg}
	      }
	    },
	    {
	      "type": "image",
	      "classList": [
	        "parkImg"
	      ],
	      "events": {
	        "click": "btnPark"
	      },
	      "attr": {
	        "src": function () {return this.parkImg}
	      }
	    },
	    {
	      "type": "image",
	      "classList": [
	        "crashImg"
	      ],
	      "events": {
	        "click": "btnCrash"
	      },
	      "attr": {
	        "src": function () {return this.crashImg}
	      }
	    },
	    {
	      "type": "image",
	      "shown": function () {return !this.flag},
	      "classList": [
	        "qrImg"
	      ],
	      "events": {
	        "click": "btnQr"
	      },
	      "attr": {
	        "src": function () {return this.qrImg}
	      }
	    },
	    {
	      "type": "image",
	      "shown": function () {return !this.flag},
	      "classList": [
	        "rechargeImg"
	      ],
	      "events": {
	        "click": "btnRecharge"
	      },
	      "attr": {
	        "src": function () {return this.rechargeImg}
	      }
	    },
	    {
	      "type": "div",
	      "children": [
	        {
	          "type": "image"
	        },
	        {
	          "type": "text",
	          "attr": {
	            "value": "杭州"
	          }
	        }
	      ],
	      "attr": {
	        "value": "软件"
	      }
	    }
	  ]
	}

/***/ },
/* 2 */
/***/ function(module, exports) {

	module.exports = {
	  "bgImg": {
	    "position": "absolute",
	    "top": 0,
	    "bottom": 0,
	    "left": 0,
	    "right": 0
	  },
	  "city": {
	    "position": "absolute",
	    "width": 250,
	    "height": 50,
	    "left": 50,
	    "top": 50
	  },
	  "cityImg": {
	    "position": "absolute",
	    "width": 50,
	    "height": 50
	  },
	  "cityName": {
	    "position": "absolute",
	    "width": 150,
	    "height": 50,
	    "left": 60,
	    "top": 5,
	    "color": "#000000"
	  },
	  "selectImg": {
	    "position": "absolute",
	    "width": 40,
	    "height": 40,
	    "right": 50,
	    "top": 50
	  },
	  "parkImg": {
	    "width": 390,
	    "height": 480,
	    "marginTop": 130,
	    "alignSelf": "center"
	  },
	  "crashImg": {
	    "width": 180,
	    "height": 220,
	    "alignSelf": "center",
	    "top": 20
	  },
	  "qrImg": {
	    "position": "absolute",
	    "width": 100,
	    "height": 100,
	    "right": 120,
	    "top": 15
	  },
	  "rechargeImg": {
	    "position": "absolute",
	    "width": 100,
	    "height": 100,
	    "right": 30,
	    "top": 120
	  }
	}

/***/ },
/* 3 */
/***/ function(module, exports) {

	module.exports = function(module, exports, __weex_require__){'use strict';

	var $modal = __weex_require__('@weex-module/homeEvent');
	var stream = __weex_require__('@weex-module/stream');
	var POST_URL = 'http://dev.api.ybzg.com/garage/?service=Garage.getUserMobile&mobile=15968578813';

	module.exports = {
	    data: function () {return {
	        deviceW: 750,
	        deviceH: 1334,
	        carportWidth: 410,
	        carportheight: 493,
	        carporttop: 80,
	        washWidth: 198,
	        washheight: 239,
	        flag: true,
	        bgImg: 'http://112.124.115.80:35002/home_bg@3x.png',
	        cityImg: 'http://112.124.115.80:35002/home_location@3x.png',
	        selectImg: 'http://112.124.115.80:35002/home_add@3x.png',
	        parkImg: 'http://112.124.115.80:35002/home_parkbig@3x.png',
	        crashImg: 'http://112.124.115.80:35002/home_washbig@3x.png',
	        qrImg: 'http://112.124.115.80:35002/home_scan@3x.png',
	        rechargeImg: 'http://112.124.115.80:35002/home_congzhi@3x.png'
	    }},

	    ready: function ready() {

	        this.$getConfig(function (config) {
	            var env = config.env;
	            this.deviceW = env.deviceWidth;
	            this.deviceH = env.deviceHeight;
	            if (env.platform != 'iOS') {
	                this.carportWidth = 410 * env.deviceWidth / deviceW;
	                this.carportheight = 433 * env.deviceHeight / deviceH;
	                this.washWidth = 198 * env.deviceWidth / deviceW;
	                this.washheight = 240 * env.deviceHeight / deviceH;
	            } else {
	                if (this.$getConfig().env.deviceHeight == 960) {
	                    this.carporttop = 80 * env.deviceHeight / deviceH;
	                } else {
	                    this.carporttop = 160 * env.deviceHeight / deviceH;
	                }
	                this.carportWidth = 410 * env.deviceWidth / deviceW;
	                this.carportheight = 433 * env.deviceHeight / deviceH;
	                this.washWidth = 198 * env.deviceWidth / deviceW;
	                this.washheight = 240 * env.deviceHeight / deviceH;
	            }
	        });
	    },

	    methods: {
	        getStarCount: function getStarCount(repo, callback) {
	            return stream.fetch({
	                method: 'POST',
	                url: POST_URL + repo,
	                type: 'json'
	            }, callback);
	        },


	        btnCity: function btnCity() {
	            $modal.area(" ");
	        },
	        btnSelect: function btnSelect() {
	            this.flag = !this.flag;
	        },
	        btnPark: function btnPark() {
	            $modal.parking(" ");
	        },
	        btnCrash: function btnCrash() {
	            $modal.clean(" ");
	        },
	        btnQr: function btnQr() {
	            $modal.qrcode(" ");
	        },
	        btnRecharge: function btnRecharge() {
	            $modal.recharge(" ");
	        }
	    }
	};}
	/* generated by weex-loader */


/***/ }
/******/ ]);