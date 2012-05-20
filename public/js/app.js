$(function() {
  Medical = {};
  Medical.App = Backbone.View.extend({
    initialize: function(){
      _.bindAll(this,'render');
    },
    render: function(){
      $(this.el).html('hello backbone');
      return this;
    }
  });

  Medical.app = new Medical.App();
  $(".app_container").html(Medical.app.render().el);
});
