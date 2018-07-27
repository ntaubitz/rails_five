Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get 'linked_lists/sorted_insert' => 'linked_lists#sorted_insert'
  get 'linked_lists/delete_node' => 'linked_lists#delete_node'
end
