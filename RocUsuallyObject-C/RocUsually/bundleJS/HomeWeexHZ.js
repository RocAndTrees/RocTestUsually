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

	__weex_define__('@weex-component/8c5fb452e878335d530d37fa4325fc0b', [], function(__weex_require__, __weex_exports__, __weex_module__) {

	    __weex_script__(__weex_module__, __weex_exports__, __weex_require__)
	    if (__weex_exports__.__esModule && __weex_exports__.default) {
	      __weex_module__.exports = __weex_exports__.default
	    }

	    __weex_module__.exports.template = __weex_template__

	    __weex_module__.exports.style = __weex_style__

	})

	__weex_bootstrap__('@weex-component/8c5fb452e878335d530d37fa4325fc0b',undefined,undefined)

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
	            "value": "云泊.杭州"
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
	      "type": "image",
	      "shown": function () {return this.msgCleanFlag},
	      "classList": [
	        "msgCleanImg"
	      ],
	      "attr": {
	        "src": function () {return this.cleanMsgImg}
	      },
	      "events": {
	        "click": "btnMsgCleanAction"
	      }
	    },
	    {
	      "type": "image",
	      "shown": function () {return this.msgParkFlag},
	      "classList": [
	        "msgParkImg"
	      ],
	      "attr": {
	        "src": function () {return this.parkMsgImg}
	      },
	      "events": {
	        "click": "btnMsgParkAction"
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
	    "width": 40,
	    "height": 40
	  },
	  "cityName": {
	    "position": "absolute",
	    "width": 150,
	    "height": 50,
	    "left": 50,
	    "top": 5,
	    "color": "#000000",
	    "fontSize": 28
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
	    "marginTop": 150,
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
	    "width": 90,
	    "height": 90,
	    "right": 110,
	    "top": 15
	  },
	  "rechargeImg": {
	    "position": "absolute",
	    "width": 90,
	    "height": 90,
	    "right": 30,
	    "top": 110
	  },
	  "msgCleanImg": {
	    "position": "absolute",
	    "width": 80,
	    "height": 80,
	    "right": 30,
	    "bottom": 60
	  },
	  "msgParkImg": {
	    "position": "absolute",
	    "width": 80,
	    "height": 80,
	    "right": 30,
	    "bottom": 150
	  }
	}

/***/ },
/* 3 */
/***/ function(module, exports) {

	module.exports = function(module, exports, __weex_require__){'use strict';

	var $modal = __weex_require__('@weex-module/homeEvent');
	var stream = __weex_require__('@weex-module/stream');
	var globalEvent = __weex_require__('@weex-module/globalEvent');
	var syncTest = weex.requireModule('syncTest');
	var document;

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
	        msgParkFlag: false,
	        msgCleanFlag: false,

	        bgImg: 'http://112.124.115.80:35002/home_bg@3x.png',
	        cityImg: 'http://112.124.115.80:35002/home_location@3x.png',
	        selectImg: 'http://112.124.115.80:35002/home_add@3x.png',
	        parkImg: 'http://112.124.115.80:35002/home_parkbig@3x.png',
	        crashImg: 'http://112.124.115.80:35002/home_washbig@3x.png',
	        qrImg: 'http://112.124.115.80:35002/home_scan@3x.png',
	        parkMsgImg: 'http://112.124.115.80:35002/YB_CleanOrderMsg.png',
	        cleanMsgImg: 'http://112.124.115.80:35002/YB_ParkOrderMsg.png'

	    }},

	    ready: function ready() {
	        document = this;
	        var globalEvent = __weex_require__('@weex-module/globalEvent');
	        globalEvent.addEventListener("toast", function (e) {

	            module.exports.methods.show(e);
	        });

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
	        },
	        btnMsgAction: function btnMsgAction() {
	            $model.orderAction(" ");
	        },
	        btnMsgCleanAction: function btnMsgCleanAction() {
	            $model.parkOrderAction(" ");
	        },
	        btnMsgParkAction: function btnMsgParkAction() {
	            $model.cleanOrderAction(" ");
	        },

	        show: function show(e) {

	            if (e['clean'] == 1) {
	                document.msgCleanFlag = true;
	            } else {
	                document.msgCleanFlag = false;
	            }

	            if (e['park'] == 1) {
	                document.msgParkFlag = true;
	            } else {
	                document.msgParkFlag = false;
	            }
	        }

	    }

	};}
	/* generated by weex-loader */


/***/ }
/******/ ]);