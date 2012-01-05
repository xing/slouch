<%= backbone_model_name %> =  new Backbone.Model({
  paramRoot: "<%=  %>",

  defaults: {
    <% attributes.each do |attribute| %>
      <%= attribute.name %>: null
    <% end %>
  }

  return public_;
})
