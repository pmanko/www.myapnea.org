@affixSidebarReady = () ->
  $("body").scrollspy(target: '.myapnea-sidebar')
  $("body").scrollspy('refresh')

  $("#team .myapnea-sidebar").affix(100)
  $("#network .myapnea-sidebar").affix()
#    offset:
#    top: ->
##      c = b.offset().top
##      d = parseInt(b.children(0).css("margin-top"), 10)
##      e = a(".bs-docs-nav").height()
##      @top = c - e - d
#
#    bottom: ->
##      @bottom = a(".bs-docs-footer").outerHeight(not 0)
