module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        parts << 'Tiqueteador'
        parts.join ' - '
      end
    end
  end
end
