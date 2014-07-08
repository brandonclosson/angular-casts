App.controller "ScreencastsCtrl", ['$scope', 'Screencast', ($scope, Screencast) ->
  $scope.screencasts = Screencast.query()
  $scope.selectedScreencast = null

  $scope.showScreencast = (screencast) ->
    $scope.selectedScreencast = screencast
]