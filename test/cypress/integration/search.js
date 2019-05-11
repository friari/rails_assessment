describe("searching", function() {
  beforeEach(function(){
    cy.app('clean')
    cy.app('seed')
    cy.visit("/users/sign_in")
    cy.get("input[name='user[email]']").type("test@test.com")
    cy.get("input[name='user[password]'").type("test123")
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/")
  });

  it("Search", function() {
    cy.visit("/mentors")
    cy.get('[type="checkbox"]').first().check()
    cy.get('[type="checkbox"]').last().check()
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/mentors/search")
  });

});