h1 New Pet

- if pet.errors
  ul.errors
    - pet.errors.each do |error|
      li = error.to_s

== form(action: "/pets", method: :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", placeholder: "Name", class: "form-control")
  .form-group
    == text_field(name: "breed", placeholder: "Breed", class: "form-control")
  .form-group
    == text_field(name: "age", placeholder: "Age", class: "form-control")

  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/pets", class: "btn btn-light btn-sm")
