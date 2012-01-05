<%= application_name %> = (function($, public_) {
  public_.Collections.<%= backbone_collection_name %> = new Backbone.Collection({
    model: <%= backbone_model_name %>,
    url: "<%= collection_restful_url %>"

    return public_;
  })
})(jQuery, <%= application_name %>);
