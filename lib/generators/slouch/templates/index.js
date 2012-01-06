<%= application_name %> = (function($, public_) {
  public_.Views.<%= backbone_collection_name %> = public_.Views.<%= backbone_collection_name %> || {};

  public_.Views.<%= backbone_collection_name %>.Index = new Backbone.View ({
    initialize: function() {
      _.bindAll(this, "render");

      this.options.<%= backbone_collection_name %>.bind("reset");
    },

    render: function() {
      $(this.el).html(this.template(<%= backbone_collection_name %>: this.options.<%= backbone_collection_name %>.toJSON() ));

      return this;
    }

  });

  return public_;

})(jQuery, <%= application_name %>);
