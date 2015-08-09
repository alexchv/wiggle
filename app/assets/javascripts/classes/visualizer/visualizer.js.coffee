class Wiggle.Classes.Visualizer
  constructor: (@$scope = $('body')) ->
    @url = @$scope.data('url')
    @loadUrl() if @url
    @bindModalEventListner()

  loadUrl: =>
    @$scope.append(JST['templates/loading_overlay']) # set spinner overlay
    @$scope.append(JST['templates/visualizer_frame']({content: "http://wiggleditor.herokuapp.com/proxy?url=#{@url}"}))
#    @$scope.append(JST['templates/visualizer_frame']({content: "http://localhost:3000/proxy?url=#{@url}"}))

    @$scope.find('iframe').load =>
      $('.overlay').remove() # remove spinner

  bindModalEventListner: =>
    receiveMessage = (event) ->
      if event.origin == 'http://wiggle-beta.herokuapp.com'

        console.log event.data.element_tag
        console.log event.data.element_id
        console.log event.data.element_classes

        return unless event.data.element

        $.ajax(
          type : 'GET'
          url  : "/frame_modal"
          data:
            el_tag: event.data.element_tag
            el_id: event.data.element_id
            el_classes: event.data.element_classes
        ).done( (result) =>
#          console.log '====='
#          console.log result
#          console.log '====='

          window.lazyModal = BootstrapDialog.show
            cssClass: 'wiggle-animation-modal'
#            title: '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>'
            title: ''
            message: $(result)

        ).fail( =>

        ).always( =>

        )

    window.addEventListener 'message', receiveMessage, false
