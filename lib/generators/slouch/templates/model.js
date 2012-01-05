<%= application_name %> = (function($, public_) {
  public_.Models.<%= backbone_model_name %> = new Backbone.Model({
    paramRoot: "<%=  %>",

    defaults: {
      <% attributes.each do |attribute| %>
        <%= attribute.name %>: null
      <% end %>
    }

    return public_;
  })
})(jQuery, <%= application_name %>);
