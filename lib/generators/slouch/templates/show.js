<%= application_name %> = (function($, public_) {

  public_.Views.<%= backbone_collection_name %>.Show = new Backbone.View ({

    initialize: function() {
      _.bindAll(this, "render");
    },

    render: function() {
      $(this.el).html(this.template({model: this.model.toJSON()}));

      return this;
    }

  });

  return public_;

})(jQuery, <%= application_name %>);
