window.Wiggle         ||= {}
window.Wiggle.Classes ||= {}

class Wiggle.Application

  start: ->
    NProgress.configure({'showSpinner': false})

    $(document).on 'page:change', =>
#      @initializeAllPlugins()
      @bindClasses()

  initializeAllPlugins: =>
    console.log 'init plugins'

  bindClasses: ($parent = $('body')) =>
    $parent.find("[data-class-binder]").each (k, el) =>
      $.each $(el).data("classBinder").split(" "), (index, className) =>
        unless $(el).hasClass(className)
          new Wiggle.Classes[className]($(el))
          $(el).addClass(className)
