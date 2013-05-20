View     = require('/lib/view')
template = require('./templates/wikiList')
WikiList = require('./WikiCollection')

module.exports = class WikiListView extends View
  template: template,
  collection: WikiList,
  initialize: ->
    # that = this
    # this.template = Mustache.compile($(this.template)[0].innerHTML)
    # this.listenTo(this.collection, "add", this.render)
    # _.bindAll(this, 'render')
  render: ->
    console.log template({items:[1,2,.3,4,"l"]})

    return this
    # cTemplate = this.template(
    #   {
    #     posts:this.collection.toJSON(),
    #     linkToTitle: ->
    #       return "/wiki/"+ this.title + "-" + this.id
    #   })
    # $(this.el).html(cTemplate)
