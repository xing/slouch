<%= application_name %> = (function($, public_) {

  public_.<%= backbone_collection_name %>.New = new Backbone.View ({

    events: {
      "submit #new-<%= rails_model_name %>": "create"
    },

    constructor: function(options) {
      super(options);
      this.model = new this.collection.model();
    },

    create: function(event) {
      var that = this;

      this.collection.create(this.model.toJSON(),
        success: (<%= rails_model_name %>) =>
          that.model = <%= rails_model_name %>
          window.location.hash = "/#{that.model.id}"

        error: (<%= rails_model_name %>, jqXHR) =>
          that.model.set({errors: $.parseJSON(jqXHR.responseText)})
      );
      event.preventDefault();
      event.stopPropagation();
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));

      this.$("form").backboneLink(this.model);

      return this;
    }
  });

  return public_;

})(jQuery, <%= application_name %>);
