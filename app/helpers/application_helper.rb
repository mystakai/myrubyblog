module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'My Ruby Blog'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def build_selections(prompt: "Select One", selections: {})
    selections.reverse!.push([prompt, nil]).reverse!
  end
end
