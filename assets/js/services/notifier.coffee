require "../../vendor/angular-growl/angular-growl"


module = angular.module "plunker.service.notifier", [
  "angular-growl"
]

module.config ["growlProvider", (growlProvider) ->
    growlProvider.globalTimeToLive(3000)
]

module.factory "notifier", ["growl", (growl) ->
  error: (message) ->
    console.log "[ERR]", arguments...
    growl.addErrorMessage message
  warn: (message) ->
    console.log "[WARN]", arguments...
    growl.addWarnMessage message
  success: (message) ->
    console.log "[OK]", arguments...
    growl.addSuccessMessage message
]