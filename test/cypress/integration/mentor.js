describe("Rails mentor CRUD", function(){
    describe("User edit & delete", function () {
        beforeEach(function(){
          cy.app('clean')
          cy.app('seed')
          cy.visit("/users/sign_in")
          cy.get("input[name='user[email]']").type("test@test.com")
          cy.get("input[name='user[password]'").type("test123")
          cy.get("input[type='submit']").click()
          cy.location("pathname").should("eq", "/")
      
        });

    it("Create a new mentor", function(){
        cy.visit("/mentors/new")
        cy.get("input[type='text']")
    });
});