class Wiggle.Classes.Animation
  constructor: (@$scope = $('body')) ->
    @animationPartialCollapse()

  animationPartialCollapse: ->
    @$scope.find('.anim-collapse').off('click').on 'click', =>
      $collapse_btn = $(event.currentTarget).find('span.glyphicon')

      if @$scope.hasClass('tab-opened')
        @$scope.removeClass('tab-opened')
        $collapse_btn.removeClass('glyphicon-chevron-up')
        $collapse_btn.addClass('glyphicon-chevron-down')
      else
        @$scope.addClass('tab-opened')
        $collapse_btn.addClass('glyphicon-chevron-up')
        $collapse_btn.removeClass('glyphicon-chevron-down')
