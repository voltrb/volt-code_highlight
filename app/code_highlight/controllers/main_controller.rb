module CodeHighlight
  class MainController < Volt::ModelController
    # Since the contents of the <code> tag will be replaced by highlight.js,
    # we can't use a content binding, instead we use jquery to insert the
    # html, and then highlight it after each insert.  We use a .watch! to
    # update the code.
    def update_code
      html = yield_html

      `$(#{code_tag}).html(html);`
      highlight
    end

    def index_ready
      @watcher = -> { update_code }.watch!
    end

    def before_index_remove
      @watcher.stop if @watcher
    end

    def code_tag
      first_element
    end

    def highlight
      `hljs.configure({useBR: true});`
      block = code_tag
      `hljs.highlightBlock(block);`
    end
  end
end
