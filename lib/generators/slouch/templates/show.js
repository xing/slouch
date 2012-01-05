<%= application_name %> = (function($, public_) {

  public_.<%= backbone_collection_name %>.Show = new Backbone.View ({

    initialize: function() {
      _.bindAll(this, "render");
    },

    render: function() {
      $(this.el).html(this.template(<%= backbone_collection_name %>: this.options.<%= backbone_collection_name %>.toJSON() ));

      return this;
    }

  });

  return public_;

})(jQuery, <%= application_name %>);
