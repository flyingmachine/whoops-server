Whoops = {
  setupFilters: function() {
    $("#new_whoops_filter select").change(function(){
      $("#new_whoops_filter").ajaxSubmit({
        target: "#event-list"
      })
    })
  },
  
  setup: function() {
    this.setupFilters()
  }
}

$(function(){
  Whoops.setup();
})
