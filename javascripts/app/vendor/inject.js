(function() {
  /*
  Inject
  Copyright 2011 LinkedIn
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
      http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an "AS
  IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
  express or implied.   See the License for the specific language
  governing permissions and limitations under the License.
  
  --------------------
  
  # Inject is Dependency Awesomeness #
  Some sample ways to use inject...
    var foo = require("moduleName");
    // -- or --
    require.ensure(["moduleOne", "moduleTwo", "moduleThree"], function(require, exports, module) {
      var foo = require("moduleOne");
    })
    // -- or --
    require.run("mySampleApplication")
  
  For more details, check out the github: https://github.com/linkedin/inject
  */
  /*
  Constants and Registries used
  */  var INJECT_VERSION, absolutePathRegex, addRule, analyzeFile, anonDefineStack, applyRules, basedir, clearCache, clearFileRegistry, commentRegex, commonJSFooter, commonJSHeader, context, createEvalScript, createIframe, createModule, db, define, defineStaticRequireRegex, dispatchTreeDownload, docHead, downloadTree, easyXDM, evalModule, executeFile, extractRequires, fileStorageToken, fileSuffix, funcCount, functionNewlineRegex, functionRegex, functionSpaceRegex, getFormattedPointcuts, getFunctionArgs, getXHR, hasLocalStorage, hostPrefixRegex, hostSuffixRegex, initializeExports, isIE, loadModules, lscacheSchemaVersion, manifest, namespace, oldError, onErrorOffset, pauseRequired, processCallbacks, relativePathRegex, require, requireGreedyCapture, requireRegex, reset, responseSlicer, schemaVersion, schemaVersionString, sendToIframe, sendToXhr, setCrossDomain, setExpires, setModuleRoot, socket, standardizeModuleId, stripBuiltIns, testScript, testScriptNode, treeNode, trimHost, undef, userConfig, userModules, _db;
  var __hasProp = Object.prototype.hasOwnProperty;
  INJECT_VERSION = "0.4.0-pre";
  isIE = eval("/*@cc_on!@*/false");
  hasLocalStorage = true;
  docHead = null;
  onErrorOffset = 0;
  funcCount = 0;
  userConfig = {};
  undef = undef;
  context = this;
  pauseRequired = false;
  _db = {};
  socket = null;
  fileStorageToken = "INJECT";
  schemaVersion = 1;
  schemaVersionString = "!version";
  namespace = "Inject";
  userModules = {};
  fileSuffix = /.*?\.(js|txt)(\?.*)?$/;
  hostPrefixRegex = /^https?:\/\//;
  hostSuffixRegex = /^(.*?)(\/.*|$)/;
  responseSlicer = /^(.+?)[\s]+([\w\W]+?)[\s]+([\w\W]+)$/m;
  /*
  Regexes to extract function identifiers, comments, require() statements, or requirements from a define() call
  */
  functionRegex = /^[\s\(]*function[^(]*\(([^)]*)\)/;
  functionNewlineRegex = /\/\/.*?[\r\n]|\/\*(?:.|[\r\n])*?\*\//g;
  functionSpaceRegex = /\s+/g;
  requireRegex = /(?:^|[^\w\$_.\(])require\s*\(\s*("[^"\\]*(?:\\.[^"\\]*)*"|'[^'\\]*(?:\\.[^'\\]*)*')\s*\)/g;
  defineStaticRequireRegex = /^[\r\n\s]*define\(\s*("\S+",|'\S+',|\s*)\s*\[([^\]]*)\],\s*(function\s*\(|{).+/;
  requireGreedyCapture = /require.*/;
  commentRegex = /(\/\*([\s\S]*?)\*\/|([^:]|^)\/\/(.*)$)/mg;
  relativePathRegex = /^(\.{1,2}\/).+/;
  absolutePathRegex = /^([A-Za-z]+:)?\/\//;
  /*
  localStorage compatibility test
  */
  hasLocalStorage = (function() {
    try {
      localStorage.setItem("injectLStest", "ok");
      localStorage.removeItem("injectLStest");
      return true;
    } catch (err) {
      return false;
    }
  })();
  /*
  lscache configuration
  sets up lscache to operate within the local scope
  */
  if (hasLocalStorage) {
    lscache.setBucket(fileStorageToken);
    lscacheSchemaVersion = lscache.get(schemaVersionString);
    if (lscacheSchemaVersion && lscacheSchemaVersion > 0 && lscacheSchemaVersion < schemaVersion) {
      lscache.flush();
      lscacheSchemaVersion = 0;
    }
    if (!lscacheSchemaVersion) {
      lscache.set(schemaVersionString, schemaVersion);
    }
  }
  /*
  easyxdm configuration
  */
  if (LOCAL_EASY_XDM && context.easyXDM) {
    easyXDM = context.easyXDM.noConflict("Inject");
  } else {
    easyXDM = false;
  }
  /*
  CommonJS wrappers for a header and footer
  these bookend the included code and insulate the scope so that it doesn't impact inject()
  or anything else.
  */
  commonJSHeader = '__INJECT_NS__.INTERNAL.execute.__FUNCTION_ID__ = function() {\n  with (window) {\n    var __module = __INJECT_NS__.INTERNAL.createModule("__MODULE_ID__", "__MODULE_URI__"),\n        __require = __INJECT_NS__.INTERNAL.require,\n        __exe = null;\n    __INJECT_NS__.INTERNAL.setModuleExports("__MODULE_ID__", __module.exports);\n    __exe = function(require, module, exports) {\n      __POINTCUT_BEFORE__';
  commonJSFooter = '    __POINTCUT_AFTER__\n  };\n  __INJECT_NS__.INTERNAL.defineAs(__module.id);\n  try {\n    __exe.call(__module, __require, __module, __module.exports);\n  }\n  catch (__EXCEPTION__) {\n    __module.error = __EXCEPTION__;\n  }\n  __INJECT_NS__.INTERNAL.undefineAs();\n  return __module;\n}\n};';
  createEvalScript = function(code) {
    var scr;
    if (!docHead) {
      docHead = document.getElementsByTagName("head")[0];
    }
    scr = document.createElement("script");
    try {
      scr.text = code;
    } catch (innerTextException) {
      try {
        scr.innerHTML = code;
      } catch (innerHTMLException) {
        return false;
      }
    }
    return scr;
  };
  /*
  Test the onError offset for debugging purposes
  Addresses the needs in #105 and #112
  */
  testScript = 'function Inject_Test_Known_Error() {\n  function nil() {}\n  nil("Known Syntax Error Line 3";\n}';
  testScriptNode = createEvalScript(testScript);
  oldError = context.onerror;
  context.onerror = function(err, where, line) {
    onErrorOffset = 3 - line;
    window.setTimeout(function() {
      return docHead.removeChild(testScriptNode);
    });
    return true;
  };
  docHead.appendChild(testScriptNode);
  context.onerror = oldError;
  db = {
    /*
      ## db{} ##
      this is the database for all registries and queues
      to reduce maintenance headaches, all accessing is done through this
      object, and not the _db object
      */
    "module": {
      /*
          ## db.module{} ##
          These functions manipulate the module registry
          */
      "create": function(moduleId) {
        /*
              ## create(moduleId) ##
              create a registry entry for tracking a module
              */        var registry;
        registry = _db.moduleRegistry;
        if (!registry[moduleId]) {
          return registry[moduleId] = {
            "failed": false,
            "exports": null,
            "path": null,
            "file": null,
            "amd": false,
            "loading": false,
            "executed": false,
            "rulesApplied": false,
            "requires": [],
            "exec": null,
            "pointcuts": {
              "before": [],
              "after": []
            }
          };
        }
      },
      "getExports": function(moduleId) {
        /*
              ## getExports(moduleId) ##
              get the exports for a given moduleId
              */        var registry, _ref, _ref2;
        registry = _db.moduleRegistry;
        if (db.module.getFailed(moduleId)) {
          return false;
        }
        if ((_ref = registry[moduleId]) != null ? _ref.exports : void 0) {
          return registry[moduleId].exports;
        }
        if ((_ref2 = registry[moduleId]) != null ? _ref2.exec : void 0) {
          registry[moduleId].exec();
          registry[moduleId].exec = null;
          return registry[moduleId].exports;
        }
        return false;
      },
      "setExports": function(moduleId, exports) {
        /*
              ## setExports(moduleId, exports) ##
              set the exports for moduleId
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].exports = exports;
      },
      "getPointcuts": function(moduleId) {
        /*
              ## getPointcuts(moduleId) ##
              get the pointcuts for a given moduleId
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.pointcuts : void 0) {
          return registry[moduleId].pointcuts;
        }
      },
      "setPointcuts": function(moduleId, pointcuts) {
        /*
              ## setPointcuts(moduleId, pointcuts) ##
              set the pointcuts for moduleId
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].pointcuts = pointcuts;
      },
      "getRequires": function(moduleId) {
        /*
              ## getRequires(moduleId) ##
              get the requires for a given moduleId found at runtime
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.requires : void 0) {
          return registry[moduleId].requires;
        }
      },
      "setRequires": function(moduleId, requires) {
        /*
              ## setRequires(moduleId, requires) ##
              set the runtime dependencies for moduleId
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].requires = requires;
      },
      "getRulesApplied": function(moduleId) {
        /*
              ## getRulesApplied(moduleId) ##
              get the status of the rulesApplied flag. It's set when it has passed through
              the rules queue
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.rulesApplied : void 0) {
          return registry[moduleId].rulesApplied;
        } else {
          return false;
        }
      },
      "setRulesApplied": function(moduleId, rulesApplied) {
        /*
              ## setRulesApplied(moduleId, rulesApplied) ##
              set the rules applied flag for moduleId once all rules have been applied
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].rulesApplied = rulesApplied;
      },
      "getPath": function(moduleId) {
        /*
              ## getPath(moduleId) ##
              get the resolved path for a given moduleId
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.path : void 0) {
          return registry[moduleId].path;
        } else {
          return false;
        }
      },
      "setPath": function(moduleId, path) {
        /*
              ## setPath(moduleId, path) ##
              set the path for moduleId
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].path = path;
      },
      "getFile": function(moduleId) {
        /*
              ## getFile(moduleId) ##
              get the file for a given moduleId. If it doesn't exist in the registry,
              look for the object in localStorage. Return false if no matches are found
              */        var file, path, registry, _ref;
        registry = _db.moduleRegistry;
        path = db.module.getPath(moduleId);
        if ((_ref = registry[moduleId]) != null ? _ref.file : void 0) {
          return registry[moduleId].file;
        }
        if (userConfig.fileExpires === 0) {
          return false;
        }
        if (hasLocalStorage) {
          file = lscache.get(path);
        }
        if (file && typeof file === "string" && file.length) {
          db.module.setFile(moduleId, file);
          return file;
        }
        return false;
      },
      "setFile": function(moduleId, file) {
        /*
              ## setFile(moduleId, file) ##
              set the file contents for moduleId, and update localStorage
              */        var path, registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        registry[moduleId].file = file;
        path = db.module.getPath(moduleId);
        if (hasLocalStorage) {
          return lscache.set(path, file, userConfig.fileExpires);
        }
      },
      "clearAllFiles": function() {
        /*
              ## clearAllFiles() ##
              remove all files from the registry. It sets them all back to an unloaded state
              */        var data, moduleId, registry, _results;
        registry = _db.moduleRegistry;
        _results = [];
        for (moduleId in registry) {
          if (!__hasProp.call(registry, moduleId)) continue;
          data = registry[moduleId];
          data.file = null;
          _results.push(data.loading = false);
        }
        return _results;
      },
      "getFailed": function(moduleId) {
        /*
              ## getFailed(moduleId) ##
              get the status of the failed flag. It's set when a module fails to load
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.failed : void 0) {
          return registry[moduleId].failed;
        } else {
          return false;
        }
      },
      "setFailed": function(moduleId, failed) {
        /*
              ## setFailed(moduleId, failed) ##
              get the status of the failed flag. It's set when a module fails to load
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].failed = failed;
      },
      "getCircular": function(moduleId) {
        /*
              ## getFailed(moduleId) ##
              get the status of the circular flag. It's set when a module has a circular dependency
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.circular : void 0) {
          return registry[moduleId].circular;
        } else {
          return false;
        }
      },
      "setCircular": function(moduleId, circular) {
        /*
              ## setFailed(moduleId, failed) ##
              get the status of the circular flag. It's set when a module has a circular dependency
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].circular = circular;
      },
      "getAmd": function(moduleId) {
        /*
              ## getAmd(moduleId) ##
              get the status of the amd flag. It's set when a module is defined use AMD
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.amd : void 0) {
          return registry[moduleId].amd;
        } else {
          return false;
        }
      },
      "setAmd": function(moduleId, isAmd) {
        /*
              ## setAmd(moduleId, isAmd) ##
              set the amd flag for moduleId, It's set when a module is defined use AMD
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].amd = isAmd;
      },
      "getLoading": function(moduleId) {
        /*
              ## getLoading(moduleId) ##
              get the status of the loading flag. It's set when an item begins download,
              and cleared when the download completes and the file is saved
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.loading : void 0) {
          return registry[moduleId].loading;
        } else {
          return false;
        }
      },
      "setLoading": function(moduleId, loading) {
        /*
              ## setLoading(moduleId, loading) ##
              set the loading flag for moduleId, It's set when an item begins download
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].loading = loading;
      },
      "getExecuted": function(moduleId) {
        /*
              ## getExecuted(moduleId) ##
              get the status of the executed flag. It's set when a module is evalled
              */        var registry, _ref;
        registry = _db.moduleRegistry;
        if ((_ref = registry[moduleId]) != null ? _ref.executed : void 0) {
          return registry[moduleId].executed;
        } else {
          return false;
        }
      },
      "setExecuted": function(moduleId, executed) {
        /*
              ## setExecuted(moduleId, executed) ##
              set the executed flag for moduleId, It's set when an item is evaled
              */        var registry;
        registry = _db.moduleRegistry;
        db.module.create(moduleId);
        return registry[moduleId].executed = executed;
      }
    },
    "txn": {
      /*
          ## db.txn{} ##
          These methods manipulate the transaction registry
          */
      "create": function() {
        /*
              ## create() ##
              Create a transaction so we can count outstanding requests
              */        var id;
        id = _db.transactionRegistryCounter++;
        _db.transactionRegistry[id] = 0;
        return id;
      },
      "add": function(txnId) {
        /*
              ## add(txnId) ##
              increment the counter for a given transaction id
              */        return _db.transactionRegistry[txnId]++;
      },
      "subtract": function(txnId) {
        /*
              ## subtract(txnId) ##
              decrement the counter for a given transaction id
              */        return _db.transactionRegistry[txnId]--;
      },
      "get": function(txnId) {
        /*
              ## get(txnId) ##
              Get the number of outstanding transactions for a given transaction id
              */        return _db.transactionRegistry[txnId];
      },
      "remove": function(txnId) {
        /*
              ## remove(txnId) ##
              Remove a transaction entry from the registry
              */        _db.transactionRegistry[txnId] = null;
        return delete _db.transactionRegistry[txnId];
      }
    },
    "queue": {
      "load": {
        /*
              ## db.queue.load{} ##
              these methods affect the load queue, tracking callback requests
              when loading is blocked for a cross domain iframe
              */
        "add": function(item) {
          return _db.loadQueue.push(item);
        },
        "get": function() {
          return _db.loadQueue;
        },
        "clear": function() {
          return _db.loadQueue = [];
        }
      },
      "rules": {
        /*
              ## db.queue.rules{} ##
              these methods affect the rules queue, tracking rules placed into
              the system via addRule(). Any time the rules are dirty, we sort them
              on get()
              */
        "add": function(item) {
          _db.rulesQueue.push(item);
          return _db.rulesQueueDirty = true;
        },
        "get": function() {
          if (_db.rulesQueueDirty) {
            _db.rulesQueueDirty = false;
            _db.rulesQueue.sort(function(a, b) {
              return b.weight - a.weight;
            });
          }
          return _db.rulesQueue;
        },
        "size": function() {
          return _db.rulesQueue.length;
        }
      },
      "file": {
        /*
              ## db.queue.file{} ##
              these methods affect the file queue, used for tracking pending callbacks
              when a file is being downloaded. It supports a clear() method to remove
              all pending callbacks after the queue has been ran.
              */
        "add": function(moduleId, item) {
          if (!_db.fileQueue[moduleId]) {
            !(_db.fileQueue[moduleId] = []);
          }
          return _db.fileQueue[moduleId].push(item);
        },
        "get": function(moduleId) {
          if (_db.fileQueue[moduleId]) {
            return _db.fileQueue[moduleId];
          } else {
            return [];
          }
        },
        "clear": function(moduleId) {
          if (_db.fileQueue[moduleId]) {
            return _db.fileQueue[moduleId] = [];
          }
        }
      },
      "amd": {
        /*
              ## db.queue.amd{} ##
              these methods affect the amd queue, used for tracking pending amd callbacks
              when a defined module file is being downloaded. It supports a clear() method to remove
              all pending callbacks after the queue has been ran.
              */
        "add": function(moduleId, item) {
          if (!_db.amdQueue[moduleId]) {
            !(_db.amdQueue[moduleId] = []);
          }
          return _db.amdQueue[moduleId].push(item);
        },
        "get": function(moduleId) {
          if (_db.amdQueue[moduleId]) {
            return _db.amdQueue[moduleId];
          } else {
            return [];
          }
        },
        "clear": function(moduleId) {
          if (_db.amdQueue[moduleId]) {
            return _db.amdQueue[moduleId] = [];
          }
        }
      },
      "define": {
        "add": function(moduleId) {
          return _db.defineQueue.unshift(moduleId);
        },
        "remove": function() {
          return _db.defineQueue.shift();
        },
        "peek": function() {
          return _db.defineQueue[0];
        }
      }
    }
  };
  treeNode = (function() {
    /*
      ## treeNode [class] ##
      _internal_ used for constructing the dependency tree
      once built, we can perform a post-order traversal which identifies
      the order we are supposed to execute our required files
      */    function treeNode(value) {
      /*
          ## constructor(value) ##
          set the value for the node, create null values for parent, left right
          */      this.value = value;
      this.children = [];
      this.parent = null;
      this.left = null;
      this.right = null;
    }
    treeNode.prototype.getValue = function() {
      /*
          ## getValue() ##
          get the value of the node
          */      return this.value;
    };
    treeNode.prototype.addChild = function(node) {
      /*
          ## addChild(node) ##
          add a child node to the existing tree. Creates left, right, and parent relationships
          */      var rightChild;
      if (this.children.length > 0) {
        rightChild = this.children[this.children.length - 1];
        node.setLeft(rightChild);
        rightChild.setRight(node);
      }
      this.children.push(node);
      return node.setParent(this);
    };
    treeNode.prototype.getChildren = function() {
      /*
          ## getChildren() ##
          get the children for the existing tree
          */      return this.children;
    };
    treeNode.prototype.setLeft = function(node) {
      /*
          ## setLeft(node) ##
          set the sibling to the left of this current node
          */      return this.left = node;
    };
    treeNode.prototype.getLeft = function() {
      /*
          ## getLeft() ##
          get the left / previous sibling
          */      return this.left;
    };
    treeNode.prototype.setRight = function(node) {
      /*
          ## setRight(node) ##
          set the sibling to the right of this current node
          */      return this.right = node;
    };
    treeNode.prototype.getRight = function() {
      /*
          ## getRight() ##
          get the right / next sibling
          */      return this.right;
    };
    treeNode.prototype.setParent = function(node) {
      /*
          ## setParent(node) ##
          set the parent of this node
          */      return this.parent = node;
    };
    treeNode.prototype.getParent = function() {
      /*
          ## getParent() ##
          get the parent of this node
          */      return this.parent;
    };
    treeNode.prototype.postOrder = function() {
      /*
          ## postOrder() ##
          Perform a post-order traversal of the tree, and return an array
          of the values. The order for post-order is left, right, parent
          */      var currentNode, direction, output, _results;
      output = [];
      currentNode = this;
      direction = null;
      _results = [];
      while (currentNode) {
        if (currentNode.getChildren().length > 0 && direction !== "up") {
          direction = "down";
          currentNode = currentNode.getChildren()[0];
          continue;
        }
        output.push(currentNode.getValue());
        if (currentNode.getRight()) {
          direction = "right";
          currentNode = currentNode.getRight();
          continue;
        }
        if (currentNode.getParent()) {
          direction = "up";
          currentNode = currentNode.getParent();
          continue;
        }
        return output;
      }
      return _results;
    };
    return treeNode;
  })();
  reset = function() {
    _db = {
      "moduleRegistry": {},
      "transactionRegistry": {},
      "transactionRegistryCounter": 0,
      "loadQueue": [],
      "rulesQueue": [],
      "fileQueue": [],
      "amdQueue": [],
      "defineQueue": []
    };
    return userConfig = {
      "moduleRoot": null,
      "fileExpires": 1440,
      "xd": {
        "inject": null,
        "xhr": null
      },
      "debug": {
        "sourceMap": false
      }
    };
  };
  reset();
  clearFileRegistry = function() {
    /*
      ## clearFileRegistry() ##
      _internal_ Clears the internal file registry
      clearing all local storage keys that relate to the fileStorageToken
      */    db.module.clearAllFiles();
    if (hasLocalStorage) {
      return lscache.flush();
    }
  };
  trimHost = function(host) {
    /*
      ## trimHost(host) ##
      _internal_ trims the host down to its essential values
      */    host = host.replace(hostPrefixRegex, "").replace(hostSuffixRegex, "$1");
    return host;
  };
  createIframe = function() {
    /*
      ## createIframe() ##
      _internal_ create an iframe to the xhr location
      */    var relayFile;
    relayFile = userConfig.xd.relayFile;
    relayFile += relayFile.indexOf("?") >= 0 ? "&" : "?";
    relayFile += "swf=" + userConfig.xd.relaySwf;
    return socket = new easyXDM.Socket({
      remote: relayFile,
      swf: userConfig.xd.relaySwf,
      onMessage: function(message, origin) {
        var pieces;
        if (typeof userConfig.moduleRoot === "string" && trimHost(origin) !== trimHost(userConfig.moduleRoot)) {
          return;
        }
        pieces = message.match(responseSlicer);
        return processCallbacks(pieces[1], pieces[2], pieces[3]);
      },
      onReady: function() {
        var item, queue, _i, _len, _results;
        pauseRequired = false;
        queue = db.queue.load.get();
        db.queue.load.clear();
        _results = [];
        for (_i = 0, _len = queue.length; _i < _len; _i++) {
          item = queue[_i];
          _results.push(item());
        }
        return _results;
      }
    });
  };
  getFormattedPointcuts = function(moduleId) {
    /*
      ## getFormattedPointcuts(moduleId) ##
      _internal_ get the [pointcuts](http://en.wikipedia.org/wiki/Pointcut) for a module if
      specified
      */    var afterCut, beforeCut, cut, cuts, definition, fn, noop, pointcuts, _i, _j, _len, _len2, _ref, _ref2;
    cuts = db.module.getPointcuts(moduleId);
    beforeCut = [";"];
    afterCut = [";"];
    _ref = cuts.before;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      cut = _ref[_i];
      beforeCut.push(cut.toString().match(/.*?\{([\w\W]*)\}/m)[1]);
    }
    _ref2 = cuts.after;
    for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
      cut = _ref2[_j];
      afterCut.push(cut.toString().match(/.*?\{([\w\W]*)\}/m)[1]);
    }
    beforeCut.push(";");
    afterCut.push(";");
    return {
      before: beforeCut.join(";\n"),
      after: afterCut.join(";\n")
    };
    noop = function() {};
    pointcuts = {
      'before': noop,
      'after': noop
    };
    if (!userModules[module]) {
      return pointcuts;
    }
    definition = userModules[module];
    for (cut in pointcuts) {
      fn = pointcuts[cut];
      if (definition[cut]) {
        pointcuts[cut] = definition[cut];
      }
    }
    return pointcuts;
  };
  dispatchTreeDownload = function(id, tree, node, callback) {
    /*
      ## dispatchTreeDownload(id, tree, node, callback) ##
      _internal_ this is used to decouple the execution of a subtree when in a loop
      It uses setTimeout() to fully decouple the item, and yield to the page which
      may be doing other tasks. When all children have completed, callback() is
      invoked
      */    var afterDownload;
    tree.addChild(node);
    db.txn.add(id);
    afterDownload = function() {
      var moduleId;
      db.txn.subtract(id);
      if (db.txn.get(id) === 0) {
        db.txn.remove(id);
        moduleId = node.getValue();
        if (db.module.getAmd(moduleId) && db.module.getLoading(moduleId)) {
          return db.queue.amd.add(moduleId, callback);
        } else {
          return callback();
        }
      }
    };
    if (db.module.getLoading(node.getValue()) === false) {
      return context.setTimeout(function() {
        return downloadTree(node, afterDownload);
      });
    } else {
      return db.queue.file.add(node.getValue(), afterDownload);
    }
  };
  loadModules = function(modList, callback) {
    /*
      ## loadModules(modList, callback) ##
      _internal_ load a collection of modules in modList, and once they have all loaded, execute the callback cb
      */    var execute, id, moduleId, node, outstandingAMDModules, tree, _i, _len, _results;
    if (modList.length === 0) {
      context.setTimeout(function() {
        return callback.apply(context, []);
      });
      return;
    }
    tree = new treeNode(null);
    id = db.txn.create();
    outstandingAMDModules = 0;
    execute = function() {
      var amdComplete, executionOrder, moduleId, _i, _len;
      amdComplete = function() {
        var exports, moduleId, _i, _len;
        exports = [];
        for (_i = 0, _len = modList.length; _i < _len; _i++) {
          moduleId = modList[_i];
          exports.push(db.module.getExports(moduleId));
        }
        return callback.apply(context, exports);
      };
      executionOrder = tree.postOrder();
      for (_i = 0, _len = executionOrder.length; _i < _len; _i++) {
        moduleId = executionOrder[_i];
        if (moduleId === null) {
          continue;
        }
        executeFile(moduleId);
        if (db.module.getAmd(moduleId) && db.module.getLoading(moduleId)) {
          outstandingAMDModules++;
          db.queue.amd.add(moduleId, function() {
            if (--outstandingAMDModules === 0) {
              return amdComplete();
            }
          });
        }
      }
      if (outstandingAMDModules === 0) {
        return amdComplete();
      }
    };
    _results = [];
    for (_i = 0, _len = modList.length; _i < _len; _i++) {
      moduleId = modList[_i];
      moduleId = standardizeModuleId(moduleId);
      node = new treeNode(moduleId);
      _results.push(dispatchTreeDownload(id, tree, node, execute));
    }
    return _results;
  };
  downloadTree = function(tree, callback) {
    /*
      ## downloadTree(tree, callback) ##
      download the current item and its dependencies, storing the results in a tree
      when all items have finished loading, invoke callback()
      */    var download, file, moduleId, onDownloadComplete, relativePath;
    moduleId = tree.getValue();
    if (db.module.getRulesApplied() === false) {
      if (relativePathRegex.test(moduleId)) {
        relativePath = userConfig.moduleRoot;
        if (tree.getParent() && tree.getParent().getValue()) {
          relativePath = db.module.getPath(tree.getParent().getValue());
        }
        applyRules(moduleId, true, relativePath);
      } else {
        applyRules(moduleId, true);
      }
    }
    onDownloadComplete = function(moduleId, file) {
      var id, node, processCallback, req, requires, _i, _len;
      db.module.setFile(moduleId, file);
      if (file) {
        analyzeFile(moduleId, tree);
        requires = db.module.getRequires(moduleId);
      } else {
        requires = [];
      }
      processCallback = function(id, cb) {
        if (db.module.getAmd(id) && db.module.getLoading(id)) {
          return db.queue.amd.add(id, function() {
            return context.setTimeout(cb);
          });
        } else {
          return context.setTimeout(cb);
        }
      };
      if (requires.length > 0) {
        id = db.txn.create();
        for (_i = 0, _len = requires.length; _i < _len; _i++) {
          req = requires[_i];
          node = new treeNode(req);
          dispatchTreeDownload(id, tree, node, callback);
        }
        if (db.txn.get(id) === 0) {
          db.txn.remove(id);
          return processCallback(moduleId, callback);
        }
      } else {
        return processCallback(moduleId, callback);
      }
    };
    download = function() {
      db.module.setLoading(moduleId, true);
      if (userConfig.xd.relayFile) {
        return sendToIframe(moduleId, processCallbacks);
      } else {
        return sendToXhr(moduleId, processCallbacks);
      }
    };
    if (db.module.getExports(moduleId)) {
      return callback();
    }
    db.queue.file.add(moduleId, onDownloadComplete);
    if (db.module.getLoading(moduleId)) {
      return;
    }
    file = db.module.getFile(moduleId);
    if (file && file.length > 0) {
      return processCallbacks(200, moduleId, file);
    } else {
      return download();
    }
  };
  processCallbacks = function(status, moduleId, file) {
    /*
      ## processCallbacks(moduleId, file) ##
      _internal_ given a module ID and file, disable the loading flag for the module
      then locate all callbacks that have been queued- dispatch them
      */    var cb, cbs, _i, _len, _results;
    if (1 * status !== 200) {
      file = false;
      db.module.setFailed(moduleId, true);
    }
    if (db.module.getAmd(moduleId) === false) {
      db.module.setLoading(moduleId, false);
    }
    cbs = db.queue.file.get(moduleId);
    db.queue.file.clear(moduleId);
    _results = [];
    for (_i = 0, _len = cbs.length; _i < _len; _i++) {
      cb = cbs[_i];
      _results.push(cb(moduleId, file));
    }
    return _results;
  };
  extractRequires = function(file) {
    var match, reqs, require, requires, staticReq, staticReqs, uniques, _i, _len;
    requires = [];
    uniques = {};
    require = function(item) {
      if (uniques[item] !== true) {
        requires.push(item);
      }
      return uniques[item] = true;
    };
    reqs = [];
    file = file.replace(commentRegex, "");
    while ((match = requireRegex.exec(file))) {
      reqs.push(match[0].match(requireGreedyCapture)[0]);
    }
    if ((reqs != null ? reqs.length : void 0) > 0) {
      try {
        eval(reqs.join(";"));
      } catch (err) {
        if (typeof console !== "undefined" && console !== null) {
          console.log("Invalid require() syntax found in file: " + reqs.join(";"));
        }
        throw err;
      }
    }
    staticReqs = [];
    if (defineStaticRequireRegex.exec(file)) {
      staticReqs = defineStaticRequireRegex.exec(file)[2].replace(/\s|"|'|require|exports|module/g, '').split(',');
    }
    for (_i = 0, _len = staticReqs.length; _i < _len; _i++) {
      staticReq = staticReqs[_i];
      if (uniques[staticReq] !== true && staticReq !== '') {
        requires.push(staticReq);
      }
      uniques[staticReq] = true;
    }
    return requires;
  };
  analyzeFile = function(moduleId, tree) {
    /*
      ## analyzeFile(moduleId) ##
      _internal_ scan a module's file for dependencies and record them
      */    var hasCircular, parent, req, reqs, safeRequires, unsafeRequires, _i, _len;
    reqs = extractRequires(db.module.getFile(moduleId));
    unsafeRequires = {};
    safeRequires = [];
    hasCircular = false;
    parent = tree;
    while (parent = parent.getParent()) {
      if (parent.getValue()) {
        unsafeRequires[parent.getValue()] = true;
      }
    }
    for (_i = 0, _len = reqs.length; _i < _len; _i++) {
      req = reqs[_i];
      if (unsafeRequires[req] !== true) {
        safeRequires.push(req);
      } else {
        hasCircular = true;
        db.module.setCircular(req, true);
      }
    }
    db.module.setRequires(moduleId, safeRequires);
    return db.module.setCircular(moduleId, hasCircular);
  };
  applyRules = function(moduleId, save, relativePath) {
    /*
      ## applyRules(moduleId) ##
      _internal_ normalize the path based on the module collection or any functions
      associated with its identifier
      */    var isMatch, pointcuts, rule, workingPath, _i, _len, _ref, _ref2, _ref3;
    workingPath = moduleId;
    pointcuts = {
      before: [],
      after: []
    };
    _ref = db.queue.rules.get();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      rule = _ref[_i];
      isMatch = typeof rule.key === "string" ? rule.key.toLowerCase() === workingPath.toLowerCase() : rule.key.test(workingPath);
      if (isMatch === false) {
        continue;
      }
      workingPath = typeof rule.path === "string" ? rule.path : rule.path(workingPath);
      if (rule != null ? (_ref2 = rule.pointcuts) != null ? _ref2.before : void 0 : void 0) {
        pointcuts.before.push(rule.pointcuts.before);
      }
      if (rule != null ? (_ref3 = rule.pointcuts) != null ? _ref3.after : void 0 : void 0) {
        pointcuts.after.push(rule.pointcuts.after);
      }
    }
    if (!absolutePathRegex.test(workingPath)) {
      if (workingPath.indexOf("/") !== 0) {
        if (typeof userConfig.moduleRoot === "undefined") {
          throw new Error("Module Root must be defined");
        } else if (typeof userConfig.moduleRoot === "string") {
          workingPath = "" + userConfig.moduleRoot + workingPath;
        } else if (typeof userConfig.moduleRoot === "function") {
          workingPath = userConfig.moduleRoot(workingPath);
        }
      }
      if (typeof relativePath === "string") {
        workingPath = basedir(relativePath) + moduleId;
      }
    }
    if (!fileSuffix.test(workingPath)) {
      workingPath = "" + workingPath + ".js";
    }
    if (save === true) {
      db.module.setPath(moduleId, workingPath);
      db.module.setPointcuts(moduleId, pointcuts);
      return db.module.setRulesApplied(moduleId, true);
    } else if (save === false) {
      return {
        path: workingPath,
        pointcuts: pointcuts
      };
    }
  };
  anonDefineStack = [];
  executeFile = function(moduleId) {
    /*
      ## executeFile(moduleId) ##
      _internal_ attempts to execute a file with a CommonJS scope
      and store the exports
      */    var cuts, footer, functionId, header, module, path, requiredModuleId, runCmd, runHeader, text, _i, _len, _ref;
    if (db.module.getExecuted(moduleId)) {
      return;
    }
    db.module.setExecuted(moduleId, true);
    anonDefineStack.unshift(moduleId);
    _ref = db.module.getRequires(moduleId);
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      requiredModuleId = _ref[_i];
      executeFile(requiredModuleId);
    }
    cuts = getFormattedPointcuts(moduleId);
    path = db.module.getPath(moduleId);
    text = db.module.getFile(moduleId);
    functionId = "exec" + (funcCount++);
    header = commonJSHeader.replace(/__MODULE_ID__/g, moduleId).replace(/__MODULE_URI__/g, path).replace(/__FUNCTION_ID__/g, functionId).replace(/__INJECT_NS__/g, namespace).replace(/__POINTCUT_BEFORE__/g, cuts.before);
    footer = commonJSFooter.replace(/__INJECT_NS__/g, namespace).replace(/__POINTCUT_AFTER__/g, cuts.after);
    runHeader = header + "\n";
    runCmd = [runHeader, text, ";", footer].join("\n");
    module = evalModule({
      moduleId: moduleId,
      cmd: runCmd,
      url: path,
      functionId: functionId,
      preamble: header,
      originalCode: text
    });
    return db.module.setExports(module.id, module.exports);
  };
  evalModule = function(options) {
    /*
      ## evalModule(moduleId, callback) ##
      _internal_ eval js module code, also try to get error line number from orignal file
      Webkit: we can use window.onerror() safely. Line - preamble gives us the correct line
      Firefox: we need to subtract inject.js up until the onerror call
      */    var actualErrorLine, code, errorObject, functionId, getLineNumberFromException, message, module, moduleId, newError, originalCode, preamble, preambleLines, scr, sourceString, toExec, url, _ref;
    moduleId = options.moduleId;
    code = options.cmd;
    url = options.url;
    functionId = options.functionId;
    preamble = options.preamble;
    originalCode = options.originalCode;
    oldError = context.onerror;
    errorObject = null;
    preambleLines = preamble.split(/\n/).length + 1;
    newError = function(err, where, line) {
      var actualErrorLine, linesOfCode, message, originalLinesOfCode;
      actualErrorLine = onErrorOffset - preambleLines + line;
      linesOfCode = code.split("\n").length;
      originalLinesOfCode = originalCode.split("\n").length;
      if (line === linesOfCode) {
        actualErrorLine = originalLinesOfCode;
      }
      message = "Parse error in " + moduleId + " (" + url + ") on line " + actualErrorLine + ":\n  " + err;
      errorObject = new Error(message);
      return true;
    };
    getLineNumberFromException = function(e) {
      var lines, phrases;
      if (typeof e.lineNumber !== "undefined" && e.lineNumber !== null) {
        return e.lineNumber;
      }
      if (e.stack) {
        lines = e.stack.split("\n");
        phrases = lines[1].split(":");
        return parseInt(phrases[phrases.length - 2], 10);
      }
      return 0;
    };
    context.onerror = newError;
    scr = createEvalScript(code);
    if (scr) {
      docHead.appendChild(scr);
      window.setTimeout(function() {
        return docHead.removeChild(scr);
      });
    }
    if (!errorObject) {
      if (isIE || userConfig.debug.sourceMap) {
        sourceString = isIE ? "" : "//@ sourceURL=" + url;
        toExec = ["(", Inject.INTERNAL.execute[functionId].toString(), ")()"].join("");
        toExec = [toExec, sourceString].join("\n");
        module = eval(toExec);
      } else {
        module = Inject.INTERNAL.execute[functionId]();
      }
      if (module.error) {
        actualErrorLine = onErrorOffset - preambleLines + getLineNumberFromException(module.error);
        message = "Parse error in " + moduleId + " (" + url + ") on line " + actualErrorLine + ":\n  " + module.error.message;
        errorObject = new Error(message);
      }
    }
    context.onerror = oldError;
    if (typeof Inject !== "undefined" && Inject !== null ? (_ref = Inject.INTERNAL) != null ? _ref.execute[functionId] : void 0 : void 0) {
      delete Inject.INTERNAL.execute[functionId];
    }
    if (errorObject) {
      clearCache();
      throw errorObject;
    }
    return module;
  };
  sendToXhr = function(moduleId, callback) {
    /*
      ## sendToXhr(moduleId, callback) ##
      _internal_ request a module at path using xmlHttpRequest. On retrieval, fire off cb
      */    var path, xhr;
    path = db.module.getPath(moduleId);
    xhr = getXHR();
    xhr.open("GET", path);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        return callback.call(context, xhr.status, moduleId, xhr.responseText);
      }
    };
    return xhr.send(null);
  };
  sendToIframe = function(moduleId, callback) {
    /*
      ## sendToIframe(txId, module, path, cb) ##
      _internal_ request a module at path using easyXDM + iframe. On retrieval, the cb will be fired
      */    var path;
    path = db.module.getPath(moduleId);
    return socket.postMessage("" + moduleId + " " + path);
  };
  getFunctionArgs = function(fn) {
    var names;
    names = fn.toString().match(functionRegex)[1].replace(functionNewlineRegex, '').replace(functionSpaceRegex, '').split(',');
    if (names.length === 1 && !names[0]) {
      return [];
    } else {
      return names;
    }
  };
  /*
  function argumentNames(fn) {
    var names = fn.toString().match(/^[\s\(]*function[^(]*\(([^)]*)\)/)[1]
      .replace(/\/\/.*?[\r\n]|\/\*(?:.|[\r\n])*?\*\//g, '')
      .replace(/\s+/g, '').split(',');
    return names.length == 1 && !names[0] ? [] : names;
  }
  */
  getXHR = function() {
    /*
      ## getXHR() ##
      _internal_ get an XMLHttpRequest object
      */    var xmlhttp;
    xmlhttp = false;
    if (typeof XMLHttpRequest !== "undefined") {
      try {
        xmlhttp = new XMLHttpRequest();
      } catch (errorWin) {
        xmlhttp = false;
      }
    }
    if (!xmlhttp && typeof window.createRequest !== "undefined") {
      try {
        xmlhttp = new window.createRequest();
      } catch (errorCr) {
        xmlhttp = false;
      }
    }
    if (!xmlhttp) {
      try {
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
      } catch (msErrOne) {
        try {
          xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (msErrTwo) {
          xmlhttp = false;
        }
      }
    }
    if (!xmlhttp) {
      throw new Error("Could not create an xmlHttpRequest Object");
    }
    return xmlhttp;
  };
  initializeExports = function(moduleId) {
    var newExports;
    if (db.module.getExports(moduleId) !== false) {
      return;
    }
    newExports = {
      __inject_circular__: true
    };
    return db.module.setExports(moduleId, newExports);
  };
  createModule = function(id, uri, exports) {
    var module;
    module = {};
    module["id"] = id || null;
    module["uri"] = uri || null;
    module["exports"] = exports || db.module.getExports(id) || {};
    module["error"] = null;
    module["setExports"] = function(xobj) {
      var name, _i, _len, _ref;
      _ref = module["exports"];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        name = _ref[_i];
        throw new Error("cannot setExports when exports have already been set");
      }
      module["exports"] = xobj;
      return module["exports"];
    };
    return module;
  };
  basedir = function(path) {
    if (path.lastIndexOf("/") !== -1) {
      path = path.substring(0, path.lastIndexOf("/") + 1);
    }
    return path;
  };
  standardizeModuleId = function(moduleId) {
    var rule, _i, _len, _ref;
    _ref = db.queue.rules.get();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      rule = _ref[_i];
      if (typeof rule.path === "string" && rule.path.replace(/.js$/i, '') === moduleId) {
        moduleId = rule.key;
      }
    }
    return moduleId;
  };
  stripBuiltIns = function(modules) {
    var mId, strippedModuleList, _i, _len;
    strippedModuleList = [];
    for (_i = 0, _len = modules.length; _i < _len; _i++) {
      mId = modules[_i];
      if (mId !== "require" && mId !== "exports" && mId !== "module") {
        strippedModuleList.push(mId);
      }
    }
    return strippedModuleList;
  };
  setModuleRoot = function(root) {
    /*
      ## setModuleRoot(root) ##
      set the base path for including your modules. This is used as the default if no
      items in the manifest can be located.
    
      Optionally, you can set root to a function. The return value of that function will
      be used instead. This can allow for very complex module configurations and branching
      with multiple CDNs such as in a complex production environment.
      */    if (typeof root === "string" && root.lastIndexOf("/") !== root.length) {
      root = "" + root + "/";
    }
    if (typeof root === "string") {
      if (root.indexOf("/") === 0) {
        root = "" + location.protocol + "//" + location.host + root;
      } else if (root.indexOf(".") === 0) {
        root = "" + location.protocol + "//" + location.host + "/" + root;
      }
    }
    return userConfig.moduleRoot = root;
  };
  setExpires = function(expires) {
    /*
      ## setExpires(expires) ##
      Set the time in seconds that files will persist in localStorage. Setting to 0 will disable
      localstorage caching.
      */    return userConfig.fileExpires = expires;
  };
  setCrossDomain = function(options) {
    /*
      ## setCrossDomain(local, remote) ##
      Set a pair of URLs to relay files. You must have two relay files in your cross domain setup:
    
      * one relay file (relay.html) on the domain where you are hosting your modules
      * one relay file (name.html) on the domain where you are hosting your modules
      * one relay file (local) on the same domain as the page hosting Inject
      * one relay file (remote) on the domain where you are hosting your root from setModuleRoot()
    
      The same require.setCrossDomain statement should be added to BOTH your relay.html files.
      */    userConfig.xd.relayFile = options.relayFile;
    userConfig.xd.relayHelper = options.relayHelper;
    userConfig.xd.hash = options.hash || false;
    return userConfig.xd.relaySwf = options.relaySwf || null;
  };
  clearCache = function() {
    /*
      ## clearCache() ##
      Remove the localStorage class at version. If no version is specified, the entire cache is cleared.
      */    return clearFileRegistry();
  };
  manifest = function(manifest) {
    /*
      ## manifest(manifest) ##
      Provide a custom manifest for Inject. This maps module names to file paths, adds pointcuts, and more.
      The key is always the module name, and then inside of that key can be either
    
      * a String (the path that will be used for resolving that module)
      * an Object containing
      ** path (String or Function) a path to use for the module, behaves like setModuleRoot()
      ** pointcuts (Object) a set of Aspect Oriented functions to run before and after the function.
    
      The pointcuts are a unique solution that allows you to require() things like jQuery. A pointcut could,
      for example add an after() method which sets exports.$ to jQuery.noConflict(). This would restore the
      window to its unpoluted state and make jQuery actionable as a commonJS module without having to alter
      the original library.
      */    var item, ruleSet, rules, _results;
    _results = [];
    for (item in manifest) {
      if (!__hasProp.call(manifest, item)) continue;
      rules = manifest[item];
      ruleSet = {
        path: rules.path || rules || null,
        pointcuts: {
          before: rules.before || null,
          after: rules.after || null
        }
      };
      _results.push(addRule(item, ruleSet));
    }
    return _results;
  };
  addRule = function(match, weight, ruleSet) {
    var usePath;
    if (weight == null) {
      weight = null;
    }
    if (ruleSet == null) {
      ruleSet = null;
    }
    /*
      ## require.addRule(match, [weight], ruleset) ##
      Add a rule that matches the given match, and apply ruleset to it
      * match: a regex or string to match against
      * weight: [optional] a numeric weight. Higher numbered weights run later
      * ruleset: a string containing a 1:1 replacement for match, or an object literal that
        contains path or pointcuts information
      */
    if (ruleSet === null) {
      ruleSet = weight;
      weight = db.queue.rules.size();
    }
    if (typeof ruleSet === "string") {
      usePath = ruleSet;
      ruleSet = {
        path: usePath
      };
    }
    return db.queue.rules.add({
      key: match,
      weight: weight,
      pointcuts: ruleSet.pointcuts || null,
      path: ruleSet.path || null
    });
  };
  /*
  Main Payloads: require, require.ensure, etc
  */
  require = function(moduleId, callback) {
    var exports, isCircular, strippedModuleList;
    if (callback == null) {
      callback = function() {};
    }
    /*
      ## require(moduleId, [callback]) ##
      Return the value of a module. This is a synchronous call, meaning the module needs
      to have already been loaded. If you are unsure about the module's existence, you
      should be using require.ensure() instead. For modules beyond the first tier, their
      shallow dependencies are resolved and block, so there is no need for require.ensure()
      beyond the topmost level.
      
      require() also supports an array + function syntax, which creates compliance with the
      AMD specification.
      */
    if (Object.prototype.toString.call(moduleId) === "[object Array]") {
      strippedModuleList = stripBuiltIns(moduleId);
      require.ensure(strippedModuleList, function(require, module, exports) {
        var args, mId, _i, _len;
        args = [];
        for (_i = 0, _len = moduleId.length; _i < _len; _i++) {
          mId = moduleId[_i];
          switch (mId) {
            case "require":
              args.push(require);
              break;
            case "exports":
              args.push(exports);
              break;
            case "module":
              args.push(module);
              break;
            default:
              args.push(require(mId));
          }
        }
        return callback.apply(context, args);
      });
      return;
    }
    moduleId = standardizeModuleId(moduleId);
    exports = db.module.getExports(moduleId);
    isCircular = db.module.getCircular(moduleId);
    if (exports === false && isCircular === false) {
      throw new Error("" + moduleId + " not loaded");
    }
    if (isCircular === true) {
      initializeExports(moduleId);
      exports = db.module.getExports(moduleId);
    }
    return exports;
  };
  require.run = function(moduleId) {
    /*
      ## require.run(moduleId) ##
      Try to getFile for moduleId, if the file exists, execute the file, if not, load this file and run it
      */    moduleId = standardizeModuleId(moduleId);
    if (db.module.getFile(moduleId) === false) {
      return require.ensure([moduleId], function() {});
    } else {
      db.module.setExports(moduleId, null);
      return executeFile(moduleId);
    }
  };
  require.ensure = function(moduleList, callback) {
    /*
      ## require.ensure(moduleList, callback) ##
      Ensure the modules in moduleList (array) are loaded, and then execute callback
      (function). Use this instead of require() when you need to load shallow dependencies
      first.
      */    var ensureExecutionCallback, run;
    if (!(moduleList instanceof Array)) {
      throw new Error("moduleList is not an Array");
    }
    moduleList = stripBuiltIns(moduleList);
    if ((userConfig.xd.relayFile != null) && !socket && !pauseRequired) {
      createIframe();
      pauseRequired = true;
    }
    ensureExecutionCallback = function() {
      var exports, module;
      module = createModule();
      exports = module.exports;
      return callback.call(context, Inject.INTERNAL.require, module, exports);
    };
    run = function() {
      return loadModules(moduleList, ensureExecutionCallback);
    };
    if (pauseRequired) {
      return db.queue.load.add(run);
    } else {
      return run();
    }
  };
  require.toUrl = function(moduleId) {
    /*
      ## require.toUrl(moduleId) ##
      Convert a module ID to URL for AMD compliance
      */    return applyRules(moduleId, false).path;
  };
  define = function(moduleId, deps, callback) {
    var afterLoadModules, allDeps, depId, module, outstandingAMDModules, _i, _len;
    if (typeof moduleId !== "string") {
      callback = deps;
      deps = moduleId;
      moduleId = null || db.queue.define.peek();
    }
    module = createModule(moduleId);
    if (Object.prototype.toString.call(deps) !== "[object Array]") {
      callback = deps;
      deps = ["require", "exports", "module"];
    }
    db.module.setAmd(moduleId, true);
    db.module.setLoading(moduleId, true);
    allDeps = db.module.getRequires(moduleId);
    afterLoadModules = function() {
      var amdCallback, amdCallbackQueue, args, dep, exportsSet, item, returnValue, value, _i, _j, _len, _len2, _ref;
      if (typeof callback === "function") {
        args = [];
        for (_i = 0, _len = deps.length; _i < _len; _i++) {
          dep = deps[_i];
          switch (dep) {
            case "require":
              args.push(Inject.INTERNAL.require);
              break;
            case "exports":
              args.push(module.exports);
              break;
            case "module":
              args.push(module);
              break;
            default:
              args.push(require(dep));
          }
        }
        returnValue = callback.apply(context, args);
        exportsSet = false;
        if (typeof module.exports === "function") {
          exportsSet = true;
        } else {
          _ref = module.exports;
          for (item in _ref) {
            if (!__hasProp.call(_ref, item)) continue;
            value = _ref[item];
            exportsSet = true;
            break;
          }
        }
        if (exportsSet === false) {
          module.setExports(returnValue);
        }
      } else {
        module.setExports(callback);
      }
      db.module.setExports(moduleId, module.exports);
      db.module.setExecuted(moduleId, true);
      db.module.setLoading(moduleId, false);
      amdCallbackQueue = db.queue.amd.get(moduleId);
      for (_j = 0, _len2 = amdCallbackQueue.length; _j < _len2; _j++) {
        amdCallback = amdCallbackQueue[_j];
        amdCallback();
      }
      return db.queue.amd.clear(moduleId);
    };
    outstandingAMDModules = 0;
    for (_i = 0, _len = allDeps.length; _i < _len; _i++) {
      depId = allDeps[_i];
      if (db.module.getAmd(depId) && db.module.getLoading(depId)) {
        outstandingAMDModules++;
        db.queue.amd.add(depId, function() {
          if (--outstandingAMDModules === 0) {
            return afterLoadModules();
          }
        });
      }
    }
    return loadModules(allDeps, afterLoadModules);
  };
  define['amd'] = {};
  context['require'] = require;
  context['define'] = define;
  context['Inject'] = {
    'INTERNAL': {
      'defineAs': function(moduleId) {
        return db.queue.define.add(moduleId);
      },
      'undefineAs': function() {
        return db.queue.define.remove();
      },
      'createModule': createModule,
      'setModuleExports': function(moduleId, exports) {
        return db.module.setExports(moduleId, exports);
      },
      'require': require,
      'define': define,
      'execute': {}
    },
    'easyXDM': easyXDM,
    'reset': reset,
    'enableDebug': function(key, value) {
      if (value == null) {
        value = true;
      }
      return userConfig.debug[key] = value;
    },
    'toUrl': function(moduleId) {
      return require.toUrl(moduleId);
    },
    'setModuleRoot': setModuleRoot,
    'setExpires': setExpires,
    'setCrossDomain': setCrossDomain,
    'clearCache': clearCache,
    'manifest': manifest,
    'addRule': addRule,
    'version': INJECT_VERSION
  };
}).call(this);
