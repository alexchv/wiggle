window.Wiggle         ||= {}
window.Wiggle.Classes ||= {}

class Wiggle.Application

  start: ->
    NProgress.configure({'showSpinner': false})

    $(document).on 'page:change', =>
#      @initializeAllPlugins()
      @initializeConfirmModal()
      @bindClasses()
#      @testProxy()

  testProxy: =>
#    jqxhr = $.ajax("http://wiggleditor.herokuapp.com/proxy?url=http://amazon.com"
#    ).done( (data, textStatus, jqXHR) =>
#      console.log textStatus

      # set spinner
      $('#frame-container').append(JST['templates/loading_overlay'])

      $('#frame-container').append(JST['templates/visualizer_frame']({content: "http://wiggleditor.herokuapp.com/proxy?url=http://rambler.ru"}))


#      $('iframe').contents().find('body').html($(data))

      $('iframe').load =>
        # disable spinner
        console.log 123
#        $('.overlay').remove()
#      $('iframe').contents().find('html').html(data)

#    ).fail( (jqXHR, textStatus, errorThrown) =>
#      console.log errorThrown
#    )

  initializeAllPlugins: =>
    console.log 'init plugins'

  bindClasses: ($parent = $('body')) =>
    $parent.find("[data-class-binder]").each (k, el) =>
      $.each $(el).data("classBinder").split(" "), (index, className) =>
        unless $(el).hasClass(className)
          new Wiggle.Classes[className]($(el))
          $(el).addClass(className)

  initializeConfirmModal: ->
    $.rails.allowAction = (link) ->
      return true unless link.is("[data-confirm]")
      BootstrapDialog.show
        type: BootstrapDialog.TYPE_DANGER
        title:  'Action confirm'
        message: link.attr("data-confirm")
        buttons: [
          {
            label: 'Cancel'
            action: (dialogRef) ->
              dialogRef.close()
              return
          }
          {
            label: 'Ok'
            cssClass: "btn-primary"
            action: (dialogRef) ->
              link.removeAttr "data-confirm"
              link.trigger "click.rails"
              dialogRef.close()
              return
          }
        ]
      false # always stops the action since code runs asynchronously