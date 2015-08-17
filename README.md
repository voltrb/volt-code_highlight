# Volt::CodeHighlight

A simple code highlighting component using highlight.js

## Usage

In your gemfile add:

```
gem 'volt-code_highlight'
```

In the component you wish to use it in, add to config/dependencies.rb

```
component 'code_highlight'
```

In a view, add something like:

```html
<:code_highlight>
<pre>
def some_code
  puts 'an example'
end
</pre>
</:code_highlight>
```

You can also specify a "language" attribute. (see https://highlightjs.org/download/ for the list of default included languages)

Lastly, you can include a binding and the code will dynamically update.

```html
<:code_highlight language="ruby">{{ page._some_code }}</:code_highlight>
```
