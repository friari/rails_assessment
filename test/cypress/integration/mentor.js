describe("Mentor create, view & delete", function () {
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
        cy.get("input[type='number']").type("200")
        cy.get('[type="checkbox"]').first().check()
        cy.get("textarea[name='mentor[about_me]'").type("Testing 1, 2, 3. I repeat. Testing 1, 2, 3. Is this thing on?")
        cy.get("input[value='Submit']").click()
        cy.location("pathname").should("eq", "/41/my_profile")
        cy.contains("Testing 1, 2, 3. I repeat. Testing 1, 2, 3. Is this thing on?").should("exist")
        });

        it("Edit mentor", function(){
        cy.visit("/mentors/new")
        cy.get("input[type='number']").type("200")
        cy.get('[type="checkbox"]').first().check()
        cy.get("textarea[name='mentor[about_me]'").type("Testing 1, 2, 3. I repeat. Testing 1, 2, 3. Is this thing on?")
        cy.get("input[value='Submit']").click()
        cy.visit("/mentors/21/edit")
        cy.get("input[type='number']").type("300")
        cy.get('[type="checkbox"]').last().check()
        cy.get("textarea[name='mentor[about_me]'").type("I am a very fun person")
        cy.get("input[value='Submit']").click()
        cy.location("pathname").should("eq", "/41/my_profile")
        });

        it("View Mentor", function(){
            cy.visit("/mentors")
            cy.get("a[class='stretched-link']").first().click()
            cy.contains("About Me").should("exist")
        });
});