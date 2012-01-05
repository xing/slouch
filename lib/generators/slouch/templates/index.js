class <%=  %>.IndexView extends Backbone.View
  initialize: function() {
    _.bindAll(this, "render", "removeLoadMoreButton");

    this.options.<%= backbone_collection_name %>.bind("reset");
  },

  render: function() {
    $(this.el).html(this.template(<%= backbone_collection_name %>: this.options.<%= backbone_collection_name %>.toJSON() ));

    return this;
  }

  return public_;

})
