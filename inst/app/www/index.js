"use strict";
var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/_virtual/_rollupPluginBabelHelpers.js
var require_rollupPluginBabelHelpers = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/_virtual/_rollupPluginBabelHelpers.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    function _defineProperty(obj, key, value) {
      if (key in obj) {
        Object.defineProperty(obj, key, {
          value,
          enumerable: true,
          configurable: true,
          writable: true
        });
      } else {
        obj[key] = value;
      }
      return obj;
    }
    function ownKeys(object, enumerableOnly) {
      var keys = Object.keys(object);
      if (Object.getOwnPropertySymbols) {
        var symbols = Object.getOwnPropertySymbols(object);
        if (enumerableOnly)
          symbols = symbols.filter(function(sym) {
            return Object.getOwnPropertyDescriptor(object, sym).enumerable;
          });
        keys.push.apply(keys, symbols);
      }
      return keys;
    }
    function _objectSpread2(target) {
      for (var i = 1; i < arguments.length; i++) {
        var source = arguments[i] != null ? arguments[i] : {};
        if (i % 2) {
          ownKeys(Object(source), true).forEach(function(key) {
            _defineProperty(target, key, source[key]);
          });
        } else if (Object.getOwnPropertyDescriptors) {
          Object.defineProperties(target, Object.getOwnPropertyDescriptors(source));
        } else {
          ownKeys(Object(source)).forEach(function(key) {
            Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key));
          });
        }
      }
      return target;
    }
    function _objectWithoutPropertiesLoose(source, excluded) {
      if (source == null)
        return {};
      var target = {};
      var sourceKeys = Object.keys(source);
      var key, i;
      for (i = 0; i < sourceKeys.length; i++) {
        key = sourceKeys[i];
        if (excluded.indexOf(key) >= 0)
          continue;
        target[key] = source[key];
      }
      return target;
    }
    function _objectWithoutProperties(source, excluded) {
      if (source == null)
        return {};
      var target = _objectWithoutPropertiesLoose(source, excluded);
      var key, i;
      if (Object.getOwnPropertySymbols) {
        var sourceSymbolKeys = Object.getOwnPropertySymbols(source);
        for (i = 0; i < sourceSymbolKeys.length; i++) {
          key = sourceSymbolKeys[i];
          if (excluded.indexOf(key) >= 0)
            continue;
          if (!Object.prototype.propertyIsEnumerable.call(source, key))
            continue;
          target[key] = source[key];
        }
      }
      return target;
    }
    function _slicedToArray(arr, i) {
      return _arrayWithHoles(arr) || _iterableToArrayLimit(arr, i) || _unsupportedIterableToArray(arr, i) || _nonIterableRest();
    }
    function _arrayWithHoles(arr) {
      if (Array.isArray(arr))
        return arr;
    }
    function _iterableToArrayLimit(arr, i) {
      if (typeof Symbol === "undefined" || !(Symbol.iterator in Object(arr)))
        return;
      var _arr = [];
      var _n = true;
      var _d = false;
      var _e = void 0;
      try {
        for (var _i = arr[Symbol.iterator](), _s; !(_n = (_s = _i.next()).done); _n = true) {
          _arr.push(_s.value);
          if (i && _arr.length === i)
            break;
        }
      } catch (err) {
        _d = true;
        _e = err;
      } finally {
        try {
          if (!_n && _i["return"] != null)
            _i["return"]();
        } finally {
          if (_d)
            throw _e;
        }
      }
      return _arr;
    }
    function _unsupportedIterableToArray(o, minLen) {
      if (!o)
        return;
      if (typeof o === "string")
        return _arrayLikeToArray(o, minLen);
      var n = Object.prototype.toString.call(o).slice(8, -1);
      if (n === "Object" && o.constructor)
        n = o.constructor.name;
      if (n === "Map" || n === "Set")
        return Array.from(o);
      if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))
        return _arrayLikeToArray(o, minLen);
    }
    function _arrayLikeToArray(arr, len) {
      if (len == null || len > arr.length)
        len = arr.length;
      for (var i = 0, arr2 = new Array(len); i < len; i++)
        arr2[i] = arr[i];
      return arr2;
    }
    function _nonIterableRest() {
      throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
    }
    exports.arrayLikeToArray = _arrayLikeToArray;
    exports.arrayWithHoles = _arrayWithHoles;
    exports.defineProperty = _defineProperty;
    exports.iterableToArrayLimit = _iterableToArrayLimit;
    exports.nonIterableRest = _nonIterableRest;
    exports.objectSpread2 = _objectSpread2;
    exports.objectWithoutProperties = _objectWithoutProperties;
    exports.objectWithoutPropertiesLoose = _objectWithoutPropertiesLoose;
    exports.slicedToArray = _slicedToArray;
    exports.unsupportedIterableToArray = _unsupportedIterableToArray;
  }
});

// node_modules/.pnpm/state-local@1.0.7/node_modules/state-local/lib/cjs/state-local.js
var require_state_local = __commonJS({
  "node_modules/.pnpm/state-local@1.0.7/node_modules/state-local/lib/cjs/state-local.js"(exports, module2) {
    "use strict";
    function _defineProperty(obj, key, value) {
      if (key in obj) {
        Object.defineProperty(obj, key, {
          value,
          enumerable: true,
          configurable: true,
          writable: true
        });
      } else {
        obj[key] = value;
      }
      return obj;
    }
    function ownKeys(object, enumerableOnly) {
      var keys = Object.keys(object);
      if (Object.getOwnPropertySymbols) {
        var symbols = Object.getOwnPropertySymbols(object);
        if (enumerableOnly)
          symbols = symbols.filter(function(sym) {
            return Object.getOwnPropertyDescriptor(object, sym).enumerable;
          });
        keys.push.apply(keys, symbols);
      }
      return keys;
    }
    function _objectSpread2(target) {
      for (var i = 1; i < arguments.length; i++) {
        var source = arguments[i] != null ? arguments[i] : {};
        if (i % 2) {
          ownKeys(Object(source), true).forEach(function(key) {
            _defineProperty(target, key, source[key]);
          });
        } else if (Object.getOwnPropertyDescriptors) {
          Object.defineProperties(target, Object.getOwnPropertyDescriptors(source));
        } else {
          ownKeys(Object(source)).forEach(function(key) {
            Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key));
          });
        }
      }
      return target;
    }
    function compose() {
      for (var _len = arguments.length, fns = new Array(_len), _key = 0; _key < _len; _key++) {
        fns[_key] = arguments[_key];
      }
      return function(x) {
        return fns.reduceRight(function(y, f) {
          return f(y);
        }, x);
      };
    }
    function curry(fn) {
      return function curried() {
        var _this = this;
        for (var _len2 = arguments.length, args = new Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
          args[_key2] = arguments[_key2];
        }
        return args.length >= fn.length ? fn.apply(this, args) : function() {
          for (var _len3 = arguments.length, nextArgs = new Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {
            nextArgs[_key3] = arguments[_key3];
          }
          return curried.apply(_this, [].concat(args, nextArgs));
        };
      };
    }
    function isObject(value) {
      return {}.toString.call(value).includes("Object");
    }
    function isEmpty(obj) {
      return !Object.keys(obj).length;
    }
    function isFunction(value) {
      return typeof value === "function";
    }
    function hasOwnProperty(object, property) {
      return Object.prototype.hasOwnProperty.call(object, property);
    }
    function validateChanges(initial, changes) {
      if (!isObject(changes))
        errorHandler("changeType");
      if (Object.keys(changes).some(function(field) {
        return !hasOwnProperty(initial, field);
      }))
        errorHandler("changeField");
      return changes;
    }
    function validateSelector(selector) {
      if (!isFunction(selector))
        errorHandler("selectorType");
    }
    function validateHandler(handler) {
      if (!(isFunction(handler) || isObject(handler)))
        errorHandler("handlerType");
      if (isObject(handler) && Object.values(handler).some(function(_handler) {
        return !isFunction(_handler);
      }))
        errorHandler("handlersType");
    }
    function validateInitial(initial) {
      if (!initial)
        errorHandler("initialIsRequired");
      if (!isObject(initial))
        errorHandler("initialType");
      if (isEmpty(initial))
        errorHandler("initialContent");
    }
    function throwError(errorMessages2, type) {
      throw new Error(errorMessages2[type] || errorMessages2["default"]);
    }
    var errorMessages = {
      initialIsRequired: "initial state is required",
      initialType: "initial state should be an object",
      initialContent: "initial state shouldn't be an empty object",
      handlerType: "handler should be an object or a function",
      handlersType: "all handlers should be a functions",
      selectorType: "selector should be a function",
      changeType: "provided value of changes should be an object",
      changeField: 'it seams you want to change a field in the state which is not specified in the "initial" state',
      "default": "an unknown error accured in `state-local` package"
    };
    var errorHandler = curry(throwError)(errorMessages);
    var validators = {
      changes: validateChanges,
      selector: validateSelector,
      handler: validateHandler,
      initial: validateInitial
    };
    function create(initial) {
      var handler = arguments.length > 1 && arguments[1] !== void 0 ? arguments[1] : {};
      validators.initial(initial);
      validators.handler(handler);
      var state = {
        current: initial
      };
      var didUpdate = curry(didStateUpdate)(state, handler);
      var update = curry(updateState)(state);
      var validate = curry(validators.changes)(initial);
      var getChanges = curry(extractChanges)(state);
      function getState() {
        var selector = arguments.length > 0 && arguments[0] !== void 0 ? arguments[0] : function(state2) {
          return state2;
        };
        validators.selector(selector);
        return selector(state.current);
      }
      function setState(causedChanges) {
        compose(didUpdate, update, validate, getChanges)(causedChanges);
      }
      return [getState, setState];
    }
    function extractChanges(state, causedChanges) {
      return isFunction(causedChanges) ? causedChanges(state.current) : causedChanges;
    }
    function updateState(state, changes) {
      state.current = _objectSpread2(_objectSpread2({}, state.current), changes);
      return changes;
    }
    function didStateUpdate(state, handler, changes) {
      isFunction(handler) ? handler(state.current) : Object.keys(changes).forEach(function(field) {
        var _handler$field;
        return (_handler$field = handler[field]) === null || _handler$field === void 0 ? void 0 : _handler$field.call(handler, state.current[field]);
      });
      return changes;
    }
    var index = {
      create
    };
    module2.exports = index;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/config/index.js
var require_config = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/config/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var config = {
      paths: {
        vs: "https://cdn.jsdelivr.net/npm/monaco-editor@0.33.0/min/vs"
      }
    };
    exports.default = config;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/curry.js
var require_curry = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/curry.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    function curry(fn) {
      return function curried() {
        var _this = this;
        for (var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++) {
          args[_key] = arguments[_key];
        }
        return args.length >= fn.length ? fn.apply(this, args) : function() {
          for (var _len2 = arguments.length, nextArgs = new Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
            nextArgs[_key2] = arguments[_key2];
          }
          return curried.apply(_this, [].concat(args, nextArgs));
        };
      };
    }
    exports.default = curry;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/isObject.js
var require_isObject = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/isObject.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    function isObject(value) {
      return {}.toString.call(value).includes("Object");
    }
    exports.default = isObject;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/validators/index.js
var require_validators = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/validators/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var curry = require_curry();
    var isObject = require_isObject();
    function validateConfig(config) {
      if (!config)
        errorHandler("configIsRequired");
      if (!isObject["default"](config))
        errorHandler("configType");
      if (config.urls) {
        informAboutDeprecation();
        return {
          paths: {
            vs: config.urls.monacoBase
          }
        };
      }
      return config;
    }
    function informAboutDeprecation() {
      console.warn(errorMessages.deprecation);
    }
    function throwError(errorMessages2, type) {
      throw new Error(errorMessages2[type] || errorMessages2["default"]);
    }
    var errorMessages = {
      configIsRequired: "the configuration object is required",
      configType: "the configuration object should be an object",
      "default": "an unknown error accured in `@monaco-editor/loader` package",
      deprecation: "Deprecation warning!\n    You are using deprecated way of configuration.\n\n    Instead of using\n      monaco.config({ urls: { monacoBase: '...' } })\n    use\n      monaco.config({ paths: { vs: '...' } })\n\n    For more please check the link https://github.com/suren-atoyan/monaco-loader#config\n  "
    };
    var errorHandler = curry["default"](throwError)(errorMessages);
    var validators = {
      config: validateConfig
    };
    exports.default = validators;
    exports.errorHandler = errorHandler;
    exports.errorMessages = errorMessages;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/compose.js
var require_compose = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/compose.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var compose = function compose2() {
      for (var _len = arguments.length, fns = new Array(_len), _key = 0; _key < _len; _key++) {
        fns[_key] = arguments[_key];
      }
      return function(x) {
        return fns.reduceRight(function(y, f) {
          return f(y);
        }, x);
      };
    };
    exports.default = compose;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/deepMerge.js
var require_deepMerge = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/deepMerge.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var _rollupPluginBabelHelpers = require_rollupPluginBabelHelpers();
    function merge(target, source) {
      Object.keys(source).forEach(function(key) {
        if (source[key] instanceof Object) {
          if (target[key]) {
            Object.assign(source[key], merge(target[key], source[key]));
          }
        }
      });
      return _rollupPluginBabelHelpers.objectSpread2(_rollupPluginBabelHelpers.objectSpread2({}, target), source);
    }
    exports.default = merge;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/makeCancelable.js
var require_makeCancelable = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/utils/makeCancelable.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var CANCELATION_MESSAGE = {
      type: "cancelation",
      msg: "operation is manually canceled"
    };
    function makeCancelable(promise) {
      var hasCanceled_ = false;
      var wrappedPromise = new Promise(function(resolve, reject) {
        promise.then(function(val) {
          return hasCanceled_ ? reject(CANCELATION_MESSAGE) : resolve(val);
        });
        promise["catch"](reject);
      });
      return wrappedPromise.cancel = function() {
        return hasCanceled_ = true;
      }, wrappedPromise;
    }
    exports.CANCELATION_MESSAGE = CANCELATION_MESSAGE;
    exports.default = makeCancelable;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/loader/index.js
var require_loader = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/loader/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var _rollupPluginBabelHelpers = require_rollupPluginBabelHelpers();
    var state = require_state_local();
    var index = require_config();
    var index$1 = require_validators();
    var compose = require_compose();
    var deepMerge = require_deepMerge();
    var makeCancelable = require_makeCancelable();
    function _interopDefaultLegacy(e) {
      return e && typeof e === "object" && "default" in e ? e : { "default": e };
    }
    var state__default = /* @__PURE__ */ _interopDefaultLegacy(state);
    var _state$create = state__default["default"].create({
      config: index["default"],
      isInitialized: false,
      resolve: null,
      reject: null,
      monaco: null
    });
    var _state$create2 = _rollupPluginBabelHelpers.slicedToArray(_state$create, 2);
    var getState = _state$create2[0];
    var setState = _state$create2[1];
    function config(globalConfig) {
      var _validators$config = index$1["default"].config(globalConfig), monaco = _validators$config.monaco, config2 = _rollupPluginBabelHelpers.objectWithoutProperties(_validators$config, ["monaco"]);
      setState(function(state2) {
        return {
          config: deepMerge["default"](state2.config, config2),
          monaco
        };
      });
    }
    function init() {
      var state2 = getState(function(_ref) {
        var monaco = _ref.monaco, isInitialized = _ref.isInitialized, resolve = _ref.resolve;
        return {
          monaco,
          isInitialized,
          resolve
        };
      });
      if (!state2.isInitialized) {
        setState({
          isInitialized: true
        });
        if (state2.monaco) {
          state2.resolve(state2.monaco);
          return makeCancelable["default"](wrapperPromise);
        }
        if (window.monaco && window.monaco.editor) {
          storeMonacoInstance(window.monaco);
          state2.resolve(window.monaco);
          return makeCancelable["default"](wrapperPromise);
        }
        compose["default"](injectScripts, getMonacoLoaderScript)(configureLoader);
      }
      return makeCancelable["default"](wrapperPromise);
    }
    function injectScripts(script) {
      return document.body.appendChild(script);
    }
    function createScript(src) {
      var script = document.createElement("script");
      return src && (script.src = src), script;
    }
    function getMonacoLoaderScript(configureLoader2) {
      var state2 = getState(function(_ref2) {
        var config2 = _ref2.config, reject = _ref2.reject;
        return {
          config: config2,
          reject
        };
      });
      var loaderScript = createScript("".concat(state2.config.paths.vs, "/loader.js"));
      loaderScript.onload = function() {
        return configureLoader2();
      };
      loaderScript.onerror = state2.reject;
      return loaderScript;
    }
    function configureLoader() {
      var state2 = getState(function(_ref3) {
        var config2 = _ref3.config, resolve = _ref3.resolve, reject = _ref3.reject;
        return {
          config: config2,
          resolve,
          reject
        };
      });
      var require2 = window.require;
      require2.config(state2.config);
      require2(["vs/editor/editor.main"], function(monaco) {
        storeMonacoInstance(monaco);
        state2.resolve(monaco);
      }, function(error) {
        state2.reject(error);
      });
    }
    function storeMonacoInstance(monaco) {
      if (!getState().monaco) {
        setState({
          monaco
        });
      }
    }
    function __getMonacoInstance() {
      return getState(function(_ref4) {
        var monaco = _ref4.monaco;
        return monaco;
      });
    }
    var wrapperPromise = new Promise(function(resolve, reject) {
      return setState({
        resolve,
        reject
      });
    });
    var loader2 = {
      config,
      init,
      __getMonacoInstance
    };
    exports.default = loader2;
  }
});

// node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/index.js
var require_cjs = __commonJS({
  "node_modules/.pnpm/@monaco-editor+loader@1.3.2_monaco-editor@0.34.0/node_modules/@monaco-editor/loader/lib/cjs/index.js"(exports) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    var index = require_loader();
    exports.default = index["default"];
  }
});

// srcts/index.ts
var import_loader = __toESM(require_cjs());

// srcts/utils.ts
var reload_preview = () => {
  const iframe = document.getElementById("preview_frame");
  if (iframe !== null) {
    iframe.contentWindow.location.reload();
  }
};
var send_editor_code = (editor) => {
  Shiny.setInputValue("quarto_code", editor.getValue());
};

// srcts/index.ts
import_loader.default.init().then((monaco) => {
  const wrapper = document.getElementById("app");
  const properties = {
    value: "# Heading 1",
    language: "markdown"
  };
  const editor = monaco.editor.create(wrapper, properties);
  document.addEventListener("keydown", (event) => {
    if (event.ctrlKey && event.key == "K") {
      send_editor_code(editor);
    }
  });
  Shiny.addCustomMessageHandler("knit", function(message) {
    send_editor_code(editor);
  });
  Shiny.addCustomMessageHandler("refresh_preview", (message) => {
    reload_preview();
  });
});
