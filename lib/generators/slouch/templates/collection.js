<%= application_name %> = (function($, public_) {
  public_.Collections.<%= backbone_collection_name %> = new Backbone.Collection({
    model: <%= backbone_model_name %>,
    url: "<%= rails_collection_name %>"

    return public_;
  })
})(jQuery, <%= application_name %>);
