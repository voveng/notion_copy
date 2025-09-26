# frozen_string_literal: true

module ApplicationHelper
  def t_icon(name, size: 18, color: 'text-gray-700', css_classes: 'text-gray-800', width: 1)
    tabler_icon(name, size: size, color: color, css_classes: css_classes, stroke_width: width)
  end
end
