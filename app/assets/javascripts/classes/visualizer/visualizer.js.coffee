class Wiggle.Classes.Visualizer
  constructor: (@$scope = $('body')) ->
    @url = @$scope.data('url')
    @loadUrl() if @url

  loadUrl: =>
    @$scope.append(JST['templates/loading_overlay']) # set spinner overlay
    @$scope.append(JST['templates/visualizer_frame']({content: "http://wiggleditor.herokuapp.com/proxy?url=#{@url}"}))

    @$scope.find('iframe').load =>
      $('.overlay').remove() # remove spinner
