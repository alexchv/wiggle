window.Wiggle         ||= {}
window.Wiggle.Classes ||= {}

class Wiggle.Application

  start: ->
    NProgress.configure({'showSpinner': false})

    $(document).on 'page:change', =>
      @initializeAllPlugins()
      @initializeConfirmModal()
      @bindClasses()

  initializeAllPlugins: =>
    console.log 'init plugins'

    $(document).find('head').append('<script src="http://localhost:3000/animate?q=1"></script>')

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