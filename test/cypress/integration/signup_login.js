describe("Sign up & login using the UI", function() {
  before(function(){
    cy.app('clean')
    cy.app('seed')
  });
  
  var email = "clancy@jen.jen"
  var password = "test123"

  it("Sign Up succesfully", function() {
    cy.visit("/users/sign_up")
    cy.get("input[name='user[first_name]'").type("Test")
    cy.get("input[name='user[last_name]'").type("McTest")
    cy.get("input[name='user[email]']").type(email)
    cy.get("input[name='user[password]'").type(password)
    cy.get("input[name='user[password_confirmation]'").type(password)
    cy.get("input[name='user[date]'").type('2018-03-02')
    cy.get("input[name='user[contact_number]'").type('1111111111')
    cy.get("input[name='user[country]'").type('Australia')
    cy.get("input[name='user[state]'").type('NSW')
    cy.get("input[name='user[city]'").type('Sydney')
    cy.get("input[name='user[suburb]'").type('Leichhardt')
    cy.get("input[name='user[postcode]'").type('2000')
    cy.get("input[type='submit'").click()
    cy.location("pathname").should("eq", "/")
  });

  it("Login succesfully", function() {
    cy.visit("/users/sign_in")
    cy.get("input[name='user[email]']").type(email)
    cy.get("input[name='user[password]'").type(password)
    cy.get("input[type='submit'").click()
    cy.location("pathname").should("eq", "/")
  });

});