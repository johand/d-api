# frozen_string_literal: true

module Paginate
  def pagination(resource)
    current = resource.current_page
    total = resource.total_pages
    render json: { status: 200, resource:,
                   pagination: {
                     current:,
                     previous: (current > 1 ? (current - 1) : nil),
                     next: (current == total ? current : (current + 1)),
                     pages: total,
                     count: resource.total_count
                   } }
  end
end
