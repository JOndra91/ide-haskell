class OutputPanelItemsView extends HTMLElement
  setModel: (@model) ->
    @model.onDidUpdate =>
      @filter @activeFilter

  filter: (@activeFilter) ->
    @innerHTML = ''
    @items = @model.filter @activeFilter
    for i in @items
      @appendChild atom.views.getView i

  showItem: (item) ->
    view = atom.views.getView item
    view.position.click()
    view.scrollIntoView
      block: "start"
      behavior: "smooth"

OutputPanelItemsElement =
  document.registerElement 'ide-haskell-panel-items',
    prototype: OutputPanelItemsView.prototype

module.exports = OutputPanelItemsElement