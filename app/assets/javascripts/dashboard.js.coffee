$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  title = element.data('confirm')
  message = element.data('description')
  # If there's no message, there's no data-confirm attribute,
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
  # We don't necessarily want the same styling as the original link/button.
  .removeAttr('class')
  # We don't want to pop up another confirmation (recursion)
  .removeAttr('data-confirm')
  # We want a button
  .addClass('btn').addClass('btn-danger')
  # We want it to sound confirmy
  .html("Yes, I'm positively certain.")

  # Create the modal box with the message
  modal_html = """
               <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content">
                     <div class="modal-header">
                       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                       <h4 class="modal-title" id="myModalLabel">#{title}</h4>
                     </div>
                     <div class="modal-body">
                       #{message}
                     </div>
                     <div class="modal-footer">
                       <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                   </div>
                 </div>
               </div>

               """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal()
  # Prevent the original link from working
  return false



#$(document).on "click", "#to-my-sleep", () ->
#  $("#my-surveys").hide()
#  $("#research-qs").hide()
#  $("#my-sleep").show()
#
#  false
#
#$(document).on "click", "#to-research-qs", () ->
#  $("#my-surveys").hide()
#  $("#my-sleep").hide()
#  $("#research-qs").show()
#  false
#
#$(document).on "click", "#to-my-surveys", () ->
#  $("#research-qs").hide()
#  $("#my-sleep").hide()
#  $("#my-surveys").show()
#  false

$(document).on "click", ".dashboard-target a", () ->
  targets = $(".dashboard-target a").map((i, e) -> $(e).data('target'))
  my_target = $(this).data("target")

  targets.each((i, e) ->
    $("#"+e).hide()
  )

  $("#"+my_target).show()

  $(".dashboard-target li").removeClass("active")
  $(this).parent().addClass("active")

  false