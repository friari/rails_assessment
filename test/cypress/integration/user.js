describe("User edit & delete", function() {
  beforeEach(function(){
    cy.app('clean')
    cy.app('seed')
    cy.visit("/users/sign_in")
    cy.get("input[name='user[email]']").type("test@test.com")
    cy.get("input[name='user[password]'").type("test123")
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/")

  });
  
  it("Edit user password", function() {
    cy.visit("/users/edit")
    cy.get("input[name='user[password]'").type("Password")
    cy.get("input[name='user[password_confirmation]'").type("Password")
    cy.get("input[name='user[current_password]'").type("test123")
    cy.get("input[value='Update']").click()
    cy.location("pathname").should("eq", "/")
  });

  it("Edit user account details", function() {
    cy.visit("/users/edit")
    cy.get("input[name='user[first_name]'").type("{selectall}Test")
    cy.get("input[name='user[last_name]'").type("{selectall}McTest")
    cy.get("input[name='user[email]']").type("{selectall}new@email.com")
    cy.get("input[name='user[current_password]'").type("Password")
    cy.get("input[value='Update']").click()
    cy.get("input[value='Test']").should("exist")
    cy.get("input[value='McTest']").should("exist")
    cy.get("input[value='new@email.com']").should("exist")
  });

  it("Delete user", function() {
    cy.visit("/users/edit")
    cy.get("input[value='Cancel my account']").click()
    cy.location("pathname").should("eq", "/")
  });

});