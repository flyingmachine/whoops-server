Whoops = {
  setupFilters: function() {
    $("#new_whoops_filter select").change(function(){
      $("#new_whoops_filter").submit()
    })
  },
  
  setup: function() {
    this.setupFilters()
  }
}

$(function(){
  Whoops.setup();
})
