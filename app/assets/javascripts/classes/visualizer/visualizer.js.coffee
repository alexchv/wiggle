class Wiggle.Classes.Visualizer
  constructor: (@$scope = $('body')) ->
    @url = @$scope.data('url')
    @loadUrl() if @url

  loadUrl: =>
    # set spinner
    @$scope.append(JST['templates/loading_overlay'])
    @$scope.append(JST['templates/visualizer_frame']({content: "http://wiggleditor.herokuapp.com/proxy?url=#{@url}"}))

    $('iframe').load =>
      # disable spinner
      $('.overlay').remove()
