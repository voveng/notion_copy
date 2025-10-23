# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: '@hotwired--stimulus.js' # @3.2.2
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@stimulus-components/dropdown', to: '@stimulus-components--dropdown.js' # @3.0.0
pin "stimulus-use" # @0.52.3
pin "sortablejs" # @1.15.6
pin "@rails/request.js", to: "https://cdn.jsdelivr.net/npm/@rails/request.js/dist/requestjs.js"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
