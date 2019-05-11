describe("leave a review", function () {
  beforeEach(function(){
      cy.app('clean')
      cy.app('seed')
      cy.visit("/users/sign_in")
      cy.get("input[name='user[email]']").type("test@test.com")
      cy.get("input[name='user[password]'").type("test123")
      cy.get("input[type='submit']").click()
      cy.location("pathname").should("eq", "/")
  });

  it("leave a review", function() {
    cy.visit("/mentors")
    cy.get("a[class='stretched-link']").first().click()
    cy.get('button').last().click()
    cy.get("textarea[name='review[body]'").type("I am a very fun person")
    cy.get("input[type='submit']").click()
    cy.contains("I am a very fun person").should("exist")
  });
});