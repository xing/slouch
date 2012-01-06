<%= application_name %> = (function($, public_) {
  public_.Views.<%= backbone_collection_name %> = public_.Views.<%= backbone_collection_name %> || {};

  public_.Views.<%= backbone_collection_name %>.Edit = new Backbone.View ({

    events: {
      "submit #edit-<%= rails_model_name %>" : "update"
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));

      this.$("form").backboneLink(this.model);

      return this;
    },

    update: function(event) {
      var that = this;
      this.model.save(null,
        success : function(<%= rails_model_name %>) {
          that.model = <%= rails_model_name %>;
          // this might need to be changed to backbone navigate
          window.location.hash = "/#{that.model.id}";
        }
      );
      event.preventDefault();
      event.stopPropagation();
    }

  });

  return public_;

})(jQuery, <%= application_name %>);
